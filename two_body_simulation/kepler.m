function up = kepler ( t, u )

%*****************************************************************************80
%
%% KEPLER evaluates the right hand side of the Kepler ODE system.
%
%  Discussion:
%
%    The Kepler ODE system has the form
%
%      u' = kepler ( t, u )
%
%    where u is a vector of length 4 whose components are the position
%    and velocity of a small body orbiting a massive one.
%
%      u = [ x(t), x'(t), y(t), y'(t) ]
%      
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November
%
%  Parameters:
%
%    Input, real T, the current time.
%
%    Input, real U(4), the current state.
%
%    Output, real UP(4), the derivative of the current state.
%
  r3 = ( u(1)^2 + u(3)^2 ) ^ 1.5;

  up = [  u(2)       ;...
         -u(1) / r3  ;...
          u(4)       ;...
         -u(3) / r3 ];

  return
end
