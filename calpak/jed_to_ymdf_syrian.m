function [ y, m, d, f ] = jed_to_ymdf_syrian ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_SYRIAN converts a JED to a Syrian YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 July 2012
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

  j_prime = j + 1401;

  y_prime = floor ( ( 4 * j_prime + 3 ) / 1461 );
  t_prime = floor ( mod ( 4 * j_prime + 3, 1461 ) / 4 );
  m_prime = floor ( ( 5 * t_prime + 2 ) / 153 );
  d_prime = floor ( mod ( 5 * t_prime + 2, 153 ) / 5 );
%
%  Convert the computational date to a calendar date.
%
  d = d_prime + 1;
  m = mod ( m_prime + 5, 12 ) + 1;
  y = y_prime - 4405 + floor ( ( 17 - m ) / 12 );

  return
end
