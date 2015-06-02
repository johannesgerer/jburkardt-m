function jed = ymdf_to_jed_syrian ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_SYRIAN converts a Syrian YMDF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2013
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
  y_prime = y + 4405 - floor ( ( 17 - m ) / 12 );
  m_prime = mod ( m + 6, 12 );
  d_prime = d - 1;
%
%  Convert the computational date to a JED.
%
  j1 = floor ( ( 1461 * y_prime ) / 4 );

  j2 = floor ( ( 153 * m_prime + 2 ) / 5 );

  jed = j1 + j2 + d_prime - 1401  - 0.5 + f;

  return
end