function gamma = angle_shift ( alpha, beta )

%*****************************************************************************80
%
%% ANGLE_SHIFT shifts angle ALPHA to lie between BETA and BETA+2PI.
%
%  Discussion:
%
%    The input angle ALPHA is shifted by multiples of 2 * PI to lie
%    between BETA and BETA+2*PI.
%
%    The resulting angle GAMMA has all the same trigonometric function
%    values as ALPHA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the angle to be shifted.
%
%    Input, real BETA, defines the lower endpoint of
%    the angle range.
%
%    Output, real GAMMA, the shifted angle.
%
  if ( alpha < beta )
    gamma = beta - mod ( beta - alpha, 2.0 * pi ) + 2.0 * pi;
  else
    gamma = beta + mod ( alpha - beta, 2.0 * pi );
  end

  return
end
