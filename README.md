# CarND-Controls-PID
Self-Driving Car Engineer Nanodegree Program

---

## Dependencies

* cmake >= 3.5
 * All OSes: [click here for installation instructions](https://cmake.org/install/)
* make >= 4.1
  * Linux: make is installed by default on most Linux distros
  * Mac: [install Xcode command line tools to get make](https://developer.apple.com/xcode/features/)
  * Windows: [Click here for installation instructions](http://gnuwin32.sourceforge.net/packages/make.htm)
* gcc/g++ >= 5.4
  * Linux: gcc / g++ is installed by default on most Linux distros
  * Mac: same deal as make - [install Xcode command line tools]((https://developer.apple.com/xcode/features/)
  * Windows: recommend using [MinGW](http://www.mingw.org/)
* [uWebSockets](https://github.com/uWebSockets/uWebSockets) == 0.13, but the master branch will probably work just fine
  * Follow the instructions in the [uWebSockets README](https://github.com/uWebSockets/uWebSockets/blob/master/README.md) to get setup for your platform. You can download the zip of the appropriate version from the [releases page](https://github.com/uWebSockets/uWebSockets/releases). Here's a link to the [v0.13 zip](https://github.com/uWebSockets/uWebSockets/archive/v0.13.0.zip).
  * If you run OSX and have homebrew installed you can just run the ./install-mac.sh script to install this
* Simulator. You can download these from the [project intro page](https://github.com/udacity/CarND-PID-Control-Project/releases) in the classroom.

## Basic Build Instructions

Dowload from the releases page of the project repo (https://github.com/udacity/CarND-PID-Control-Project/releases) the version of the simualtor suitable for your system. You should download the most recent version. Run it choosing a low resolution and minimum graphic detail (in order to have the most frequent samples from the telemetry) and make it operate in autonoumous mode (thus listening to PID's instructions and providing feedback).

1. Clone this repo.
2. Make a build directory: `./build.sh`
3. Enter build directory: `cd build`
4. Run it: `./pid`. 

## Project Instructions and Reflections

### How PID works

a PID controller (PID is short for proportional–integral–derivative controller) is commonly used to control systems by operating on them by a feedback mechanism. The system return a feedback to the PID, such as an error measure, and the PID operates on the system some correction based on the elaboration of such feedback.
PID controllers originated in 19th century for boat speed governor design. At our days PID controllers can be found in ovens and furnaces in industrial heat treatment or in pumps moving fluid in order to achieve consistent output even in case of variable input.

The feedback, as an error, is commonly the difference between a desired setpoint and the actual measured value and in self driving car applications where the problem is to follow a track is indicated as CTE (Cross Track Error, the distance between the reference trajectory and the car). The correction operated on the basis of the CTE, is composed of three parts: proportional, integral, and derivative terms (sometimes denoted P, I, and D respectively) which give their name to the controller type.

P, proportional control, provides a correction factor proportional to the CTE. The problem is that as the CTE being corrected approaches zero, so too does the correction, with the result that the error never really goes down to zero. On the other hand, if the correction is too strong, the correction may overshot and create a contrary error:

• High P correction:
	• More capable of adjusting the error
	• Higher overshot
	
• Low P correction
	• Less sensitivity
	• Less capable of adjusting the error

I, integral control, is a summation of the errors cumulated along time. Since some systematic bias may exist when applying corrections (for istance the steering is not executed precisely right), the summation may point out how the bias is contributing to the error generation and help annulating it by applying the correct correction: 

• High I correction:
	• More oscillatory
	• Faster reduction of cumulated error
	
• Low I correction
	• Less oscillatory
	• Slower reduction of cumulated error

D, derivative control, looks at the rate of change of the error, and adds an instantaneous value to the loop output that is proportional to the rate of change of the error. As an effect, it reduces the oscillatory behaviour and countereffects the overshot of the response due to P because it can anticipates how the error is changing by using its rate of change.

• High D correction:
	• Overdamped
	• It will take a long time to correct
	
• Low D correction
	• Underdamped
	• Still somehow oscillatory

Each of these controls is weighted by a coefficient (namely, Kp, Ki, Kd). All the weighted controls summed result in the total error, which can be used to countereffect (by changing its sign) the CTE feedback. The success of the PID in controlling CTE and having the car in the simulator stay on track depends on the successful definition of the numeic values the 

You can watch this [video](https://www.youtube.com/watch?v=4Y7zG48uHRo) from AerospaceControlsLab to understand more about PID tuning. 

### Running the program
the PID code has been modified to have the PID operate both with no arguments (as the project requires), using previously set coefficients and with arguments in order to set new coefficents and be able to run experiments using the simulator. 

When operating the PID with coefficients, the PID can accept 4 compulsory parameters (Kp, Ki, Kd and desired speed) and an optional one pointing out how many telemetry samples it can accept before resetting the simulator to the starting point (in case it is not provided or a number below or equal to zero being provided, the PID will continue to operate untill manually stopped).

There is another PID at work in the simulator, a PID controlling the throttle (providing the correct acceleration and speed), but its coeficents have been set anc cannot be changed as cannot be changed the settings for the braking controller which will activate under high levels of CTE, steering angle and velocity in order to prevent the car going out of track because taking a curve at too high speed (it is kind of safety control).

USAGE: ./pid [Kp Ki Kd speed] [samples]

# Tuning the PID

there are quite a few ways to find the correct values of the Kp, Ki and Kd coefficients. The traditional ones, base on hand tuning can be found on http://en.wikipedia.org/wiki/PID_controller#Manual_tuning. There are also some other ways, based on Ziegler–Nichols’ Tuning procedure, Gradient Descent, Simulated annealing, Coordinate Ascent. Coordinate Ascent, or Twiddle, as sometimes it is called, was used in Stanford's robot "Stanley" - an autonomous car, who won DARPA Grand Challenge 2005 and which Sebastian Thrun partecipated in the creation (http://robots.stanford.edu/papers/thrun.stanley05.pdf).

If you want to know in a more hands-on way about tuning PID controllers, you can read this [tutorial](https://udacity-reviews-uploads.s3.amazonaws.com/_attachments/41330/1493863065/pid_control_document.pdf) from Udacity

In order to operate a systematical tuning procedure, I implemented a scritp in a Python notebook capable of running the PID program using specific coefficients, for a pre-determined amount of telemetry samples, catching outputs from stdout and tuning its parameters by means of Twiddle algorithm and finally producing plots of the behaviour of the three controllers (P,I and D) in order to figure out how they behaved in the simulation.

This script can run using the command:

jupyter notebook tuning.ipynb

and following the described steps inside the notebook.

# Reflections

My solution to efficacely tuning the PID coefficients started by deciding at what speed the optimization should happen and for what part of the track. Each speed implies a different possible intervation on the car's course given the fact that telemetry is provided at fixed time intervals. Higher speeds require more reactivity, thus the best coefficients correctly change.

I decided to optimize at 50 mph and to optimize for all the track. The measure used for evaluating the fitness of the coefficients has been the mean squared CTE, a measure that penalizes the presence of high CTE reported during the track.

At first I proceed tuning by hand, first setting all the coefficients to zero and raising the P value until the car stayed on track in a oscillatory way, then increasing the D value in order to countereffect the oscillations and stabilize the car. I repeated these cycles raising first the value of P by small amounts, then raising D in order to stabilize it. I tested this on the straight part of the track. When I found out that I could efficacelity repeat the procedure (the MSE didn't improve), I just started raising the value of I until the MSE kept on decreasing. That provided me a good initial guess for the Twiddle algorithm.

In fact Sebastian Thrun et alii reported:

"The learning algorithm is now implemented
through coordinate ascent. In the outer loop, the algorithm
performs coordinate ascent relative to a
data-driven scoring function. Given an initial guess,
the coordinate ascent algorithm modifies each parameter
one after another by a fixed amount. It then
determines if the new value constitutes an improvement
over the previous value when evaluated over a
logged data set, and retains it accordingly. If for a
given interval size no improvement can be found,
the search interval is cut in half and the search is
continued, until the search interval becomes smaller
than a preset minimum search interval (at which
point the tuning is terminated)."

Thrun, Sebastian, et al. "Stanley: The robot that won the DARPA Grand Challenge." Journal of field Robotics 23.9 (2006): 661-692.

My initial rough manual setting provided me with initial guess. Then I run the Twiddle, using as initial intervals the exact half of the found coefficients. Moreover, when the Twiddle was correct in changing the coefficients, I increased the search intervals by 10% (as done in the Udacity lesson), otherwise if it failed I halved it.

When the optimization has been completed, I plotted the quantity of correction produced by each single controller, in order to evidence performances and possible problems.






