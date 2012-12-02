function [ xtab, weight ] = fejer1_rule_set ( order )

%*****************************************************************************80
%
%% FEJER1_RULE_SET sets abscissas and weights for Fejer type 1 quadrature.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%    Walter Gautschi,
%    Numerical Quadrature in the Presence of a Singularity,
%    SIAM Journal on Numerical Analysis,
%    Volume 4, Number 3, 1967, pages 357-362.
%
%    Joerg Waldvogel,
%    Fast Construction of the Fejer and Clenshaw-Curtis Quadrature Rules,
%    BIT Numerical Mathematics,
%    Volume 43, Number 1, 2003, pages 1-18.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.  ORDER should be
%    between 1 and 10.
%
%    Output, real XTAB(ORDER), the abscissas of the rule.
%
%    Output, real WEIGHT(ORDER), the weights of the rule.
%
  if ( order == 1 )

    xtab(1)   =  0.000000000000000;
    weight(1) =  2.000000000000000;

  elseif ( order == 2 )

    xtab(1) =   -0.7071067811865475;
    xtab(2) =    0.7071067811865475;

    weight(1) =  1.000000000000000;
    weight(2) =  1.000000000000000;

  elseif ( order == 3 )

    xtab( 1) =  -0.8660254037844387;
    xtab( 2) =   0.0000000000000000;
    xtab( 3) =   0.8660254037844387;

    weight(1) =  0.4444444444444444;
    weight(2) =  1.111111111111111;
    weight(3) =  0.4444444444444444;

  elseif ( order == 4 )

    xtab( 1) =  -0.9238795325112867;
    xtab( 2) =  -0.3826834323650897;
    xtab( 3) =   0.3826834323650898;
    xtab( 4) =   0.9238795325112867;

    weight( 1) = 0.2642977396044841;
    weight( 2) = 0.7357022603955158;
    weight( 3) = 0.7357022603955158;
    weight( 4) = 0.2642977396044841;

  elseif ( order == 5 )

    xtab( 1) =  -0.9510565162951535;
    xtab( 2) =  -0.5877852522924730;
    xtab( 3) =   0.0000000000000000;
    xtab( 4) =   0.5877852522924731;
    xtab( 5) =   0.9510565162951535;

    weight( 1) = 0.1677812284666835;
    weight( 2) = 0.5255521048666498;
    weight( 3) = 0.6133333333333333;
    weight( 4) = 0.5255521048666498;
    weight( 5) = 0.1677812284666835;

  elseif ( order == 6 )

    xtab( 1) =  -0.9659258262890682;
    xtab( 2) =  -0.7071067811865475;
    xtab( 3) =  -0.2588190451025206;
    xtab( 4) =   0.2588190451025207;
    xtab( 5) =   0.7071067811865476;
    xtab( 6) =   0.9659258262890683;

    weight( 1) = 0.1186610213812358;
    weight( 2) = 0.3777777777777778;
    weight( 3) = 0.5035612008409863;
    weight( 4) = 0.5035612008409863;
    weight( 5) = 0.3777777777777778;
    weight( 6) = 0.1186610213812358;

  elseif ( order == 7 )

    xtab( 1) =  -0.9749279121818237;
    xtab( 2) =  -0.7818314824680295;
    xtab( 3) =  -0.4338837391175581;
    xtab( 4) =   0.0000000000000000;
    xtab( 5) =   0.4338837391175582;
    xtab( 6) =   0.7818314824680298;
    xtab( 7) =   0.9749279121818236;

    weight( 1) = 0.08671618072672234;
    weight( 2) = 0.2878313947886919;
    weight( 3) = 0.3982415401308441;
    weight( 4) = 0.4544217687074830;
    weight( 5) = 0.3982415401308441;
    weight( 6) = 0.2878313947886919;
    weight( 7) = 0.08671618072672234;

  elseif ( order == 8 )

    xtab( 1) =  -0.9807852804032304;
    xtab( 2) =  -0.8314696123025453;
    xtab( 3) =  -0.5555702330196020;
    xtab( 4) =  -0.1950903220161282;
    xtab( 5) =   0.1950903220161283;
    xtab( 6) =   0.5555702330196023;
    xtab( 7) =   0.8314696123025452;
    xtab( 8) =   0.9807852804032304;

    weight( 1) = 0.06698294569858981;
    weight( 2) = 0.2229879330145788;
    weight( 3) = 0.3241525190645244;
    weight( 4) = 0.3858766022223071;
    weight( 5) = 0.3858766022223071;
    weight( 6) = 0.3241525190645244;
    weight( 7) = 0.2229879330145788;
    weight( 8) = 0.06698294569858981;

  elseif ( order == 9 )

    xtab( 1) =  -0.9848077530122080;
    xtab( 2) =  -0.8660254037844385;
    xtab( 3) =  -0.6427876096865394;
    xtab( 4) =  -0.3420201433256685;
    xtab( 5) =   0.0000000000000000;
    xtab( 6) =   0.3420201433256688;
    xtab( 7) =   0.6427876096865394;
    xtab( 8) =   0.8660254037844387;
    xtab( 9) =   0.9848077530122080;

    weight( 1) = 0.05273664990990676;
    weight( 2) = 0.1791887125220458;
    weight( 3) = 0.2640372225410044;
    weight( 4) = 0.3308451751681364;
    weight( 5) = 0.3463844797178130;
    weight( 6) = 0.3308451751681364;
    weight( 7) = 0.2640372225410044;
    weight( 8) = 0.1791887125220458;
    weight( 9) = 0.05273664990990676;

  elseif ( order == 10 )

    xtab( 1) =  -0.9876883405951377;
    xtab( 2) =  -0.8910065241883678;
    xtab( 3) =  -0.7071067811865475;
    xtab( 4) =  -0.4539904997395467;
    xtab( 5) =  -0.1564344650402306;
    xtab( 6) =   0.1564344650402309;
    xtab( 7) =   0.4539904997395468;
    xtab( 8) =   0.7071067811865476;
    xtab( 9) =   0.8910065241883679;
    xtab(10) =   0.9876883405951378;

    weight( 1) = 0.04293911957413078;
    weight( 2) = 0.1458749193773909;
    weight( 3) = 0.2203174603174603;
    weight( 4) = 0.2808792186638755;
    weight( 5) = 0.3099892820671425;
    weight( 6) = 0.3099892820671425;
    weight( 7) = 0.2808792186638755;
    weight( 8) = 0.2203174603174603;
    weight( 9) = 0.1458749193773909;
    weight(10) = 0.04293911957413078;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEJER1_RULE_SET - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    fprintf ( 1, '  Legal values are 1 through 10.\n' );
    error ( 'FEJER1_RULE_SET - Fatal error!' );

  end

  return
end
