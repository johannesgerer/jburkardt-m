function value = square_volume ( a, b )

%*****************************************************************************80
%
%% SQUARE_VOLUME: volume of a square in 2D.
%
%  Discussion:
%
%    The integration region is defined as:
%      A(1) <= X <= B(1)
%      A(2) <= Y <= B(2)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(2), B(2), the lower and upper limits.
%
%    Output, real VALUE, the volume.
%
  value = ( b(1) - a(1) ) * ( b(2) - a(2) );

  return
end
