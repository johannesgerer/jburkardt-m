function order = level_growth_to_order ( dim_num, level, rule, growth )

%*****************************************************************************80
%
%% LEVEL_GROWTH_TO_ORDER: convert Level and Growth to Order.
%
%  Discussion:
%
%    This function is given level, rule, and growth information
%    for each dimension of a quadrature rule, and determines the
%    corresponding order of the rule in each dimension.
%
%    This is a revised version of LEVEL_GROWTH_TO_ORDER.
%
%    In particular, it revises the interpretation of the RULE vector as 
%    far as the values 10, 11, and 12 are concerned.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL(DIM_NUM), the 1D levels.
%
%    Input, integer RULE(DIM_NUM), the rule in each dimension.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested;
%     2, "F2",  Fejer Type 2, Open Fully Nested;
%     3, "GP",  Gauss Patterson, Open Fully Nested;
%     4, "GL",  Gauss Legendre, Open Weakly Nested;
%     5, "GH",  Gauss Hermite, Open Weakly Nested;
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested;
%     7, "LG",  Gauss Laguerre, Open Non Nested;
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested;
%     9, "GJ",  Gauss Jacobi, Open Non Nested;
%    10, "HGK", Hermite Genz-Keister, Open Fully Nested.
%    11, "UO",  User supplied Open, presumably Non Nested.
%    12, "UC",  User supplied Closed, presumably Non Nested.
%
%    Input, integer GROWTH(DIM_NUM), the desired growth in
%    each dimension.
%    0, "DF", default growth associated with this quadrature rule
%    1, "SL", slow linear, L+1;
%    2  "SO", slow linear odd, O=1+2((L+1)/2)
%    3, "ML", moderate linear, 2L+1;
%    4, "SE", slow exponential;
%    5, "ME", moderate exponential;
%    6, "FE", full exponential.
%
%    Output, int ORDER[DIM_NUM], the 1D orders (number of points).
%

%
%  Check the input.
%
  for dim = 1 : dim_num

    if ( level(dim) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
      fprintf ( 1,'  Negative value of LEVEL(DIM)!\n' );
      fprintf ( 1, '  LEVEL(%d) = %d\n', dim, level(dim) );
      error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
    end

    if ( rule(dim) < 1 || 12 < rule(dim) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of RULE(DIM)!\n' );
      fprintf ( 1, '  RULE(%d) = %d\n', dim, rule(dim) );
      error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
    end

    if ( growth(dim) < 0 || 6 < growth(dim) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of GROWTH(DIM)!\n' );
      fprintf ( 1, '  GROWTH(%d) = %d\n', dim, growth(dim) );
      error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
    end

  end
%
%  Compute the order vector.
%
  for dim = 1 : dim_num
%
%  CC
%  Default is Moderate Exponential Growth.
%
    if ( rule(dim) == 1 )
      if ( growth(dim) == 1 )
        o = level(dim) + 1;
      elseif ( growth(dim) == 2 )
        o = 2 * floor ( ( level(dim) + 1 ) / 2 ) + 1;
      elseif ( growth(dim) == 3 )
        o = 2 * level(dim) + 1;
      elseif ( growth(dim) == 4 )
        if ( level(dim) == 0 )
          o = 1;
        else
          o = 2;
          while ( o < 2 * level(dim) + 1 )
            o = 2 * ( o - 1 ) + 1;
          end
        end
      elseif ( growth(dim) == 5 || growth(dim) == 0 )
        if ( level(dim) == 0 )
          o = 1;
        else
          o = 2;
          while ( o < 4 * level(dim) + 1 )
            o = 2 * ( o - 1 ) + 1;
          end
        end
      elseif ( growth(dim) == 6 )
        if ( level(dim) == 0 )
          o = 1;
        else
          o = 2 ^ level(dim) + 1;
        end
      end
%
%  F2
%  Default is Moderate Exponential Growth.
%
    elseif ( rule(dim) == 2 )
      if ( growth(dim) == 1 )
        o = level(dim) + 1;
      elseif ( growth(dim) == 2 )
        o = 2 * floor ( ( level(dim) + 1 ) / 2 ) + 1;
      elseif ( growth(dim) == 3 )
        o = 2 * level(dim) + 1;
      elseif ( growth(dim) == 4 )
        o = 1;
        while ( o < 2 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 5 || growth(dim) == 0 )
        o = 1;
        while ( o < 4 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 6 )
        o =  2 ^ ( level(dim) + 1 ) - 1;
      end
%
%  GP
%  Default is Moderate Exponential Growth.
%
    elseif ( rule(dim) == 3 )
      if ( growth(dim) == 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
        fprintf ( 1,'  Growth rate 1 for rule 3 not available!\n' );
        error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
      elseif ( growth(dim) == 2 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
        fprintf ( 1,'  Growth rate 2 for rule 3 not available!\n' );
        error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
      elseif ( growth(dim) == 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
        fprintf ( 1,'  Growth rate 3 for rule 3 not available!\n' );
        error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
      elseif ( growth(dim) == 4 )
        if ( level(dim) == 0 )
          o = 1;
        else
          p = 5;
          o = 3;
          while ( p < 2 * level(dim) + 1 )
            p = 2 * p + 1;
            o = 2 * o + 1;
          end
        end
      elseif ( growth(dim) == 5 || growth(dim) == 0 )
        if ( level(dim) == 0 )
          o = 1;
        else
          p = 5;
          o = 3;
          while ( p < 4 * level(dim) + 1 )
            p = 2 * p + 1;
            o = 2 * o + 1;
          end
        end
      elseif ( growth(dim) == 6 )
        o =  2 ^ ( level(dim) + 1 ) - 1;
      end
%
%  GL
%  Default is Moderate Linear Growth.
%
    elseif ( rule(dim) == 4 )
      if ( growth(dim) == 1 )
        o = level(dim) + 1;
      elseif ( growth(dim) == 2 )
        o = 2 * floor ( ( level(dim) + 1 ) / 2 ) + 1;
      elseif ( growth(dim) == 3 || growth(dim) == 0 )
        o = 2 * level(dim) + 1;
      elseif ( growth(dim) == 4 )
        o = 1;
        while ( 2 * o - 1 < 2 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 5 )
        o = 1;
        while ( 2 * o - 1 < 4 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 6 )
        o =  2 ^ ( level(dim) + 1 ) - 1;
      end
%
%  GH
%  Default is Moderate Linear Growth.
%
    elseif ( rule(dim) == 5 )
      if ( growth(dim) == 1 )
        o = level(dim) + 1;
      elseif ( growth(dim) == 2 )
        o = 2 * floor ( ( level(dim) + 1 ) / 2 ) + 1;
      elseif ( growth(dim) == 3 || growth(dim) == 0 )
        o = 2 * level(dim) + 1;
      elseif ( growth(dim) == 4 )
        o = 1;
        while ( 2 * o - 1 < 2 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 5 )
        o = 1;
        while ( 2 * o - 1 < 4 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 6 )
        o =  2 ^ ( level(dim) + 1 ) - 1;
      end
%
%  GGH
%  Default is Moderate Linear Growth.
%
    elseif ( rule(dim) == 6 )
      if ( growth(dim) == 1 )
        o = level(dim) + 1;
      elseif ( growth(dim) == 2 )
        o = 2 * floor ( ( level(dim) + 1 ) / 2 ) + 1;
      elseif ( growth(dim) == 3 || growth(dim) == 0 )
        o = 2 * level(dim) + 1;
      elseif ( growth(dim) == 4 )
        o = 1;
        while ( 2 * o - 1 < 2 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 5 )
        o = 1;
        while ( 2 * o - 1 < 4 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 6 )
        o =  2 ^ ( level(dim) + 1 ) - 1;
      end
%
%  LG
%  Default is Moderate Linear Growth.
%
    elseif ( rule(dim) == 7 )
      if ( growth(dim) == 1 )
        o = level(dim) + 1;
      elseif ( growth(dim) == 2 )
        o = 2 * floor ( ( level(dim) + 1 ) / 2 ) + 1;
      elseif ( growth(dim) == 3 || growth(dim) == 0 )
        o = 2 * level(dim) + 1;
      elseif ( growth(dim) == 4 )
        o = 1;
        while ( 2 * o - 1 < 2 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 5 )
        o = 1;
        while ( 2 * o - 1 < 4 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 6 )
        o =  2 ^ ( level(dim) + 1 ) - 1;
      end
%
%  GLG
%  Default is Moderate Linear Growth.
%
    elseif ( rule(dim) == 8 )
      if ( growth(dim) == 1 )
        o = level(dim) + 1;
      elseif ( growth(dim) == 2 )
        o = 2 * floor ( ( level(dim) + 1 ) / 2 ) + 1;
      elseif ( growth(dim) == 3 || growth(dim) == 0 )
        o = 2 * level(dim) + 1;
      elseif ( growth(dim) == 4 )
        o = 1;
        while ( 2 * o - 1 < 2 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 5 )
        o = 1;
        while ( 2 * o - 1 < 4 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 6 )
        o =  2 ^ ( level(dim) + 1 ) - 1;
      end
%
%  GJ
%  Default is Moderate Linear Growth.
%
    elseif ( rule(dim) == 9 )
      if ( growth(dim) == 1 )
        o = level(dim) + 1;
      elseif ( growth(dim) == 2 )
        o = 2 * floor ( ( level(dim) + 1 ) / 2 ) + 1;
      elseif ( growth(dim) == 3 || growth(dim) == 0 )
        o = 2 * level(dim) + 1;
      elseif ( growth(dim) == 4 )
        o = 1;
        while ( 2 * o - 1 < 2 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 5 )
        o = 1;
        while ( 2 * o - 1 < 4 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 6 )
        o =  2 ^ ( level(dim) + 1 ) - 1;
      end
%
%  HGK
%  Default is Moderate Exponential Growth.
%
    elseif ( rule(dim) == 10 )
%
%  The order of the final HGK rule can be one of 35, 37, 41 or 43.
%  The precision of the final HGK rule must correspondingly be 51, 55, 63 or 67.
%
      o_hgk = [ 1, 3,  9, 19, 43 ]';
      p_hgk = [ 1, 5, 15, 29, 67 ]';

      if ( growth(dim) == 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
        fprintf ( 1,'  Growth rate 1 for rule 10 not available!\n' );
        error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
      elseif ( growth(dim) == 2 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
        fprintf ( 1,'  Growth rate 2 for rule 10 not available!\n' );
        error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
      elseif ( growth(dim) == 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
        fprintf ( 1,'  Growth rate 3 for rule 10 not available!\n' );
        error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
      elseif ( growth(dim) == 4 )
        l = 0;
        p = p_hgk(l+1);
        o = o_hgk(l+1);
        while ( p < 2 * level(dim) + 1 )
          l = l + 1;
          if ( 5 < l )
            fprintf ( 1, '\n' );
            fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
            fprintf ( 1, '  Hermite Genz-Keister maximum level exceeded.\n' );
            error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
          end
          p = p_hgk(l+1);
          o = o_hgk(l+1);
        end
      elseif ( growth(dim) == 5 || growth(dim) == 0 )
        l = 0;
        p = p_hgk(l+1);
        o = o_hgk(l+1);
        while ( p < 4 * level(dim) + 1 )
          l = l + 1;
          if ( 5 < l )
            fprintf ( 1, '\n' );
            fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
            fprintf ( 1, '  Hermite Genz-Keister maximum level exceeded.\n' );
            error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
          end
          p = p_hgk(l+1);
          o = o_hgk(l+1);
        end
      elseif ( growth(dim) == 6 )
        l = level(dim);
        l = max ( l, 0 );
        if ( 5 < l )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'LEVEL_GROWTH_TO_ORDER - Fatal error!\n' );
          fprintf ( 1, '  Hermite Genz-Keister maximum level exceeded.\n' );
          error ( 'LEVEL_GROWTH_TO_ORDER - Fatal error!' );
        end
        o = o_hgk(l+1);
      end
%
%  UO
%  Default is Moderate Linear Growth.
%  We'll assume the rule is of OPEN type and that it
%  has a precision typical of Gauss rules.
%
    elseif ( rule(dim) == 11 )
      if ( growth(dim) == 1 )
        o = level(dim) + 1;
      elseif ( growth(dim) == 2 )
        o = 2 * floor ( ( level(dim) + 1 ) / 2 ) + 1;
      elseif ( growth(dim) == 3 || growth(dim) == 0 )
        o = 2 * level(dim) + 1;
      elseif ( growth(dim) == 4 )
        o = 1;
        while ( 2 * o - 1 < 2 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 5 )
        o = 1;
        while ( 2 * o - 1 < 4 * level(dim) + 1 )
          o = 2 * o + 1;
        end
      elseif ( growth(dim) == 6 )
        o =  2 ^ ( level(dim) + 1 ) - 1;
      end
%
%  UC
%  Default is Moderate Linear Growth.
%  We'll assume the rule is of CLOSED type and that it
%  has a precision typical of Clenshaw-Curtis rules.
%
    elseif ( rule(dim) == 12 )
      if ( growth(dim) == 1 )
        o = level(dim) + 1;
      elseif ( growth(dim) == 2 )
        o = 2 * floor ( ( level(dim) + 1 ) / 2 ) + 1;
      elseif ( growth(dim) == 3 || growth(dim) == 0 )
        o = 2 * level(dim) + 1;
      elseif ( growth(dim) == 4 )
        if ( level(dim) == 0 )
          o = 1;
        else
          o = 2;
          while ( o < 2 * level(dim) + 1 )
            o = 2 * ( o - 1 ) + 1;
          end
        end
      elseif ( growth(dim) == 5 )
        if ( level(dim) == 0 )
          o = 1;
        else
          o = 2;
          while ( o < 4 * level(dim) + 1 )
            o = 2 * ( o - 1 ) + 1;
          end
        end
      elseif ( growth(dim) == 6 )
        if ( level(dim) == 0 )
          o = 1;
        else
          o =  2 ^ ( level(dim) + 1;
        end
      end

    end

    order(dim) = o;

  end

  return
end
