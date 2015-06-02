function jed = ymdf_to_jed_islamic_b ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_ISLAMIC_B converts an Islamic B YMDF date to a JED.
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
%  Check the date.
%
  [ y, m, d, ierror ] = ymd_check_islamic ( y, m, d );

  if ( ierror ~= 0 )
    jed = -1.0;
    return
  end
%
%  Convert the calendar date to a computational date.
%
  y_prime = y + 5519 - floor ( ( 12 - m ) / 12 );
  m_prime = mod ( m + 11, 12 );
  d_prime = d - 1;
%
%  Convert the computational date to a JED.
%
  j1 = floor ( ( 10631 * y_prime + 14 ) / 30 );

  j2 = floor ( ( 2951 * m_prime + 51 ) / 100 );

  jed = j1 + j2 + d_prime - 7664 - 0.5 + f;

  return
end
