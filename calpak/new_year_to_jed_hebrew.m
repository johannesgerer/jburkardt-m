function jed = new_year_to_jed_hebrew ( y )

%*****************************************************************************80
%
%% NEW_YEAR_TO_JED_HEBREW returns the JED of the beginning of a Hebrew year.
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
%    Algorithm G,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, pages 330.
%
%  Parameters:
%
%    Input, integer Y, the Hebrew year.
%
%    Output, real JED, the Julian Ephemeris Date.
%
  mu = floor ( ( 235 * y - 234 ) / 19 );
  tc = 204 + 793 * mu;
  th = 5 + 12 * mu + floor ( tc / 1080 );
  d = 1 + 29 * mu + floor ( th / 24 );
  t_prime = mod ( tc, 1080 ) + 1080 * mod ( th, 24 );

  w = i4_wrap ( d + 1, 1, 7 );

  e = floor ( mod ( 7 * y + 13, 19 ) / 12 );
  e_prime = floor ( mod ( 7 * y + 6, 19 ) / 12 );

  if ( 19940 <= t_prime || ...
     (  9924 <= t_prime && w == 3 && e == 0 ) || ...
     ( 16788 <= t_prime && w == 2 && e == 0 && e_prime == 1 ) )
    d = d + 1;
  end

  jed_epoch = epoch_to_jed_hebrew ( );

  jed = jed_epoch - 1 + d + mod ( mod ( d + 5, 7 ), 2 );

  return
end