function [ m, d ] = easter_stewart ( y )

%*****************************************************************************80
%
%% EASTER_STEWART computes the month and day of Easter for a Gregorian year.
%
%  Example:
%
%    Y = 2001
%
%    A = 6
%    B = 20
%    C = 1
%    DD = 5
%    E = 0
%    G = 6
%    H = 18
%    MM = 0
%    J = 0
%    K = 1
%    L = 6
%    M = 4
%    D = 15
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Thomas O'Beirne,
%    Puzzles and Paradoxes,
%    Oxford University Press, 1965.
%
%    Ian Stewart,
%    Easter is a Quasicrystal,
%    Scientific American,
%    March 2001, pages 80-83.
%
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, integer M, D, the month and day of Easter.
%
  a = mod ( y, 19 );
  b = floor ( y / 100 );
  c = mod ( y, 100 );
  dd = floor ( b / 4 );
  e = mod ( b, 4 );
  g = floor ( ( 8 * b + 13 ) / 25 );
  h = mod ( 19 * a + b - dd - g + 15, 30 );
  mm = floor ( ( a + 11 * h ) / 319 );
  j = floor ( c / 4 );
  k = mod ( c, 4 );
  l = mod ( 2 * e + 2 * j - k - h + mm + 32, 7 );

  m = floor ( ( h - mm + l + 90 ) / 25 );
  d = mod ( h - mm + l + m + 19 , 32 );

  return
end
