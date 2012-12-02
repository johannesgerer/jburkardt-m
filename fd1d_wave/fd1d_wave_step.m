function u3 = fd1d_wave_step ( x_num, t, alpha, u_x1, u_x2, u1, u2 )

%*****************************************************************************80
%
%% FD1D_WAVE_STEP computes a step of the 1D wave equation.
%
%  Discussion:
%
%    This program solves the 1D wave equation of the form:
%
%      Utt = c^2 Uxx
%
%    over the spatial interval [X1,X2] and time interval [T1,T2],
%    with initial conditions:
%
%      U(T1,X)  = U_T1(X),
%      Ut(T1,X) = UT_T1(X),
%
%    and boundary conditions of Dirichlet type:
%
%      U(T,X1) = U_X1(T),
%      U(T,X2) = U_X2(T).
%
%    The value C represents the propagation speed of waves.
%
%    The program uses the finite difference method, and marches
%    forward in time, solving for all the values of U at the next
%    time step by using the values known at the previous two time steps.
%
%    Central differences may be used to approximate both the time
%    and space derivatives in the original differential equation.
%
%    Thus, assuming we have available the approximated values of U
%    at the current and previous times, we may write a discretized
%    version of the wave equation as follows:
%
%      Uxx(T,X) = ( U(T,   X+dX) - 2 U(T,X) + U(T,   X-dX) ) / dX^2
%      Utt(T,X) = ( U(T+dt,X   ) - 2 U(T,X) + U(T-dt,X   ) ) / dT^2
%
%    If we multiply the first term by C^2 and solve for the single
%    unknown value U(T+dt,X), we have:
%
%      U(T+dT,X) =        (     C^2 * dT^2 / dX^2 ) * U(T,   X+dX)
%                  +  2 * ( 1 - C^2 * dT^2 / dX^2 ) * U(T,   X   )
%                  +      (     C^2 * dT^2 / dX^2 ) * U(T,   X-dX)
%                  -                                  U(T-dT,X   )
%
%    (Equation to advance from time T to time T+dT, except for FIRST step!)
%
%    However, on the very first step, we only have the values of U
%    for the initial time, but not for the previous time step.
%    In that case, we use the initial condition information for dUdT
%    which can be approximated by a central difference that involves
%    U(T+dT,X) and U(T-dT,X):
%
%      dU/dT(T,X) = ( U(T+dT,X) - U(T-dT,X) ) / ( 2 * dT )
%
%    and so we can estimate U(T-dT,X) as
%
%      U(T-dT,X) = U(T+dT,X) - 2 * dT * dU/dT(T,X)
%
%    If we replace the "missing" value of U(T-dT,X) by the known values
%    on the right hand side, we now have U(T+dT,X) on both sides of the
%    equation, so we have to rearrange to get the formula we use
%    for just the first time step:
%
%      U(T+dT,X) =   1/2 * (     C^2 * dT^2 / dX^2 ) * U(T,   X+dX)
%                  +       ( 1 - C^2 * dT^2 / dX^2 ) * U(T,   X   )
%                  + 1/2 * (     C^2 * dT^2 / dX^2 ) * U(T,   X-dX)
%                  +  dT *                         dU/dT(T,   X   )
%
%    (Equation to advance from time T to time T+dT for FIRST step.)
%
%    It should be clear now that the quantity ALPHA = C * DT / DX will affect
%    the stability of the calculation.  If it is greater than 1, then
%    the middle coefficient 1-C^2 DT^2 / DX^2 is negative, and the
%    sum of the magnitudes of the three coefficients becomes unbounded.
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
%    Input, integer X_NUM, the number of nodes in the X direction.
%
%    Input, real T, the new time, that is, the current time + T_DELTA.
%
%    Input, real ALPHA, the stability coefficient, computed by FD1D_WAVE_ALPHA.
%
%    Input, real U_X1(T), U_X2(T), functions for the left and right boundary 
%    conditions.
%
%    Input, real U1(X_NUM), the solution at the old time.
%
%    Input, real U2(X_NUM), the solution at the current time.
%
%    Output, real U3(X_NUM), the solution at the new time.
%
  u3 = zeros ( 1, x_num );

  u3(1)         = u_x1 ( t );
  u3(2:x_num-1) =             alpha^2   * u2(3:x_num) ...
                  + 2 * ( 1 - alpha^2 ) * u2(2:x_num-1) ...
                  +           alpha^2   * u2(1:x_num-2) ...
                  -                       u1(2:x_num-1);
  u3(x_num)     = u_x2 ( t );

  return
end
