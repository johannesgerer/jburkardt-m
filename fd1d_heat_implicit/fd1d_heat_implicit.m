function u = fd1d_heat_implicit ( a, x_num, x, t, dt, cfl, rhs_fun, bc_fun, u )

%*****************************************************************************80
%
%% FD1D_HEAT_IMPLICIT: Finite difference solution of 1D heat equation.
%
%  Discussion:
%
%    FD1D_HEAT_IMPLICIT solves the 1D heat equation with an implicit method.
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
%    second derivative in space, and an implicit backward Euler approximation
%    to the first derivative in time.
%
%    The finite difference form can be written as
%
%      U(X,T+dt) - U(X,T)                  ( U(X-dx,T+dt) - 2 U(X,T+dt) + U(X+dx,T+dt) )
%      ------------------ = F(X,T+dt) + k *  --------------------------------------
%               dt                                   dx * dx
%
%    so that we have the following linear system for the values of U at time T+dt:
%
%            -     k * dt / dx / dx   * U(X-dt,T+dt)
%      + ( 1 + 2 * k * dt / dx / dx ) * U(X,   T+dt)
%            -     k * dt / dx / dx   * U(X+dt,T+dt)
%      =               dt             * F(X,   T+dt)
%      +                                U(X,   T)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
  fvec = rhs_fun ( x_num, x, t );

  b(1:x_num,1) = u(1:x_num,1);
  b(2:x_num-1,1) = b(2:x_num-1,1) + dt * fvec(2:x_num-1,1);

  u(1:x_num,1) = a \ b(1:x_num,1);

  u = bc_fun ( x_num, x, t, u );

  return
end
