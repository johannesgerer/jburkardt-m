function [  ra, rw, ta, tw, zw ] = circle_rt_set ( rule, nr, nt, nc )

%*****************************************************************************80
%
%% CIRCLE_RT_SET sets an R, THETA product quadrature rule in the unit circle.
%
%  Integration region:
%
%    Points (X,Y) such that:
%
%      X*X + Y*Y <= 1.0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Abramowitz and Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964.
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, integer RULE, the rule desired.
%      1, 1 + 0 * 0 points.
%      2, 0 + 1 * 4 points.
%      3, 1 + 1 * 4 points.
%      4, 1 + 1 * 6 points.
%      5, 1 + 2 * 4 points.
%      6, 0 + 3 * 4 points.
%      8, 0 + 4 * 16 points.
%      9, 0 + 5 * 20 points.
%
%    Input, integer NR, the number of R abscissas.
%
%    Input, integer NT, the number of Theta abscissas.
%
%    Input, integer NC, the number of center abscissas.
%
%    Output, real RA(NR), RW(NR), the R abscissas and weights.
%
%    Output, real TA(NT), TW(NT), the THETA abscissas and weights.
%
%    Output, real ZW, the weight to use for the center.
%
  if ( rule == 1 )

    ra = [];
    rw = [];

    ta =[];
    tw = [];
    
    zw = 1.0;
    
  elseif ( rule == 2 )

    ra(1) = 0.5;
    rw(1) = 1.0;

    ta = tvec_even2 ( nt );
    tw(1:nt) = 1.0 / nt;

    zw = 0.0;

  elseif ( rule == 3 )

    ra(1) = 1.0;
    rw(1) = 1.0;

    ta = tvec_even ( nt );
    tw(1:4) = 0.125;

    zw = 0.5;

  elseif ( rule == 4 )

    ra(1) = sqrt ( 2.0 / 3.0 );
    rw(1) = 1.0;

    ta = tvec_even ( nt );
    tw(1:nt) = 0.125;

    zw = 0.25;

  elseif ( rule == 5 )

    a = 1.0;
    b = sqrt ( 2.0 ) / 2.0;
    u = 1.0 / 6.0;
    v = 4.0 / 6.0;

    ra(1:nr) = [ a, b ];
    rw(1:nr) = [ u, v ];

    ta = tvec_even ( nt );
    tw(1:nt) = 1.0 / nt;

    zw = 4.0 / 24.0;

  elseif ( rule == 6 )

    a = sqrt ( 3.0 ) / 2.0;
    b = sqrt ( ( 27.0 - 3.0 * sqrt ( 29.0 ) ) / 52.0 );
    c = sqrt ( ( 27.0 + 3.0 * sqrt ( 29.0 ) ) / 52.0 );

    u = 8.0 / 27.0;
    v = ( 551.0 + 41.0 * sqrt ( 29.0 ) ) / 1566.0;
    w = ( 551.0 - 41.0 * sqrt ( 29.0 ) ) / 1566.0;

    ra(1:nr) = [ a, b, c ];
    rw(1:nr) = [ u, v, w ];

    ta = tvec_even ( nt );
    tw(1:nt) = 1.0 / nt;

    zw = 0.0;

  elseif ( rule == 7 )

    a = sqrt ( ( 6.0 - sqrt ( 6.0 ) ) / 10.0 );
    b = sqrt ( ( 6.0 + sqrt ( 6.0 ) ) / 10.0 );
    u = ( 16.0 + sqrt ( 6.0 ) ) / 36.0;
    v = ( 16.0 - sqrt ( 6.0 ) ) / 36.0;

    ra(1:nr) = [ a, b ];
    rw(1:nr) = [ u, v ];

    ta = tvec_even ( nt );
    tw(1:nt) = 1.0 / nt;

    zw = 1.0 / 9.0;

  elseif ( rule == 8 )

    [ ra, rw ] = legendre_set ( nr );
    a = -1.0;
    b = +1.0;
    c =  0.0;
    d = +1.0;
    [ ra, rw ] = rule_adjust ( a, b, c, d, nr, ra, rw );
    ra(1:nr) = sqrt ( ra(1:nr) );

    ta = tvec_even ( nt );
    tw(1:nt) = 1.0 / nt;

    zw = 0.0;

  elseif ( rule == 9 )


    [ ra, rw ] = legendre_set ( nr );
    a = -1.0;
    b = +1.0;
    c =  0.0;
    d = +1.0;
    [ ra, rw ] = rule_adjust ( a, b, c, d, nr, ra, rw );
    ra(1:nr) = sqrt ( ra(1:nr) );

    ta = tvec_even ( nt );
    tw(1:nt) = 1.0 / nt;

    zw = 0.0;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_RT_SET - Fatal error!\n' );
    fprintf ( 1, '  There is no rule of index %d\n', rule );
    error ( 'CIRCLE_RT_SET - Fatal error!' );

  end

  return
end
