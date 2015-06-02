function [ w, x ] = gm_rule_set ( rule, dim_num, point_num )

%*****************************************************************************80
%
%% GM_RULE_SET sets a Grundmann-Moeller rule.
%
%  Discussion:
%
%    This is a revised version of the calculation which seeks to compute
%    the value of the weight in a cautious way that avoids intermediate
%    overflow.  Thanks to John Peterson for pointing out the problem on
%    26 June 2008.
%
%    This rule returns weights and abscissas of a Grundmann-Moeller
%    quadrature rule for the DIM_NUM-dimensional unit simplex.
%
%    The dimension POINT_NUM can be determined by calling GM_RULE_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Axel Grundmann, Michael Moeller,
%    Invariant Integration Formulas for the N-Simplex
%    by Combinatorial Methods,
%    SIAM Journal on Numerical Analysis,
%    Volume 15, Number 2, April 1978, pages 282-290.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%    0 <= RULE.
%
%    Input, integer DIM_NUM, the spatial dimension.
%    1 <= DIM_NUM.
%
%    Input, integer POINT_NUM, the number of points in the rule.
%
%    Output, real W(POINT_NUM), the weights.
%
%    Output, real X(DIM_NUM,POINT_NUM), the abscissas.
%
  s = rule;
  d = 2 * s + 1;
  k = 0;
  n = dim_num;
  one_pm = 1;

  for i = 0 : s

    weight =  one_pm;

    for j = 1 : max ( n, d, d + n - i )

      if ( j <= n )
        weight = weight *  ( j );
      end
      if ( j <= d )
        weight = weight * ( d + n - 2 * i );
      end
      if ( j <= 2 * s )
        weight = weight / 2.0;
      end
      if ( j <= i )
        weight = weight / j;
      end
      if ( j <= d + n - i )
        weight = weight / j;
      end

    end

    one_pm = - one_pm;

    beta_sum = s - i;
    more = 0;
    beta = [];
    h = 0;
    t = 0;

    while ( 1 )

      [ beta, more, h, t ] = comp_next ( beta_sum, dim_num + 1, ...
        beta, more, h, t );

      k = k + 1;

      w(k) = weight;

      x(1:dim_num,k) = ( 2 * beta(2:dim_num+1)' + 1 ) / ( d + n - 2 * i );

      if ( ~more )
        break
      end

    end

  end

  return
end
