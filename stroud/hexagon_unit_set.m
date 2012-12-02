function [ xtab, ytab, weight ] = hexagon_unit_set ( rule, order )

%*****************************************************************************80
%
%% HEXAGON_UNIT_SET sets a quadrature rule inside the unit hexagon in 2D.
%
%  Integration region:
%
%    The definition is given in terms of THETA, the angle in degrees of the
%    vector (X,Y).  The following six conditions apply, respectively,
%    between the bracketing values of THETA of 0, 60, 120, 180, 240,
%    300, and 360.
%
%                              0 <= Y <= - SQRT(3) * X + SQRT(3)
%                              0 <= Y <=                 SQRT(3)/2
%                              0 <= Y <=   SQRT(3) * X + SQRT(3)
%      - SQRT(3) * X - SQRT(3)   <= Y <= 0
%                    - SQRT(3)/2 <= Y <= 0
%        SQRT(3) * X - SQRT(3)   <= Y <= 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 March 2008
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
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, integer RULE, the rule desired.
%      1, 1 point,  degree 1;
%      2, 4 points, degree 3;
%      3, 7 points, degree 3;
%      4, 7 points, degree 5;
%
%    Input, integer ORDER, the order of the desired rule.
%
%    Output, real XTAB(ORDER), YTAB(ORDER), the abscissase.
%
%    Output, real WEIGHT(ORDER), the weights.
%
  if ( rule == 1 )

    xtab(1) = 0.0;
    ytab(1) = 0.0;
    weight(1) = 1.0;
%
%  Stroud rule H2:3-1.
%
  elseif ( rule == 2 )

    a = sqrt ( 5.0 / 12.0 );
    b = 1.0 / 4.0;
    z = 0.0;

    xtab(1:4) =   [  a, -a,  z,  z ];
    ytab(1:4) =   [  z,  z,  a, -a ];
    weight(1:4) = [  b,  b,  b,  b ];
%
%  Stroud rule H2:3-2.
%
  elseif ( rule == 3 )

    a = sqrt ( 3.0 ) / 2.0;
    b =  0.5;
    c =  1.0;
    d =  5.0 / 72.0;
    e = 42.0 / 72.0;
    z =  0.0;

    xtab(1:7) =   [  z,  c, -c,  b, -b,  b, -b ];
    ytab(1:7) =   [  z,  z,  z,  a,  a, -a, -a ];
    weight(1:7) = [  e,  d,  d,  d,  d,  d,  d ];
%
%  Stroud rule H2:5-1.
%
  elseif ( rule == 4 )

    a = sqrt ( 14.0 ) / 5.0;
    b = sqrt ( 14.0 ) / 10.0;
    c = sqrt ( 42.0 ) / 10.0;
    d = 125.0 / 1008.0;
    e = 258.0 / 1008.0;
    z = 0.0;

    xtab(1:7) =   [ z,  a, -a,  b, -b,  b, -b ];
    ytab(1:7) =   [ z,  z,  z,  c,  c, -c, -c ];
    weight(1:7) = [ e,  d,  d,  d,  d,  d,  d ];

  else

    xtab = [];
    ytab = [];
    weight = [];

    fprintf ( 1, '\n' );
    fprintf ( 1, 'HEXAGON_UNIT_SET - Fatal error!\n' );
    fprintf ( 1, '  Nonexistent rule number %d requested.\n', rule );
    error ( 'HEXAGON_UNIT_SET - Fatal error!' );

  end

  return
end
