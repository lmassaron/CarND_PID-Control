#include <uWS/uWS.h>
#include <iostream>
#include "json.hpp"
#include "PID.h"
#include <math.h>

// for convenience
using json = nlohmann::json;

// For converting back and forth between radians and degrees.
constexpr double pi() { return M_PI; }
double deg2rad(double x) { return x * pi() / 180; }
double rad2deg(double x) { return x * 180 / pi(); }

// Checks if the SocketIO event has JSON data.
// If there is data the JSON object in string format will be returned,
// else the empty string "" will be returned.
std::string hasData(std::string s) {
  auto found_null = s.find("null");
  auto b1 = s.find_first_of("[");
  auto b2 = s.find_last_of("]");
  if (found_null != std::string::npos) {
    return "";
  }
  else if (b1 != std::string::npos && b2 != std::string::npos) {
    return s.substr(b1, b2 - b1 + 1);
  }
  return "";
}

int main(int argc, char* argv[])
{
  uWS::Hub h;
  
  PID pid;
  PID pid_throttle;
  
  // Initializing kp, ki, kd and target speed with the best values found
  double kp = 0.10050;
  double ki = 0.00014;
  double kd = 0.93490;
  double target_speed = 50;
  
  // Setting a time limit to the program runtime (for optimization purposes)
  int sample_number = 0;
  int sample_limit = 0;
  
  // Reading command line arguments in order to override default values
  // thus the PID can run with custom parameters for steering
  if (argc >= 5) {
	kp = std::stod(argv[1]);
    ki = std::stod(argv[2]);
    kd = std::stod(argv[3]);
	target_speed = std::stod(argv[4]);
	std::cout << "kp: " << ki << " ki: " << ki << " kd: " << kd << std::endl;
  }
  
  if (argc == 6) {
	sample_limit = std::stod(argv[5]);
	std::cout << "program will stop after " << sample_limit << " samples" << std::endl;
  }
  
  // Initializing the pid variable for steering and throttle
  pid.Init(kp, ki, kd);
  pid_throttle.Init(0.5, 0.00, 1.0);

  h.onMessage([&pid_throttle, &pid, &target_speed, &sample_number, &sample_limit](uWS::WebSocket<uWS::SERVER> ws, char *data, size_t length, uWS::OpCode opCode) {
    // "42" at the start of the message means there's a websocket message event.
    // The 4 signifies a websocket message
    // The 2 signifies a websocket event
    if (length && length > 2 && data[0] == '4' && data[1] == '2')
    {
      auto s = hasData(std::string(data));
      if (s != "") {
        auto j = json::parse(s);
        std::string event = j[0].get<std::string>();
        if (event == "telemetry") {
          // j[1] is the data JSON object
          double cte = std::stod(j[1]["cte"].get<std::string>());
          double speed = std::stod(j[1]["speed"].get<std::string>());
          double angle = std::stod(j[1]["steering_angle"].get<std::string>());
          double steer_value;
		  double throttle_value;
		  double speed_correction=1.0; // Dummy constant, to be later used in a more smart way :-)
		  
          /*
          * Calculating steering value here,
		  * the steering value is [-1, 1].
          * NOTE: Feel free to play around with the throttle and speed. Maybe use
          * another PID controller to control the speed!
          */
		
		  sample_number += 1;
		  if ((sample_limit > 0) && (sample_number > sample_limit)) {
		          // reset if the sample limit has been reached
				  std::string msg("42[\"reset\", {}]");
				  ws.send(msg.data(), msg.length(), uWS::OpCode::TEXT);
				  // exit completely from the controller
				  // i guess this should be done more gracefully?
				  std::exit(0);
		  }
		  
		  std::cout << "Sample number: " << sample_number << std::endl;
		  std::cout << "Steering PID > ";
          pid.UpdateError(cte);
		  
		  steer_value = std::min(std::max(-pid.TotalError(),-1.0), 1.0);
		  		  		  
		  std::cout << "Throttle PID > ";
		  pid_throttle.UpdateError(speed-(target_speed * speed_correction));
		  throttle_value = (speed-pid_throttle.TotalError()) / 100.;
		  // Forcing the throttle value in the [-1,+1] range
		  throttle_value = std::min(std::max(throttle_value,-1.0), 1.0);
		  
		  // Brakes are used if the car is experiencing large tracking error, 
		  // strong steering angle and speed above 30 mph
		  if (fabs(cte) > 0.6 && fabs(angle) > 5.0 && speed > 30.0) {
		  	  throttle_value = -1.0;
		  }
		  
		  std::cout << std::setprecision(3) <<"Speed: " << speed << " Target: " << speed-(target_speed * speed_correction) << std::endl;
          std::cout << std::setprecision(3) <<"CTE: " << cte << " Steering Value: " << steer_value << " Throttle value: " << throttle_value << std::endl;

          json msgJson;
          msgJson["steering_angle"] = steer_value;
          msgJson["throttle"] = throttle_value;
          auto msg = "42[\"steer\"," + msgJson.dump() + "]";
          std::cout << msg << std::endl;
          ws.send(msg.data(), msg.length(), uWS::OpCode::TEXT);
        }
      } else {
        // Manual driving
        std::string msg = "42[\"manual\",{}]";
        ws.send(msg.data(), msg.length(), uWS::OpCode::TEXT);
      }
    }
  });

  // We don't need this since we're not using HTTP but if it's removed the program
  // doesn't compile :-(
  h.onHttpRequest([](uWS::HttpResponse *res, uWS::HttpRequest req, char *data, size_t, size_t) {
    const std::string s = "<h1>Hello world!</h1>";
    if (req.getUrl().valueLength == 1)
    {
      res->end(s.data(), s.length());
    }
    else
    {
      // i guess this should be done more gracefully?
      res->end(nullptr, 0);
    }
  });

  h.onConnection([&h](uWS::WebSocket<uWS::SERVER> ws, uWS::HttpRequest req) {
    std::cout << "Connected!!!" << std::endl;
  });

  h.onDisconnection([&h](uWS::WebSocket<uWS::SERVER> ws, int code, char *message, size_t length) {
    ws.close();
    std::cout << "Disconnected" << std::endl;
  });

  int port = 4567;
  if (h.listen(port))
  {
    std::cout << "Listening to port " << port << std::endl;
  }
  else
  {
    std::cerr << "Failed to listen to port" << std::endl;
    return -1;
  }
  h.run();
}
