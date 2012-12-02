function [ xtab, ytab, weight ] = triangle_unit_set ( rule, order )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_SET sets a quadrature rule in a unit triangle.
%
%  Discussion:
%
%    The user is responsible for determining the value of ORDER,
%    and appropriately dimensioning the arrays XTAB, YTAB and
%    WEIGHT so that they can accommodate the data.
%
%    The value of ORDER for each rule can be found by invoking
%    the function TRIANGLE_RULE_SIZE.
%
%  Integration region:
%
%    Points (X,Y) such that
%
%      0 <= X,
%      0 <= Y, and
%      X + Y <= 1.
%
%  Graph:
%
%      ^
%    1 | *
%      | |\
%    Y | | \
%      | |  \
%    0 | *---*
%      +------->
%        0 X 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jarle Berntsen, Terje Espelid,
%    Algorithm 706,
%    DCUTRI: an algorithm for adaptive cubature over a collection of triangles, 
%    ACM Transactions on Mathematical Software,
%    Volume 18, Number 3, September 1992, pages 329-342.
%
%    Elise deDoncker, Ian Robinson,
%    Algorithm 612:
%    Integration over a Triangle Using Nonlinear Extrapolation,
%    ACM Transactions on Mathematical Software,
%    Volume 10, Number 1, March 1984, pages 17-22.
%
%    DP Laurie,
%    Algorithm 584,
%    CUBTRI, Automatic Cubature Over a Triangle,
%    ACM Transactions on Mathematical Software,
%    Volume 8, Number 2, 1982, pages 210-218.
%
%    James Lyness, Dennis Jespersen,
%    Moderate Degree Symmetric Quadrature Rules for the Triangle,
%    Journal of the Institute of Mathematics and its Applications,
%    Volume 15, Number 1, February 1975, pages 19-32.
%
%    Hans Rudolf Schwarz,
%    Methode der Finiten Elemente,
%    Teubner Studienbuecher, 1980,
%    ISBN: 3-519-02349-0.
%
%    Gilbert Strang, George Fix,
%    An Analysis of the Finite Element Method,
%    Prentice Hall, 1973, page 184,
%    ISBN: 096140888X,
%    LC: TA335.S77.
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%    Olgierd Zienkiewicz,
%    The Finite Element Method,
%    Sixth Edition,
%    Butterworth-Heinemann, 2005,
%    ISBN: 0750663200,
%    TA640.2.Z54
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%     1, ORDER =  1, precision 1, Zienkiewicz #1.
%     2, ORDER =  3, precision 1, the "vertex rule".
%     3, ORDER =  3, precision 2, Strang and Fix formula #1.
%     4, ORDER =  3, precision 2, Strang and Fix formula #2, Zienkiewicz #2.
%     5, ORDER =  4, precision 3, Strang and Fix formula #3, Zienkiewicz #3.
%     6, ORDER =  6, precision 3, Strang and Fix formula #4.
%     7, ORDER =  6, precision 3, Stroud formula T2:3-1.
%     8, ORDER =  6, precision 4, Strang and Fix formula #5.
%     9, ORDER =  7, precision 4, Strang and Fix formula #6.
%    10, ORDER =  7, precision 5, Strang and Fix formula #7,
%        Stroud formula T2:5-1, Zienkiewicz #4, Schwarz Table 2.2.
%    11, ORDER =  9, precision 6, Strang and Fix formula #8.
%    12, ORDER = 12, precision 6, Strang and Fix formula #9.
%    13, ORDER = 13, precision 7, Strang and Fix formula #10.
%    14, ORDER =  7, precision ?.
%    15, ORDER = 16, precision 7, conical product Gauss, Stroud formula T2:7-1.
%    16, ORDER = 64, precision 15, triangular product Gauss rule.
%    17, ORDER = 19, precision 8, from CUBTRI, ACM TOMS #584.
%    18, ORDER = 19, precision 9, from TRIEX, ACM TOMS #612.
%    19, ORDER = 28, precision 11, from TRIEX, ACM TOMS #612,
%    20, ORDER = 37, precision 13, from ACM TOMS #706.
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real XTAB(ORDER), YTAB(ORDER), the abscissas.
%
%    Output, real WEIGHT(ORDER), the weights of the rule.
%

%
%  1 point, precision 1.
%
  if ( rule == 1 )

    a = 1.0 / 3.0;
    w = 1.0;

    xtab(1) = a;
    ytab(1) = a;
    weight(1) = w;
%
%  3 points, precision 1, the 'vertex rule'.
%
  elseif ( rule == 2 )

    xtab(1:3) =   [ 1.0, 0.0, 0.0 ];
    ytab(1:3) =   [ 0.0, 1.0, 0.0 ];
    weight(1:3) = [ 1.0, 1.0, 1.0 ] / 3.0;
%
%  3 points, precision 2, Strang and Fix formula #1.
%
  elseif ( rule == 3 )

    a = 1.0;
    b = 3.0;
    c = 4.0;
    d = 6.0;

    xtab(1:3) =   [ c, a, a ] / d;
    ytab(1:3) =   [ a, c, a ] / d;
    weight(1:3) = [ a, a, a ] / b;
%
%  3 points, precision 2, Strang and Fix formula #2.
%
  elseif ( rule == 4 )

    a = 0.5;
    b = 1.0;
    c = 1.0 / 3.0;
    z = 0.0;

    xtab(1:3) =   [ z, a, a ];
    ytab(1:3) =   [ a, z, a ];
    weight(1:3) = [ c, c, c ];
%
%  4 points, precision 3, Strang and Fix formula #3.
%
  elseif ( rule == 5 )

    a =   6.0;
    b =  10.0;
    c =  18.0;
    d =  25.0;
    e = -27.0;
    f =  30.0;
    g =  48.0;

    xtab(1:4) =   [ b, c, a, a ] / f;
    ytab(1:4) =   [ b, a, c, a ] / f;
    weight(1:4) = [ e, d, d, d ] / g;
%
%  6 points, precision 3, Strang and Fix formula #4.
%
  elseif ( rule == 6 )

    a = 0.659027622374092;
    b = 0.231933368553031;
    c = 0.109039009072877;
    w = 1.0 / 6.0;

    xtab(1:6) =   [ a, a, b, b, c, c ];
    ytab(1:6) =   [ b, c, a, c, a, b ];
    weight(1:6) = [ w, w, w, w, w, w ];
%
%  6 points, precision 3, Stroud T2:3-1.
%
  elseif ( rule == 7 )

    a = 0.0;
    b = 0.5;
    c = 2.0 /  3.0;
    d = 1.0 /  6.0;
    v = 1.0 / 30.0;
    w = 3.0 / 10.0;

    xtab(1:6) =   [ a, b, b, c, d, d ];
    ytab(1:6) =   [ b, a, b, d, c, d ];
    weight(1:6) = [ v, v, v, w, w, w ];
%
%  6 points, precision 4, Strang and Fix, formula #5.
%
  elseif ( rule == 8 )

    a = 0.816847572980459;
    b = 0.091576213509771;
    c = 0.108103018168070;
    d = 0.445948490915965;
    v = 0.109951743655322;
    w = 0.223381589678011;

    xtab(1:6) =   [ a, b, b, c, d, d ];
    ytab(1:6) =   [ b, a, b, d, c, d ];
    weight(1:6) = [ v, v, v, w, w, w ];
%
%  7 points, precision 4, Strang and Fix formula #6.
%
  elseif ( rule == 9 )

    a = 1.0 / 3.0;
    c = 0.736712498968435;
    d = 0.237932366472434;
    e = 0.025355134551932;
    v = 0.375;
    w = 0.104166666666667;

    xtab(1:7) =   [ a, c, c, d, d, e, e ];
    ytab(1:7) =   [ a, d, e, c, e, c, d ];
    weight(1:7) = [ v, w, w, w, w, w, w ];
%
%  7 points, precision 5, Strang and Fix formula #7, Stroud T2:5-1
%
  elseif ( rule == 10 )

    a = 1.0 / 3.0;
    b = ( 9.0 + 2.0 * sqrt ( 15.0 ) ) / 21.0;
    c = ( 6.0 -           sqrt ( 15.0 ) ) / 21.0;
    d = ( 9.0 - 2.0 * sqrt ( 15.0 ) ) / 21.0;
    e = ( 6.0 +           sqrt ( 15.0 ) ) / 21.0;
    u = 0.225;
    v = ( 155.0 - sqrt ( 15.0 ) ) / 1200.0;
    w = ( 155.0 + sqrt ( 15.0 ) ) / 1200.0;

    xtab(1:7) =   [ a, b, c, c, d, e, e ];
    ytab(1:7) =   [ a, c, b, c, e, d, e ];
    weight(1:7) = [ u, v, v, v, w, w, w ];
%
%  9 points, precision 6, Strang and Fix formula #8.
%
  elseif ( rule == 11 )

    a = 0.124949503233232;
    b = 0.437525248383384;
    c = 0.797112651860071;
    d = 0.165409927389841;
    e = 0.037477420750088;

    u = 0.205950504760887;
    v = 0.063691414286223;

    xtab(1:9) =   [ a, b, b, c, c, d, d, e, e ];
    ytab(1:9) =   [ b, a, b, d, e, c, e, c, d ];
    weight(1:9) = [ u, u, u, v, v, v, v, v, v ];
%
%  12 points, precision 6, Strang and Fix, formula #9.
%
  elseif ( rule == 12 )

    a = 0.873821971016996;
    b = 0.063089014491502;
    c = 0.501426509658179;
    d = 0.249286745170910;
    e = 0.636502499121399;
    f = 0.310352451033785;
    g = 0.053145049844816;

    u = 0.050844906370207;
    v = 0.116786275726379;
    w = 0.082851075618374;

    xtab(1:12) =   [ a, b, b, d, c, d, e, e, f, f, g, g ];
    ytab(1:12) =   [ b, a, b, c, d, d, f, g, e, g, e, f ];
    weight(1:12) = [ u, u, u, v, v, v, w, w, w, w, w, w ];
%
%  13 points, precision 7, Strang and Fix, formula #10.
%
  elseif ( rule == 13 )

    a = 0.479308067841923;
    b = 0.260345966079038;
    c = 0.869739794195568;
    d = 0.065130102902216;
    e = 0.638444188569809;
    f = 0.312865496004875;
    g = 0.048690315425316;
    h = 1.0 / 3.0;
    t = 0.175615257433204;
    u = 0.053347235608839;
    v = 0.077113760890257;
    w = -0.149570044467670;

    xtab(1:13) =   [ a, b, b, c, d, d, e, e, f, f, g, g, h ];
    ytab(1:13) =   [ b, a, b, d, c, d, f, g, e, g, e, f, h ];
    weight(1:13) = [ t, t, t, u, u, u, v, v, v, v, v, v, w ];
%
%  7 points, precision ?.
%
  elseif ( rule == 14 )

    a = 1.0 / 3.0;
    b = 1.0;
    c = 0.5;
    z = 0.0;

    u = 27.0 / 60.0;
    v =  3.0 / 60.0;
    w =  8.0 / 60.0;

    xtab(1:7) =   [ a, b, z, z, z, c, c ];
    ytab(1:7) =   [ a, z, b, z, c, z, c ];
    weight(1:7) = [ u, v, v, v, w, w, w ];
%
%  16 points.
%
  elseif ( rule == 15 )
%
%  Legendre rule of order 4.
%
    norder2 = 4;

    xtab1(1) = - 0.861136311594052575223946488893;
    xtab1(2) = - 0.339981043584856264802665759103;
    xtab1(3) =   0.339981043584856264802665759103;
    xtab1(4) =   0.861136311594052575223946488893;

    weight1(1) = 0.347854845137453857373063949222;
    weight1(2) = 0.652145154862546142626936050778;
    weight1(3) = 0.652145154862546142626936050778;
    weight1(4) = 0.347854845137453857373063949222;

    xtab1(1:norder2) = 0.5 * ( xtab1(1:norder2) + 1.0 );

    weight2(1) = 0.1355069134;
    weight2(2) = 0.2034645680;
    weight2(3) = 0.1298475476;
    weight2(4) = 0.0311809709;

    xtab2(1) = 0.0571041961;
    xtab2(2) = 0.2768430136;
    xtab2(3) = 0.5835904324;
    xtab2(4) = 0.8602401357;

    k = 0;
    for i = 1 : norder2
      for j = 1 : norder2
        k = k + 1;
        xtab(k) = xtab2(j);
        ytab(k) = xtab1(i) * ( 1.0 - xtab2(j) );
        weight(k) = weight1(i) * weight2(j);
      end
    end
%
%  64 points, precision 15
%
  elseif ( rule == 16 )
%
%  Legendre rule of order 8.
%
    norder2 = 8;

    xtab1(1) = - 0.960289856497536231683560868569;
    xtab1(2) = - 0.796666477413626739591553936476;
    xtab1(3) = - 0.525532409916328985817739049189;
    xtab1(4) = - 0.183434642495649804939476142360;
    xtab1(5) =   0.183434642495649804939476142360;
    xtab1(6) =   0.525532409916328985817739049189;
    xtab1(7) =   0.796666477413626739591553936476;
    xtab1(8) =   0.960289856497536231683560868569;

    weight1(1) = 0.101228536290376259152531354310;
    weight1(2) = 0.222381034453374470544355994426;
    weight1(3) = 0.313706645877887287337962201987;
    weight1(4) = 0.362683783378361982965150449277;
    weight1(5) = 0.362683783378361982965150449277;
    weight1(6) = 0.313706645877887287337962201987;
    weight1(7) = 0.222381034453374470544355994426;
    weight1(8) = 0.101228536290376259152531354310;

    weight2(1) = 0.00329519144;
    weight2(2) = 0.01784290266;
    weight2(3) = 0.04543931950;
    weight2(4) = 0.07919959949;
    weight2(5) = 0.10604735944;
    weight2(6) = 0.11250579947;
    weight2(7) = 0.09111902364;
    weight2(8) = 0.04455080436;

    xtab2(1) = 0.04463395529;
    xtab2(2) = 0.14436625704;
    xtab2(3) = 0.28682475714;
    xtab2(4) = 0.45481331520;
    xtab2(5) = 0.62806783542;
    xtab2(6) = 0.78569152060;
    xtab2(7) = 0.90867639210;
    xtab2(8) = 0.98222008485;

    k = 0;
    for j = 1 : norder2
      for i = 1 : norder2
        k = k + 1;
        xtab(k) = 1.0 - xtab2(j);
        ytab(k) = 0.5 * ( 1.0 + xtab1(i) ) * xtab2(j);
        weight(k) = weight1(i) * weight2(j);
      end
    end
%
%  19 points, precision 8.
%
  elseif ( rule == 17 )

    a = 1.0 / 3.0;
    b = ( 9.0 + 2.0 * sqrt ( 15.0 ) ) / 21.0;
    c = ( 6.0 -       sqrt ( 15.0 ) ) / 21.0;
    d = ( 9.0 - 2.0 * sqrt ( 15.0 ) ) / 21.0;
    e = ( 6.0 +       sqrt ( 15.0 ) ) / 21.0;
    f = ( 40.0 - 10.0 * sqrt ( 15.0 ) ...
      + 10.0 * sqrt ( 7.0 ) + 2.0 * sqrt ( 105.0 ) ) / 90.0;
    g = ( 25.0 +  5.0 * sqrt ( 15.0 ) ...
      -  5.0 * sqrt ( 7.0 ) - sqrt ( 105.0 ) ) / 90.0;
    p = ( 40.0 + 10.0 * sqrt ( 15.0 ) ...
      + 10.0 * sqrt ( 7.0 ) - 2.0 * sqrt ( 105.0 ) ) / 90.0;
    q = ( 25.0 -  5.0 * sqrt ( 15.0 ) ...
      -  5.0 * sqrt ( 7.0 ) + sqrt ( 105.0 ) ) / 90.0;
    r = ( 40.0 + 10.0 * sqrt ( 7.0 ) ) / 90.0;
    s = ( 25.0 +  5.0 * sqrt ( 15.0 ) - 5.0 * sqrt ( 7.0 ) ...
      - sqrt ( 105.0 ) ) / 90.0;
    t = ( 25.0 -  5.0 * sqrt ( 15.0 ) - 5.0 * sqrt ( 7.0 ) ...
      + sqrt ( 105.0 ) ) / 90.0;

    w1 = ( 7137.0 - 1800.0 * sqrt ( 7.0 ) ) / 62720.0;
    w2 = - 9301697.0 / 4695040.0 - 13517313.0 * sqrt ( 15.0 ) ...
      / 23475200.0 + 764885.0 * sqrt ( 7.0 ) / 939008.0 ...
      + 198763.0 * sqrt ( 105.0 ) / 939008.0;
    w2 = w2 / 3.0;
    w3 = -9301697.0 / 4695040.0 + 13517313.0 * sqrt ( 15.0 ) ...
      / 23475200.0 ...
      + 764885.0 * sqrt ( 7.0 ) / 939008.0 ...
      - 198763.0 * sqrt ( 105.0 ) / 939008.0;
    w3 = w3 / 3.0;
    w4 = ( 102791225.0 - 23876225.0 * sqrt ( 15.0 ) ...
      - 34500875.0 * sqrt ( 7.0 ) ...
      + 9914825.0 * sqrt ( 105.0 ) ) / 59157504.0;
    w4 = w4 / 3.0;
    w5 = ( 102791225.0 + 23876225.0 * sqrt ( 15.0 ) ...
      - 34500875.0 * sqrt ( 7.0 ) ...
      - 9914825 * sqrt ( 105.0 ) ) / 59157504.0;
    w5 = w5 / 3.0;
    w6 = ( 11075.0 - 3500.0 * sqrt ( 7.0 ) ) / 8064.0;
    w6 = w6 / 6.0;

    xtab(1:19) =   [  a,  b,  c,  c,  d,  e,  e,  f,  g,  g,  p,  q,  q, ...
      r,  r,  s,  s,  t,  t ];
    ytab(1:19) =   [  a,  c,  b,  c,  e,  d,  e,  g,  f,  g,  q,  p,  q, ...
      s,  t,  r,  t,  r,  s ];
    weight(1:19) = [ w1, w2, w2, w2, w3, w3, w3, w4, w4, w4, w5, w5, w5, ...
      w6, w6, w6, w6, w6, w6 ];
%
%  19 points, precision 9.
%
  elseif ( rule == 18 )

    a = 1.0 / 3.0;
    b = 0.02063496160252593;
    c = 0.4896825191987370;
    d = 0.1258208170141290;
    e = 0.4370895914929355;
    f = 0.6235929287619356;
    g = 0.1882035356190322;
    r = 0.9105409732110941;
    s = 0.04472951339445297;
    t = 0.7411985987844980;
    u = 0.03683841205473626;
    v = 0.22196298916076574;

    w1 = 0.09713579628279610;
    w2 = 0.03133470022713983;
    w3 = 0.07782754100477543;
    w4 = 0.07964773892720910;
    w5 = 0.02557767565869810;
    w6 = 0.04328353937728940;

    xtab(1:19) =   [  a,  b,  c,  c,  d,  e,  e,  f,  g,  g,  r,  s,  s, ...
      t, t, u, u, v, v ];
    ytab(1:19) =   [  a,  c,  b,  c,  e,  d,  e,  g,  f,  g,  s,  r,  s, ...
      u, v, t, v, t, u ];
    weight(1:19) = [ w1, w2, w2, w2, w3, w3, w3, w4, w4, w4, w5, w5, w5, ...
      w6, w6, w6, w6, w6, w6 ];
%
%  28 points, precision 11.
%
  elseif ( rule == 19 )

    a = 1.0 / 3.0;
    b = 0.9480217181434233;
    c = 0.02598914092828833;
    d = 0.8114249947041546;
    e = 0.09428750264792270;
    f = 0.01072644996557060;
    g = 0.4946367750172147;
    p = 0.5853132347709715;
    q = 0.2073433826145142;
    r = 0.1221843885990187;
    s = 0.4389078057004907;
    t = 0.6779376548825902;
    u = 0.04484167758913055;
    v = 0.27722066752827925;
    w = 0.8588702812826364;
    x = 0.0;
    y = 0.1411297187173636;

    w1 = 0.08797730116222190;
    w2 = 0.008744311553736190;
    w3 = 0.03808157199393533;
    w4 = 0.01885544805613125;
    w5 = 0.07215969754474100;
    w6 = 0.06932913870553720;
    w7 = 0.04105631542928860;
    w8 = 0.007362383783300573;

    xtab(1:28) =   [  a,  b,  c,  c,  d,  e,  e,  f,  g,  g,  p,  q,  q, ...
       r,  s,  s,  t,  t,  u,  u,  v,  v,  w,  w,  x,  x,  y,  y ];
    ytab(1:28) =   [  a,  c,  b,  c,  e,  d,  e,  g,  f,  g,  q,  p,  q, ...
       s,  r,  s,  u,  v,  t,  v,  t,  u,  x,  y,  w,  y,  w,  x ];
    weight(1:28) = [ w1, w2, w2, w2, w3, w3, w3, w4, w4, w4, w5, w5, w5, ...
      w6, w6, w6, w7, w7, w7, w7, w7, w7, w8, w8, w8, w8, w8, w8 ];
%
%  37 points, precision 13.
%
  elseif ( rule == 20 )

    a = 1.0 / 3.0;
    b = 0.950275662924105565450352089520;
    c = 0.024862168537947217274823955239;
    d = 0.171614914923835347556304795551;
    e = 0.414192542538082326221847602214;
    f = 0.539412243677190440263092985511;
    g = 0.230293878161404779868453507244;

    w1 = 0.051739766065744133555179145422;
    w2 = 0.008007799555564801597804123460;
    w3 = 0.046868898981821644823226732071;
    w4 = 0.046590940183976487960361770070;
    w5 = 0.031016943313796381407646220131;
    w6 = 0.010791612736631273623178240136;
    w7 = 0.032195534242431618819414482205;
    w8 = 0.015445834210701583817692900053;
    w9 = 0.017822989923178661888748319485;
    wx = 0.037038683681384627918546472190;

    xtab(1:10) =   [ a, b, c, c, d, e, e, f, g, g ];
    ytab(1:10) =   [ a, c, b, c, e, d, e, g, f, g ];
    weight(1:37) = [ w1, w2, w2, w2, w3, w3, w3, w4, w4, w4, w5, w5, w5, ...
      w6, w6, w6, w7, w7, w7, w8, w8, w8, w8, w8, w8, w9, ...
      w9, w9, w9, w9, w9, wx, wx, wx, wx, wx, wx ];

    a = 0.772160036676532561750285570113;
    b = 0.113919981661733719124857214943;

    xtab(11) = a;
    ytab(11) = b;

    xtab(12) = b;
    ytab(12) = a;

    xtab(13) = b;
    ytab(13) = b;

    a = 0.009085399949835353883572964740;
    b = 0.495457300025082323058213517632;

    xtab(14) = a;
    ytab(14) = b;

    xtab(15) = b;
    ytab(15) = a;

    xtab(16) = b;
    ytab(16) = b;

    a = 0.062277290305886993497083640527;
    b = 0.468861354847056503251458179727;

    xtab(17) = a;
    ytab(17) = b;

    xtab(18) = b;
    ytab(18) = a;

    xtab(19) = b;
    ytab(19) = b;

    a = 0.022076289653624405142446876931;
    b = 0.851306504174348550389457672223;
    c = 1.0 - a - b;

    xtab(20) = a;
    ytab(20) = b;

    xtab(21) = a;
    ytab(21) = c;

    xtab(22) = b;
    ytab(22) = a;

    xtab(23) = b;
    ytab(23) = c;

    xtab(24) = c;
    ytab(24) = a;

    xtab(25) = c;
    ytab(25) = b;

    a = 0.018620522802520968955913511549;
    b = 0.689441970728591295496647976487;
    c = 1.0 - a - b;

    xtab(26) = a;
    ytab(26) = b;

    xtab(27) = a;
    ytab(27) = c;

    xtab(28) = b;
    ytab(28) = a;

    xtab(29) = b;
    ytab(29) = c;

    xtab(30) = c;
    ytab(30) = a;

    xtab(31) = c;
    ytab(31) = b;

    a = 0.096506481292159228736516560903;
    b = 0.635867859433872768286976979827;
    c = 1.0 - a - b;

    xtab(32) = a;
    ytab(32) = b;

    xtab(33) = a;
    ytab(33) = c;

    xtab(34) = b;
    ytab(34) = a;

    xtab(35) = b;
    ytab(35) = c;

    xtab(36) = c;
    ytab(36) = a;

    xtab(37) = c;
    ytab(37) = b;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_UNIT_SET - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of RULE = %d\n', rule );
    error ( 'TRIANGLE_UNIT_SET - Fatal error!' );

  end

  return
end
