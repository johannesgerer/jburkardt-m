function value = pyramid_grid_size ( n )

%*****************************************************************************80
%
%% PYRAMID_GRID_SIZE sizes a pyramid grid.
%
%  Discussion:
%
%    0:  x
%
%    1:  x  x
%        x  x
%
%    2:  x  x  x
%        x  x  x
%        x  x  x
%
%    3:  x  x  x  x
%        x  x  x  x
%        x  x  x  x
%        x  x  x  x
%
%    N  Size
%
%    0     1
%    1     5 = 1 + 4
%    2    14 = 1 + 4 + 9
%    3    30 = 1 + 4 + 9 + 16
%    4    55 = 1 + 4 + 9 + 16 + 25
%    5    91 = 1 + 4 + 9 + 16 + 25 + 36
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%
%    Output, integer VALUE, the number of
%    nodes in the grid of size N.
%
  np1 = n + 1;

  value = ( np1 * ( np1 + 1 ) * ( 2 * np1 + 1 ) ) / 6;

  return
end