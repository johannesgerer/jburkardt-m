function [ y, m, d, f ] = jed_to_ymdf_republican ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_REPUBLICAN converts a JED to a Republican YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 July 2012
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

  g = floor ( ( 4 * j + 578797 ) / 146097 );
  g = floor ( 3 * g / 4 ) - 51;
  j_prime = j + 111 + g;

  y_prime = floor ( ( 4 * j_prime + 3 ) / 1461 );
  t_prime = floor ( mod ( 4 * j_prime + 3, 1461 ) / 4 );
  m_prime = floor ( t_prime / 30 );
  d_prime = mod ( t_prime, 30 );
%
%  Convert the computational date to a calendar date.
%
  d = d_prime + 1;
  m = mod ( m_prime, 13 ) + 1;
  y = y_prime - 6504 + floor ( ( 13 - m ) / 13 );

  return
end
