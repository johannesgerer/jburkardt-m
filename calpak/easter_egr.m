function [ m, d ] = easter_egr ( y )

%*****************************************************************************80
%
%% EASTER_EGR computes the month and day of Easter for a Common year.
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
%    Algorithm O,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 375.
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

  p = y + floor ( y / 4 ) - floor ( y / 100 ) + floor ( y / 400 ) - 1;
  n = 7 - mod ( p, 7 );
  h = floor ( y / 100 );
  q = h - floor ( h / 4 );
  g = 1 + mod ( y, 19 );
  e = mod ( 57 + 11 * g - q + floor ( ( h - floor ( ( h - 17 ) / 25 ) ) / 3 ), 30 );
  u = mod ( 53 - e, 30 );
  vp = floor ( ( g - 1 + 11 * u ) / 319 );
  r = 22 + u - vp;
  c = i4_wrap ( r + 3, 1, 7 );
  s = r + mod ( 7 + n - c, 7 );

  m = 3 + floor ( s / 32 );
  d = i4_wrap ( s, 1, 31 );

  return
end
