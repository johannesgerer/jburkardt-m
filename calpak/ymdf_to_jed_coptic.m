function jed = ymdf_to_jed_coptic ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_COPTIC converts a Coptic YMDF date to a JED.
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
  y_prime = y + 4996 - floor ( ( 13 - m ) / 13 );
  m_prime = mod ( m + 12, 13 );
  d_prime = d - 1;
%
%  Convert the computational date to a JED.
%
  jed = floor ( ( 1461 * y_prime ) / 4 ) + 30 * m_prime + d_prime - 124 - 0.5;
  jed = jed + f;

  return
end
