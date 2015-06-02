function jed = ymdf_to_jed_saka ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_SAKA converts a Saka YMDF date to a JED.
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
%    Output, real JED, the corresponding JED.
%

%
%  Convert the calendar date to a computational date.
%
  y_prime = y + 4794 - floor ( ( 13 - m ) / 12 );
  m_prime = mod ( m + 10, 12 );
  d_prime = d - 1;
%
%  Convert the computational date to a JED.
%
  j1 = floor ( ( 1461 * y_prime ) / 4 );

  z = floor ( m_prime / 6 );

  j2 = ( 31 - z ) * m_prime + 5 * z;

  g = floor ( ( y_prime + 184 ) / 100 );
  g = floor ( ( 3 * g ) / 4 ) - 36;

  jed = j1 + j2 + d_prime - 1348 - g - 0.5 + f;

  return
end