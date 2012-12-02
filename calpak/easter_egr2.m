function [ m, d ] = easter_egr2 ( y )

%*****************************************************************************80
%
%% EASTER_EGR2 computes the month and day of Easter for a Common year.
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
%    Edward Richards,
%    Algorithm P,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 376.
%
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, integer M, D, the month and day of Easter.
%
  if ( y <= 0 )
    m = -1;
    d = -1;
    return
  end

  a = floor ( y / 100 );
  b = a - floor ( a / 4 );
  c = mod ( y, 19 );
  d = mod ( 15 + 19 * c + b - floor ( ( a - floor ( ( a - 17 ) / 25 ) ) / 3 ), 30 );
  e = d - floor ( ( c + 11 * d ) / 319 );
  s = 22 + e + mod ( 140004 - y - floor ( y / 4 ) + b - e, 7 );

  m = 3 + floor ( s / 32 );
  d = i4_wrap ( s, 1, 31 );

  return
end
