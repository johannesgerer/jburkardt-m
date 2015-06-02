function jed = ymdf_to_jed_eg_civil ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_EG_CIVIL converts an Egyptian Civil YMDF date to a JED.
%
%  Discussion:
%
%    The Egyptian Civil calendar used a year of 365 days.  The year comprised
%    12 months of 30 days, with 5 epagomenal days occurring at the end of
%    the year.  Since the observed year is about 365.25 days long, and no
%    attempt was made to adjust the Egyptian Civil year to the observed year,
%    the calendar dates gradually drifted with respect to the observed dates.
%
%    The epoch or first day of the Egyptian Civil calendar is taken as
%    JED = 1448638.5.
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
  y_prime = y + 3968 - floor ( ( 13 - m ) / 13 );
  m_prime = mod ( m + 12, 13 );
  d_prime = d - 1;
%
%  Convert the computational date to a JED.
%
  jed = 365 * y_prime + 30 * m_prime + d_prime - 47 + 1 - 0.5;
  jed = jed + f;

  return
end
