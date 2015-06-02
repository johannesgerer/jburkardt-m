function value = line_volume ( a, b )

%*****************************************************************************80
%
%% LINE_VOLUME: volume of a line segment in 1D.
%
%  Discussion:
%
%    The integration region is:
%    A <= X <= B
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
%    Input, real A, B, the lower and upper limits.
%
%    Output, real VALUE, the volume.
%
  value = b - a;

  return
end