function [ xtab, ytab, weight ] = circle_xy_set ( rule, order )

%*****************************************************************************80
%
%% CIRCLE_XY_SET sets an XY quadrature rule inside the unit circle in 2D.
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
%    02 April 2008
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
%    Frank Lether,
%    A Generalized Product Rule for the Circle,
%    SIAM Journal on Numerical Analysis,
%    Volume 8, Number 2, June 1971, pages 249-253.
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, integer RULE, the rule desired.
%      1, 1 point 1-st degree;
%      2, 4 point 3-rd degree, Stroud S2:3-1;
%      3, 4 point 3-rd degree, Lether #1;
%      4, 4 point 3-rd degree, Stroud S2:3-2;
%      5, 5 point 3-rd degree;
%      6, 7 point 5-th degree;
%      7, 9 point 5-th degree;
%      8, 9 point 5-th degree, Lether #2;
%      9, 12 point 7-th degree;
%     10, 16 point 7-th degree, Lether #3;
%     11, 21 point 9-th degree, Stroud S2:9-3;
%     12, 25 point 9-th degree, Lether #4 (after correcting error);
%     13, 64 point 15-th degree Gauss product rule.
%
%    Input, integer ORDER, the order of the desired rule.
%
%    Output, real XTAB(ORDER), YTAB(ORDER), the abscissas of
%    the rule.
%
%    Output, real WEIGHT(ORDER), the weights of the rule.
%
  if ( rule == 1 )

    xtab(1) = 0.0;
    ytab(1) = 0.0;
    weight(1) = 1.0;

  elseif ( rule == 2 )

    a = 0.5;
    b = 0.25;
    z = 0.0;

    xtab(1:4) =   [  a, -a,  z,  z ];
    ytab(1:4) =   [  z,  z,  a, -a ];
    weight(1:4) = [  b,  b,  b,  b ];

  elseif ( rule == 3 )

    a = 0.5;
    b = 0.25;

    xtab(1:4) =   [  a, -a, -a,  a ];
    ytab(1:4) =   [  a,  a, -a, -a ];
    weight(1:4) = [  b,  b,  b,  b ];

  elseif ( rule == 4 )

    a = sqrt ( 2.0 ) / 2.0;
    b = 0.25;

    xtab(1:4) =   [  a, -a, -a,  a ];
    ytab(1:4) =   [  a,  a, -a, -a ];
    weight(1:4) = [  b,  b,  b,  b ];

  elseif ( rule == 5 )

    a = 1.0;
    b = 0.5;
    c = 0.125;
    z = 0.0;

    xtab(1:5) =   [ z, a, z, -a,  z ];
    ytab(1:5) =   [ z, z, a,  z, -a ];
    weight(1:5) = [ b, c, c,  c,  c ];

  elseif ( rule == 6 )

    a = sqrt ( 2.0 / 3.0 );
    b = sqrt ( 1.0 / 6.0 );
    c = sqrt ( 2.0 ) / 2.0;
    d = 0.125;
    e = 0.25;
    z = 0.0;

    xtab(1:7) =   [ z, a, -a,  b, -b,  b, -b ];
    ytab(1:7) =   [ z, z,  z,  c,  c, -c, -c ];
    weight(1:7) = [ e, d,  d,  d,  d,  d,  d ];

  elseif ( rule == 7 )

    a = 0.5;
    b = 1.0;
    c = 4.0 / 24.0;
    d = 1.0 / 24.0;
    z = 0.0;

    xtab(1:9) =   [ z,  b, -b,  z,  z,  a, -a, -a,  a ];
    ytab(1:9) =   [ z,  z,  z,  b, -b,  a,  a, -a, -a ];
    weight(1:9) = [ c,  d,  d,  d,  d,  c,  c,  c,  c ];

  elseif ( rule == 8 )

    a = sqrt ( 2.0 ) / 2.0;
    b = sqrt ( 3.0 / 5.0 );
    c = sqrt ( 3.0 / 10.0 );

    w1 = 16.0 / 72.0;
    w2 =  8.0 / 72.0;
    w3 = 10.0 / 72.0;
    w4 =  5.0 / 72.0;

    z = 0.0;

    xtab(1:9) =   [  z,   a,  -a,   z,   z,   a,   a,  -a,  -a ];
    ytab(1:9) =   [  z,   z,   z,   b,  -b,   c,  -c,   c,  -c ];
    weight(1:9) = [ w1,  w2,  w2,  w3,  w3,  w4,  w4,  w4,  w4 ];

  elseif ( rule == 9 )

    a = sqrt ( 3.0 ) / 2.0;
    b = sqrt ( ( 27.0 - 3.0 * sqrt ( 29.0 ) ) / 104.0 );
    c = sqrt ( ( 27.0 + 3.0 * sqrt ( 29.0 ) ) / 104.0 );
    u = 2.0 / 27.0;
    v = ( 551.0 + 41.0 * sqrt ( 29.0 ) ) / 6264.0;
    w = ( 551.0 - 41.0 * sqrt ( 29.0 ) ) / 6264.0;
    z = 0.0;

    xtab(1:12) =   [ a, -a,  z,  z,  b, -b,  b, -b,  c,  c, -c, -c ];
    ytab(1:12) =   [ z,  z,  a, -a,  b,  b, -b, -b,  c, -c,  c, -c ];
    weight(1:12) = [ u,  u,  u,  u,  v,  v,  v,  v,  w,  w,  w,  w ];

  elseif ( rule == 10 )

    a = sqrt ( ( 3.0 - sqrt ( 5.0 ) ) / 8.0 );
    b = sqrt ( ( 15.0 + 3.0 * sqrt ( 5.0 ) ...
      - 2.0 * sqrt ( 30.0 ) - 2.0 * sqrt ( 6.0 ) ) / 56.0 );
    c = sqrt ( ( 15.0 + 3.0 * sqrt ( 5.0 ) ...
      + 2.0 * sqrt ( 30.0 ) + 2.0 * sqrt ( 6.0 ) ) / 56.0 );
    d = sqrt ( ( 3.0 + sqrt ( 5.0 ) ) / 8.0 );
    e = sqrt ( ( 15.0 - 3.0 * sqrt ( 5.0 ) ...
      - 2.0 * sqrt ( 30.0 ) + 2.0 * sqrt ( 6.0 ) ) / 56.0 );
    f = sqrt ( ( 15.0 - 3.0 * sqrt ( 5.0 ) ...
      + 2.0 * sqrt ( 30.0 ) - 2.0 * sqrt ( 6.0 ) ) / 56.0 );
    w1 = ( 90.0 + 5.0 * sqrt ( 30.0 ) + 18.0 * sqrt ( 5.0 ) ...
       + 5.0 * sqrt ( 6.0 ) ) / 1440.0;
    w2 = ( 90.0 - 5.0 * sqrt ( 30.0 ) + 18.0 * sqrt ( 5.0 ) ...
       - 5.0 * sqrt ( 6.0 ) ) / 1440.0;
    w3 = ( 90.0 + 5.0 * sqrt ( 30.0 ) - 18.0 * sqrt ( 5.0 ) ...
       - 5.0 * sqrt ( 6.0 ) ) / 1440.0;
    w4 = ( 90.0 - 5.0 * sqrt ( 30.0 ) - 18.0 * sqrt ( 5.0 ) ...
       + 5.0 * sqrt ( 6.0 ) ) / 1440.0;

    xtab =   [  a,  a, -a, -a,  a,  a, -a, -a,  d,  d, -d, -d,  d,  d, -d, -d ];
    ytab =   [  b, -b,  b, -b,  c, -c,  c, -c,  e, -e,  e, -e,  f, -f,  f, -f ];
    weight = [ w1, w1, w1, w1, w2, w2, w2, w2, w3, w3, w3, w3, w4, w4, w4, w4 ];

  elseif ( rule == 11 )

    xtab(1) = 0.0;
    ytab(1) = 0.0;

    weight(1) = 1.0 / 9.0;
    weight(2:11) = ( 16.0 + sqrt ( 6.0 ) ) / 360.0;
    weight(12:21) = ( 16.0 - sqrt ( 6.0 ) ) / 360.0;

    r = sqrt ( ( 6.0 - sqrt ( 6.0 ) ) / 10.0 );

    for i = 1 : 10
      a = 2.0 * pi * i / 10.0;
      xtab(1+i) = r * cos ( a );
      ytab(1+i) = r * sin ( a );
    end

    r = sqrt ( ( 6.0 + sqrt ( 6.0 ) ) / 10.0 );

    for i = 1 : 10
      a = 2.0 * pi * i / 10.0;
      xtab(11+i) = r * cos ( a );
      ytab(11+i) = r * sin ( a );
    end
%
%  There was apparently a misprint in the Lether paper.  The quantity
%  which here reads "322" was printed there as "332".
%
  elseif ( rule == 12 )

    a = 0.5;
    b = sqrt ( 3.0 ) / 2.0;
    c = sqrt ( ( 35.0 + 2.0 * sqrt ( 70.0 ) ) / 252.0 );
    d = sqrt ( ( 35.0 - 2.0 * sqrt ( 70.0 ) ) / 252.0 );
    e = sqrt ( ( 35.0 + 2.0 * sqrt ( 70.0 ) ) / 84.0 );
    f = sqrt ( ( 35.0 - 2.0 * sqrt ( 70.0 ) ) / 84.0 );
    g = sqrt ( ( 35.0 + 2.0 * sqrt ( 70.0 ) ) / 63.0 );
    h = sqrt ( ( 35.0 - 2.0 * sqrt ( 70.0 ) ) / 63.0 );

    w1 = 64.0 / 675.0;
    w2 = 16.0 / 225.0;
    w3 = 16.0 / 675.0;
    w4 = ( 322.0 - 13.0 * sqrt ( 70.0 ) ) / 21600.0;
    w5 = ( 322.0 + 13.0 * sqrt ( 70.0 ) ) / 21600.0;
    w6 = ( 322.0 - 13.0 * sqrt ( 70.0 ) ) / 7200.0;
    w7 = ( 322.0 + 13.0 * sqrt ( 70.0 ) ) / 7200.0;
    w8 = ( 322.0 - 13.0 * sqrt ( 70.0 ) ) / 5400.0;
    w9 = ( 322.0 + 13.0 * sqrt ( 70.0 ) ) / 5400.0;
    z = 0.0;

    xtab =   [  z,  a, -a,  b, -b,  b,  b, -b, -b,  b,  b, -b, -b, ...
                a,  a, -a, -a,  a,  a, -a, -a,  z,  z,  z,  z ];
    ytab =   [  z,  z,  z,  z,  z,  c, -c,  c, -c,  d, -d,  d, -d, ...
                e, -e,  e, -e,  f, -f,  f, -f,  g, -g,  h, -h ];
    weight = [ w1, w2, w2, w3, w3, w4, w4, w4, w4, w5, w5, w5, w5, ...
               w6, w6, w6, w6, w7, w7, w7, w7, w8, w8, w9, w9 ];

  elseif ( rule == 13 )

    nr = 4;
    [ ra, rw ] = legendre_set ( nr );
    a = -1.0;
    b = +1.0;
    c =  0.0;
    d = +1.0;
    [ ra, rw ] = rule_adjust ( a, b, c, d, nr, ra, rw );
    ra(1:nr) = sqrt ( ra(1:nr) );

    i = 0;

    for j = 1 : 16

      c = cos ( pi * j / 8.0 );
      s = sin ( pi * j / 8.0 );

      for k = 1 : 4

        i = i + 1;
        xtab(i) = c * ra(k);
        ytab(i) = s * ra(k);
        weight(i) = rw(k) / 16.0;

      end

    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_XY_SET - Fatal error!\n' );
    fprintf ( 1, '  There is no rule of index %d\n', rule );
    error ( 'CIRCLE_XY_SET - Fatal error!' );

  end

  return
end
