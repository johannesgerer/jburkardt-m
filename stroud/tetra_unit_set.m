function [ xtab, ytab, ztab, weight ] = tetra_unit_set ( rule, order )

%*****************************************************************************80
%
%% TETRA_UNIT_SET sets weights and abscissas for quadrature on a unit tetrahedron.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      0 <= X,
%      0 <= Y,
%      0 <= Z, and
%      X + Y + Z <= 1.
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
%    Hermann Engels,
%    Numerical Quadrature and Cubature,
%    Academic Press, 1980.
%
%    Olgierd Zienkiewicz,
%    The Finite Element Method,
%    McGraw Hill, Third Edition, 1977, page 202.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%     1, NORDER =  1, precision 0, Newton Cotes formula, Zienkiewicz #1.
%     2, NORDER =  4, precision 1, Newton Cotes formula.
%     3, NORDER =  4, precision 2, Zienkiewicz #2.
%     4, NORDER =  10, precision 2, Newton Cotes formula.
%     5, NORDER =  5, precision 3, Zienkiewicz #3.
%     6, NORDER =  8, precision 3, Newton Cotes formula.
%     7, NORDER =  35, precision 4, Newton Cotes formula.
%     8, NORDER =  11, precision 4.
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real XTAB(ORDER), YTAB(ORDER), ZTAB(ORDER),
%    the abscissas.
%
%    Output, real WEIGHT(ORDER), the weights.
%

%
%  Newton Cotes .
%
  if ( rule == 1 )

    xtab(1) = 1.0 / 4.0;
    ytab(1) = 1.0 / 4.0;
    ztab(1) = 1.0 / 4.0;
    weight(1) = 1.0;
%
%  Newton Cotes.
%
  elseif ( rule == 2 )

    a = 1.0;
    b = 1.0 / 4.0;
    z = 0.0;

    xtab(1:4) =   [ z, a, z, z ];
    ytab(1:4) =   [ z, z, a, z ];
    ztab(1:4) =   [ z, z, z, a ];
    weight(1:4) = [ b, b, b, b ];
%
%  Zienkiewicz #2.
%
  elseif ( rule == 3 )

    a =  0.5854101966249685;
    b =  0.1381966011250105;
    c =  0.25;

    xtab(1:4) =   [ a, b, b, b ];
    ytab(1:4) =   [ b, a, b, b ];
    ztab(1:4) =   [ b, b, a, b ];
    weight(1:4) = [ c, c, c, c ];
%
%  Newton Cotes.
%
  elseif ( rule == 4 )

    a =  1.0;
    b =  0.5;
    c = -1.0 / 20.0;
    d =  4.0 / 20.0;
    z =  0.0;

    xtab(1:10) =   [ z, a, z, z, b, z, z, b, b, z ];
    ytab(1:10) =   [ z, z, a, z, z, b, z, b, z, b ];
    ztab(1:10) =   [ z, z, z, a, z, z, b, z, b, b ];
    weight(1:10) = [ c, c, c, c, d, d, d, d, d, d ];
%
%  Zienkiewicz #3.
%
  elseif ( rule == 5 )

    a =  1.0 / 6.0;
    b =  0.25;
    c =  0.5;
    d = -0.8;
    e =  0.45;

    xtab(1:5) =   [ b, c, a, a, a ];
    ytab(1:5) =   [ b, a, c, a, a ];
    ztab(1:5) =   [ b, a, a, c, a ];
    weight(1:5) = [ d, e, e, e, e ];
%
%  Newton Cotes.
%  (This is actually formally a 20 point rule, with 12 zero coefficients!)
%
  elseif ( rule == 6 )

    a = 1.0;
    b = 1.0 / 40.0;
    c = 1.0 /  3.0;
    d = 9.0 / 40.0;
    z = 0.0;

    xtab(1:8) =   [ z, a, z, z, c, c, z, c ];
    ytab(1:8) =   [ z, z, a, z, c, z, c, c ];
    ztab(1:8) =   [ z, z, z, a, z, c, c, c ];
    weight(1:8) = [ b, b, b, b, d, d, d, d ];
%
%  Newton Cotes.
%
  elseif ( rule == 7 )

    a =   0.25;
    b =   0.50;
    c =   0.75;
    d =   1.00;
    e =  -5.0 / 420.0;
    f = -12.0 / 420.0;
    g =  16.0 / 420.0;
    h = 128.0 / 420.0;
    z =   0.0;

    xtab(1:35) =   [ z, d, z, z, a, z, z, c, c, c, z, a, z, z, a, z, b, z, z, ...
                      b, b, z, a, b, a, a, b, z, b, z, a, a, z, a, a ];
    ytab(1:35) =   [ z, z, d, z, z, a, z, z, a, z, c, c, c, z, z, a, z, b, z, ...
                      b, z, b, a, a, b, z, z, a, a, b, b, z, a, a, a ];
    ztab(1:35) =   [ z, z, z, d, z, z, a, z, z, a, z, z, a, c, c, c, z, z, b, ...
                      z, b, b, z, z, z, a, a, a, a, a, a, b, b, b, a ];

    weight(1:35) = [ e, e, e, e, g, g, g, g, g, g, g, g, g, g, g, g, f, f, f, ...
                      f, f, f, g, g, g, g, g, g, g, g, g, g, g, g, h ];
%
%  Another rule
%
  elseif ( rule == 8 )

    a =  0.25;
    b =  11.0 /    14.0;
    c =   1.0 /    14.0;
    d =  0.25 * ( 1.0 + sqrt ( 5.0 / 14.0 ) );
    e =  0.25 * ( 1.0 - sqrt ( 5.0 / 14.0 ) );
    f = -74.0 /  5625.0;
    g = 343.0 / 45000.0;
    h =  56.0 /  2250.0;

    xtab(1:11) =   [ a, b, c, c, c, d, d, d, e, e, e ];
    ytab(1:11) =   [ a, c, b, c, c, d, e, e, d, d, e ];
    ztab(1:11) =   [ a, c, c, b, c, e, d, e, d, e, d ];

    weight(1:11) = [ f, g, g, g, g, h, h, h, h, h, h ];

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TETRA_UNIT_SET - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of RULE = %d\n', rule );
    error ( 'TETRA_UNIT_SET - Fatal error!' );

  end

  return
end
