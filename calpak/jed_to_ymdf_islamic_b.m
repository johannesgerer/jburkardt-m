function [ y, m, d, f ] = jed_to_ymdf_islamic_b ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_ISLAMIC_B converts a JED to an Islamic B YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Algorithm F,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, pages 324-325.
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, M, D, real F, the YMDF date.
%

%
%  Determine the computational date (Y'/M'/D').
%
  j = floor ( jed + 0.5 );
  f = ( jed + 0.5 ) - j;

  j_prime = j + 7664;

  y_prime = floor ( ( 30 * j_prime + 15 ) / 10631 );
  t_prime = floor ( mod ( 30 * j_prime + 15, 10631 ) / 30 );
  m_prime = floor ( ( 100 * t_prime + 10 ) / 2951 );
  d_prime = floor ( mod ( 100 * t_prime + 10, 2951 ) / 100 );
%
%  Convert the computational date to a calendar date.
%
  d = d_prime + 1;
  m = mod ( m_prime, 12 ) + 1;
  y = y_prime - 5519 + floor ( ( 12 - m ) / 12 );

  return
end
