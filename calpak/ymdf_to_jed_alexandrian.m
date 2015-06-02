function jed = ymdf_to_jed_alexandrian ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_ALEXANDRIAN converts an Alexandrian YMDF date to a JED.
%
%  Discussion:
%
%    This code needs to be adjusted to fit the Alexandrian model.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2013
%
%  Author:
%
%    John Burkardt
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
  y_prime = y + 4690 - floor ( ( 13 - m ) / 13 );
  m_prime = mod ( m + 12, 13 );
  d_prime = d - 1;
%
%  Convert the computational date to a JED.
%
  jed = floor ( ( 1461 * y_prime ) / 4 ) + 30 * m_prime + d_prime - 124 - 0.5;
  jed = jed + f;

  return
end
