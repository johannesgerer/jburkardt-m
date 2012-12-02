function gamma = angle_shift_deg ( alpha, beta )

%*****************************************************************************80
%
%% ANGLE_SHIFT_DEG shifts angle ALPHA to lie between BETA and BETA+360.
%
%  Discussion:
%
%    The input angle ALPHA is shifted by multiples of 360 to lie
%    between BETA and BETA+360.
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
%    Input, real ALPHA, the angle to be shifted, in degrees.
%
%    Input, real BETA, defines the lower endpoint of
%    the angle range.
%
%    Output, real GAMMA, the shifted angle.
%
  if ( alpha < beta ) 
    gamma = beta - mod ( beta - alpha, 360.0 ) + 360.0;
  else
    gamma = beta + mod ( alpha - beta, 360.0 );
  end

  return
end
