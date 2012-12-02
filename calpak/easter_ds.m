function [ m, d ] = easter_ds ( y )

%*****************************************************************************80
%
%% EASTER_DS computes the month and day of Easter for a Gregorian year.
%
%  Example:
%
%    Input:
%
%      Y = 2000
%
%    Output:
%
%      M = 4
%      D = 23
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Duffett-Smith,
%    Practical Astronomy With Your Calculator,
%    Third Edition,
%    Cambridge University Press, 1996,
%    ISBN: 0-521-35699-7,
%    LC: QB62.5.D83.
%
%  Parameters:
%
%    Input, integer Y, the year, which must be 1583 or greater.
%    (The formula is only valid for years after the Gregorian calendar
%    was adopted.)
%
%    Output, integer M, D, the month and day of Easter.
%
  if ( y <= 0 )
    m = -1;
    d = -1;
    return
  end

  a = year_to_golden_number ( y );

  a = a - 1;

  b = floor ( y / 100 );
  c = mod ( y, 100 );

  dd = floor ( b / 4 );
  e = mod ( b, 4 );

  f = floor ( ( b + 8 ) / 25 );
  g = floor ( ( b - f + 1 ) / 3 );
  h = mod ( 19 * a + b - dd - g + 15, 30 );

  i = floor ( c / 4 );
  k = mod ( c, 4 );

  l = mod ( 32 + 2 * e + 2 * i - h - k, 7 );
  mm = floor ( ( a + 11 * h + 22 * l ) / 451 );

  m = floor ( ( h + l - 7 * mm + 114 ) / 31 );
  d = mod ( h + l - 7 * mm + 114, 31 ) + 1;

  return
end
