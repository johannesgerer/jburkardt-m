function jed = moon_phase_to_jed ( n, phase )

%*****************************************************************************80
%
%% MOON_PHASE_TO_JED calculates the JED of a moon phase.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2013
%
%  Reference:
%
%    William Press, Brian Flannery, Saul Teukolsky, William Vetterling,
%    Numerical Recipes: The Art of Scientific Computing,
%    Cambridge University Press.
%
%  Parameters:
%
%    Input, integer N, specifies that the N-th such phase
%    of the moon since January 1900 is to be computed.
%
%    Input, integer PHASE, specifies which phase is to be computed.
%    0=new moon,
%    1=first quarter,
%    2=full,
%    3=last quarter.
%
%    Output, real JED, the Julian Ephemeris Date on which the
%    requested phase occurs.
%
  degrees_to_radians = pi / 180.0;
%
%  First estimate.
%
  j = 2415020 + 28 * n + 7 * phase;
%
%  Compute a correction term.
%
  c = n + phase / 4.0;

  t = c / 1236.85;

  xtra = 0.75933 + 1.53058868 * c + ( 0.0001178 - 0.000000155 * t ) * t * t;

  as = degrees_to_radians * ( 359.2242 + 29.105356 * c );

  am = degrees_to_radians * ( 306.0253 + 385.816918 * c + 0.010730 * t * t );

  if ( phase == 0 || phase == 2 )

    xtra = xtra + ( 0.1734 - 0.000393 * t ) * sin ( as ) - 0.4068 * sin ( am );

  elseif ( phase == 1 || phase == 3 )

    xtra = xtra + ( 0.1721 - 0.0004 * t ) * sin ( as ) - 0.6280 * sin ( am );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'MOON_PHASE_TO_JED - Fatal error!\n' );
    fprintf ( 1, '  Illegal PHASE option = %d\n', phase );
    error ( 'MOON_PHASE_TO_JED - Fatal error!' );

  end

  jed = j + xtra;

  return
end
