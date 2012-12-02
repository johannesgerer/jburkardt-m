function cfl = fd1d_heat_explicit_cfl ( k, t_num, t_min, t_max, x_num, ...
  x_min, x_max )

%*****************************************************************************80
%
%% FD1D_HEAT_EXPLICIT_CFL: compute the Courant-Friedrichs-Loewy coefficient.
%
%  Discussion:
%
%    The equation to be solved has the form:
%
%      dUdT - k * d2UdX2 = F(X,T)
%
%    over the interval [X_MIN,X_MAX] with boundary conditions
%
%      U(X_MIN,T) = U_X_MIN(T),
%      U(X_MIN,T) = U_X_MAX(T),
%
%    over the time interval [T_MIN,T_MAX] with initial conditions
%
%      U(X,T_MIN) = U_T_MIN(X)
%
%    The code uses the finite difference method to approximate the
%    second derivative in space, and an explicit forward Euler approximation
%    to the first derivative in time.
%
%    The finite difference form can be written as
%
%      U(X,T+dt) - U(X,T)                  ( U(X-dx,T) - 2 U(X,T) + U(X+dx,T) )
%      ------------------  = F(X,T) + k *  ------------------------------------
%               dt                                   dx * dx
%
%    or, assuming we have solved for all values of U at time T, we have
%
%      U(X,T+dt) = U(X,T) + cfl * ( U(X-dx,T) - 2 U(X,T) + U(X+dx,T) ) + dt * F(X,T) 
%
%    Here "cfl" is the Courant-Friedrichs-Loewy coefficient:
%
%      cfl = k * dt / dx / dx
%
%    In order for accurate results to be computed by this explicit method,
%    the CFL coefficient must be less than 0.5!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 January 2012
%
%  Author:
% 
%    John Burkardt
%
%  Reference:
%
%    George Lindfield, John Penny,
%    Numerical Methods Using MATLAB,
%    Second Edition,
%    Prentice Hall, 1999,
%    ISBN: 0-13-012641-1,
%    LC: QA297.P45.
%
%  Parameters:
%
%    Input, real K, the heat conductivity coefficient.
%
%    Input, integer T_NUM, the number of time values, including the initial
%    value.
%
%    Input, real T_MIN, T_MAX, the minimum and maximum times.
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real X_MIN, X_MAX, the minimum and maximum spatial coordinates.
%
%    Output, real CFL, the Courant-Friedrichs-Loewy coefficient.
%
  x_step = ( x_max - x_min ) / ( x_num - 1 );
  t_step = ( t_max - t_min ) / ( t_num - 1 );
%
%  Check the CFL condition, print out its value, and quit if it is too large.
%
  cfl = k * t_step / x_step / x_step;

  if ( 0.5 <= cfl )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FD1D_HEAT_EXPLICIT_CFL - Fatal error!\n' );
    fprintf ( 1, '  CFL condition failed.\n' );
    fprintf ( 1, '  0.5 <= K * dT / dX / dX = %f\n', cfl );
    error ( 'FD1D_HEAT_EXPLICIT_CFL - Fatal error!' );
  end

  return
end
