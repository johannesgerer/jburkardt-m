function [ xtab, ytab, weight ] = square_unit_set ( rule, order )

%*****************************************************************************80
%
%% SQUARE_UNIT_SET sets weights and abscissas for quadrature within a unit square.
%
%  Integration region:
%
%    Points (X,Y) such that
%
%      -1 <= X <= 1, and
%      -1 <= Y <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 April 2008
%
%  Author:
%
%    John Burkardt
%
%  References:
%
%    Strang and Fix,
%    An Analysis of the Finite Element Method,
%    Prentice Hall, 1973.
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, integer RULE, the rule number.
%    1, a 1 point 1st degree rule.
%    2, a 4 point 3rd degree rule.
%    3, a 9 point 5th degree rule.
%    4, a 12 point 7-th degree rule, Stroud number C2:7-1.
%    5, a 13 point 7-th degree rule, Stroud number C2:7-3.
%    6, a 64 point 15-th degree product rule.
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real XTAB(ORDER), YTAB(ORDER), the abscissas of
%    the rule.
%
%    Output, real WEIGHT(ORDER), the weights of the rule.
%
  if ( rule == 1 )

    weight(1) = 4.0;

    xtab(1) = 0.0;
    ytab(1) = 0.0;

  elseif ( rule == 2 )

    a = 1.0;
    s = 1.0 / sqrt ( 3.0 );

    xtab(1:4) =   [ -s, +s, -s, +s ];
    ytab(1:4) =   [ -s, -s, +s, +s ];
    weight(1:4) = [  a,  a,  a,  a ];

  elseif ( rule == 3 )

    s = sqrt ( 0.6 );
    z = 0.0;
    w1 = 64.0 / 81.0;
    w2 = 25.0 / 81.0;
    w3 = 40.0 / 81.0;

    xtab(1:9) =   [   z,  -s, +s, -s, +s,   z, -s, +s,  z ];
    ytab(1:9) =   [   z,  -s, -s, +s, +s,  -s,  z,  z, +s ];
    weight(1:9) = [  w1,  w2, w2, w2, w2,  w3, w3, w3, w3 ];

  elseif ( rule == 4 )

    r = sqrt ( 6.0 / 7.0 );
    c = 3.0 * sqrt ( 583.0 );
    s = sqrt ( ( 114.0 - c ) / 287.0 );
    t = sqrt ( ( 114.0 + c ) / 287.0 );
    w1 = 4.0 * 49.0 / 810.0;
    w2 = 4.0 * ( 178981.0 + 923.0 * c ) / 1888920.0;
    w3 = 4.0 * ( 178981.0 - 923.0 * c ) / 1888920.0;
    z = 0.0;

    xtab(1:12) =   [   r,  z, -r,  z,   s, -s, -s,  s,  t, -t, -t,  t ];
    ytab(1:12) =   [   z,  r,  z,  -r,  s,  s, -s, -s,  t,  t, -t, -t ];
    weight(1:12) = [  w1, w1,  w1, w1, w2, w2, w2, w2, w3, w3, w3, w3 ];

  elseif ( rule == 5 )

    r = sqrt ( 12.0 / 35.0 );
    c = 3.0 * sqrt ( 186.0 );
    s = sqrt ( ( 93.0 + c ) / 155.0 );
    t = sqrt ( ( 93.0 - c ) / 155.0 );
    w1 =  8.0 / 162.0;
    w2 = 98.0 / 162.0;
    w3 = 31.0 / 162.0;
    z = 0.0;

    xtab(1:13) =   [  z,  r, -r,  z,  z,  s,  s, -s, -s,  t,  t, -t, -t ];
    ytab(1:13) =   [  z,  z,  z,  r, -r,  t, -t,  t, -t,  s, -s,  s, -s ];
    weight(1:13) = [ w1, w2, w2, w2, w2, w3, w3, w3, w3, w3, w3, w3, w3 ];

  elseif ( rule == 6 )

    order2 = 8;
    
    [ xtab2, weight2 ] = legendre_set ( order2 );

    k = 0;

    for i = 1 : order2

      for j = 1 : order2

        k = k + 1;
        xtab(k) = xtab2(i);
        ytab(k) = xtab2(j);
        weight(k) = weight2(i) * weight2(j);

      end

    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'SQUARE_UNIT_SET - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of NORDER = %d\n', norder );
    error ( 'SQUARE_UNIT_SET - Fatal error!\n' );

  end

  return
end
