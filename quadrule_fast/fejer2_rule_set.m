function [ xtab, weight ] = fejer2_rule_set ( order )

%*****************************************************************************80
%
%% FEJER2_RULE_SET sets abscissas and weights for Fejer type 2 quadrature.
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

    xtab(1) =   -0.5000000000000000;
    xtab(2) =    0.5000000000000000;

    weight(1) =  1.0000000000000000;
    weight(2) =  1.0000000000000000;

  elseif ( order == 3 )

    xtab( 1) =  -0.7071067811865476;
    xtab( 2) =   0.0000000000000000;
    xtab( 3) =   0.7071067811865476;

    weight(1) =  0.6666666666666666;
    weight(2) =  0.6666666666666666;
    weight(3) =  0.6666666666666666;

  elseif ( order == 4 )

    xtab( 1) =  -0.8090169943749475;
    xtab( 2) =  -0.3090169943749475;
    xtab( 3) =   0.3090169943749475;
    xtab( 4) =   0.8090169943749475;

    weight( 1) = 0.4254644007500070;
    weight( 2) = 0.5745355992499930;
    weight( 3) = 0.5745355992499930;
    weight( 4) = 0.4254644007500070;

  elseif ( order == 5 )

    xtab( 1) =  -0.8660254037844387;
    xtab( 2) =  -0.5000000000000000;
    xtab( 3) =   0.0000000000000000;
    xtab( 4) =   0.5000000000000000;
    xtab( 5) =   0.8660254037844387;

    weight( 1) = 0.3111111111111111;
    weight( 2) = 0.4000000000000000;
    weight( 3) = 0.5777777777777777;
    weight( 4) = 0.4000000000000000;
    weight( 5) = 0.3111111111111111;

  elseif ( order == 6 )

    xtab( 1) =  -0.9009688679024191;
    xtab( 2) =  -0.6234898018587336;
    xtab( 3) =  -0.2225209339563144;
    xtab( 4) =   0.2225209339563144;
    xtab( 5) =   0.6234898018587336;
    xtab( 6) =   0.9009688679024191;

    weight( 1) = 0.2269152467244296;
    weight( 2) = 0.3267938603769863;
    weight( 3) = 0.4462908928985841;
    weight( 4) = 0.4462908928985841;
    weight( 5) = 0.3267938603769863;
    weight( 6) = 0.2269152467244296;

  elseif ( order == 7 )

    xtab( 1) =  -0.9238795325112867;
    xtab( 2) =  -0.7071067811865476;
    xtab( 3) =  -0.3826834323650898;
    xtab( 4) =   0.0000000000000000;
    xtab( 5) =   0.3826834323650898;
    xtab( 6) =   0.7071067811865476;
    xtab( 7) =   0.9238795325112867;

    weight( 1) = 0.1779646809620499;
    weight( 2) = 0.2476190476190476;
    weight( 3) = 0.3934638904665215;
    weight( 4) = 0.3619047619047619;
    weight( 5) = 0.3934638904665215;
    weight( 6) = 0.2476190476190476;
    weight( 7) = 0.1779646809620499;

  elseif ( order == 8 )

    xtab( 1) =  -0.9396926207859084;
    xtab( 2) =  -0.7660444431189780;
    xtab( 3) =  -0.5000000000000000;
    xtab( 4) =  -0.1736481776669304;
    xtab( 5) =   0.1736481776669304;
    xtab( 6) =   0.5000000000000000;
    xtab( 7) =   0.7660444431189780;
    xtab( 8) =   0.9396926207859084;

    weight( 1) = 0.1397697435050225;
    weight( 2) = 0.2063696457302284;
    weight( 3) = 0.3142857142857143;
    weight( 4) = 0.3395748964790348;
    weight( 5) = 0.3395748964790348;
    weight( 6) = 0.3142857142857143;
    weight( 7) = 0.2063696457302284;
    weight( 8) = 0.1397697435050225;

  elseif ( order == 9 )

    xtab( 1) =  -0.9510565162951535;
    xtab( 2) =  -0.8090169943749475;
    xtab( 3) =  -0.5877852522924731;
    xtab( 4) =  -0.3090169943749475;
    xtab( 5) =   0.0000000000000000;
    xtab( 6) =   0.3090169943749475;
    xtab( 7) =   0.5877852522924731;
    xtab( 8) =   0.8090169943749475;
    xtab( 9) =   0.9510565162951535;

    weight( 1) = 0.1147810750857217;
    weight( 2) = 0.1654331942222276;
    weight( 3) = 0.2737903534857068;
    weight( 4) = 0.2790112502222170;
    weight( 5) = 0.3339682539682539;
    weight( 6) = 0.2790112502222170;
    weight( 7) = 0.2737903534857068;
    weight( 8) = 0.1654331942222276;
    weight( 9) = 0.1147810750857217;

  elseif ( order == 10 )

    xtab( 1) =  -0.9594929736144974;
    xtab( 2) =  -0.8412535328311812;
    xtab( 3) =  -0.6548607339452851;
    xtab( 4) =  -0.4154150130018864;
    xtab( 5) =  -0.1423148382732851;
    xtab( 6) =   0.1423148382732851;
    xtab( 7) =   0.4154150130018864;
    xtab( 8) =   0.6548607339452851;
    xtab( 9) =   0.8412535328311812;
    xtab(10) =   0.9594929736144974;

    weight( 1) = 0.09441954173982806;
    weight( 2) = 0.1411354380109716;
    weight( 3) = 0.2263866903636005;
    weight( 4) = 0.2530509772156453;
    weight( 5) = 0.2850073526699544;
    weight( 6) = 0.2850073526699544;
    weight( 7) = 0.2530509772156453;
    weight( 8) = 0.2263866903636005;
    weight( 9) = 0.1411354380109716;
    weight(10) = 0.09441954173982806;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEJER2_RULE_SET - Fatal error!\n' );
    fprintf ( 1,'  Illegal value of ORDER = %d\n', order );
    fprintf ( 1, '  Legal values are 1 through 10.\n' );
    error ( 'FEJER2_RULE_SET - Fatal error!' );

  end

  return
end

