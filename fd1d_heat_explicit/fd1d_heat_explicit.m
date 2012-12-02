function h_new = fd1d_heat_explicit ( x_num, x, t, dt, cfl, rhs, bc, h )

%*****************************************************************************80
%
%% FD1D_HEAT_EXPLICIT: Finite difference solution of 1D heat equation.
%
%  Discussion:
%
%    This program takes one time step to solve the 1D heat equation 
%    with an explicit method.
%
%    This program solves
%
%      dUdT - k * d2UdX2 = F(X,T)
%
%    over the interval [A,B] with boundary conditions
%
%      U(A,T) = UA(T),
%      U(B,T) = UB(T),
%
%    over the time interval [T0,T1] with initial conditions
%
%      U(X,T0) = U0(X)
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
%    31 January 2012
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
%    Input, integer X_NUM, the number of points to use in the spatial dimension.
%
%    Input, real X(X_NUM,1), the coordinates of the nodes.
%
%    Input, real T, the current time.
%
%    Input, real DT, the size of the time step.
%
%    Input, real CFL, the Courant-Friedrichs-Loewy coefficient,
%    computed by FD1D_HEAT_EXPLICIT_CFL.
%
%    Input, real H(X_NUM,1), the solution at the current time.
%
%    Input, @RHS, the function which evaluates the right hand side.
%
%    Input, @BC, the function which evaluates the boundary conditions.
%
%    Output, real H_NEW(X_NUM,1), the solution at time T+DT.
%
  h_new = zeros(x_num,1);

  L = 1 : x_num - 2;
  C = 2 : x_num - 1;
  R = 3 : x_num;

  f = rhs ( x_num, x, t );

  h_new(C) = h(C) + cfl * ( h(L) - 2.0 * h(C) + h(R) ) + dt * f(C);

  h_new = bc ( x_num, x, t + dt, h_new );

  return
end

