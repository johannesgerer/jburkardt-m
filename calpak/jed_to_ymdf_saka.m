function [ y, m, d, f ] = jed_to_ymdf_saka ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_SAKA converts a JED to a Saka YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2012
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
%    Output, integer Y, M, D, real F,
%    the YMDF date.
%

%
%  Determine the computational date (Y'/M'/D').
%
  j = floor ( jed + 0.5 );
  f = ( jed + 0.5 ) - j;

  g = floor ( ( 4 * j + 274073 ) / 146097 );
  g = floor ( ( 3 * g ) / 4 ) ) - 36;

  j_prime = j + 1348 + g;

  y_prime = floor ( ( 4 * j_prime + 3 ) / 1461 );
  t_prime = floor ( mod ( 4 * j_prime + 3, 1461 ) / 4 );

  x = floor ( t_prime / 365 );
  z = floor ( t_prime / 185 ) - x;
  s = 31 - z;

  m_prime = floor ( ( t_prime - 5 * z ) / s );
  d_prime = 6 * x + mod ( t_prime - 5 * z, s );
%
%  Convert the computational date to a calendar date.
%
  d = d_prime + 1;
  m = mod ( m_prime + 1, 12 ) + 1;
  y = y_prime - 4794 + floor ( ( 13 - m ) / 12 );

  return
end
