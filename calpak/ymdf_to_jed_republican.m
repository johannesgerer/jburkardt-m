function jed = ymdf_to_jed_republican ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_REPUBLICAN converts a Republican YMDF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2013
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
%  Check the date.
%
  [ y, m, d, ierror ] = ymd_check_republican ( y, m, d );

  if ( ierror ~= 0 )
    jed = -1.0;
    return
  end
%
%  Convert the calendar date to a computational date.
%
  y_prime = y + 6504 - floor ( ( 13 - m ) / 13 );
  m_prime = mod ( m + 12, 13 );
  d_prime = d - 1;
%
%  Convert the computational date to a JED.
%
  j1 = floor ( ( 1461 * y_prime ) / 4 );

  j2 = 30 * m_prime;

  g = floor ( ( y_prime + 396 ) / 100 );
  g = floor ( 3 * g / 4 ) - 51;
  jed = j1 + j2 + d_prime - 111 - g - 0.5;
  jed = jed + f;

  return
end