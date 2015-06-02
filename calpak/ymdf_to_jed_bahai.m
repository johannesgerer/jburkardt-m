function jed = ymdf_to_jed_bahai ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_BAHAI converts a Bahai YMDF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Algorithm E,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, pages 323-324.
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, real JED, the corresponding Julian Ephemeris Date.
%

%
%  Convert the calendar date to a computational date.
%
  y_prime = y + 6560 - floor ( ( 39 - m ) / 20 );
  m_prime = mod ( m, 20 );
  d_prime = d - 1;
%
%  Convert the computational date to a JED.
%
  j1 = floor ( ( 1461 * y_prime ) / 4 );

  j2 = 19 * m_prime;

  g = floor ( ( y_prime + 184 ) / 100 );
  g = floor ( ( 3 * g ) / 4 ) - 50;
  jed = j1 + j2 + d_prime - 1412 - g - 0.5;
  jed = jed + f;

  return
end
