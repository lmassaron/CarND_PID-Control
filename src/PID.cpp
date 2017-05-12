#include "PID.h"
#include <iostream>
#include <math.h>

using namespace std;

/*
* The complete PID class.
*/

PID::PID() {}

PID::~PID() {}

void PID::Init(double Kp, double Ki, double Kd) {
  /*
  * Setting errors to zero
  */
  p_error_ = 0.0;
  i_error_ = 0.0;
  d_error_ = 0.0;
  previous_cte_= 0.0;
  total_squared_error = 0.0;
  cumulative_abs_error = 0.0;
  count = 0.0;

  /*
  * Initializing coefficients
  */ 
  PID::Kp = Kp; // Proportional coefficient
  PID::Ki = Ki; // Integral coefficient
  PID::Kd = Kd; // Differential coefficient
}

void PID::UpdateError(double cte) {
	// counting the number of updates for the MSE
	count += 1;
	// cumulating the squared error
	total_squared_error += p_error_ * p_error_;
	// cumulating the absolute error
	cumulative_abs_error += fabs(cte);
    p_error_ = cte; // proportional cte
    d_error_ = cte - previous_cte_; // differential cte 
	// When there is no previous cte, d_error_ is set to cte
    i_error_ += cte; // integral cte
	// Storing away the present cte
    previous_cte_ = cte;
	// DEBUG: outputting parameters and errors
	cout << "p: " << p_error_ << " d: " << d_error_ << " i: " << i_error_ << " MSE: " << total_squared_error / count << " CAE: " << cumulative_abs_error << endl;
}

double PID::TotalError() {
	// Computing the total error (to be used for correction)
    return Kp * p_error_ + Kd * d_error_ + Ki * i_error_;
}

