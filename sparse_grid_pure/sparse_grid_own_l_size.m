function point_num = sparse_grid_own_l_size ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_OWN_L_SIZE Open Weakly Nested Linear Growth.
%
%  Discussion:
%
%    This calculation assumes that a linear growth rule is being used,
%    that is, that the 1D rules have orders 1, 3, 5, 7, 9, and so on.
%
%    This calculation assumes that the 1D family of quadrature rules 
%    contains only one repeated point, presumably the value 0.0.
%    This assumption holds for Gauss-Legendre, Gauss-Hermite and 
%    Generalized Gauss-Hermite rules.
%
%    The routine then counts the number of unique abscissas that will
%    be generated for a sparse grid of given dimension and level.
%
%    The computation is complicated.  It starts by counting just those
%    abscissas which have no 0.0 in them.  This is relatively easy, since
%    it is like counting the points in a sparse grid that uses open 
%    non-nested rules, but for which the order of each rule is reduced by 1.
%
%    Then we have to count the abscissas with one 0.0, two 0.0's and so
%    on to DIM_NUM zeros.  We are assuming this is an isotropic grid,
%    so for a particular number K of zeroes we only need to count the case
%    where the first K entries are zero, and multiply by C(DIM_NUM,K).
%
%    To count the number of entries with K zeroes, (and assuming 0 < K),
%    then, we essentially count the number of abscissas in an open 
%    non-nested rule as before, but modifed so that the minimum level is 0,
%    rather than LEVEL_MAX - DIM_NUM + 1.
%
%    I will mention that this was a rather difficult computation to
%    figure out!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the maximum value of LEVEL.
%
%    Output, integer POINT_NUM, the total number of unique 
%    points in the grids.
%

%
%  Special case.
%
  if ( level_max < 0 )
    point_num = 0;
    return
  end

  if ( level_max == 0 )
    point_num = 1;
    return
  end
%
%  Construct the vector that counts the new points in the "depleted" 1D rule.
%
  new_1d = zeros ( level_max+1, 1 );

  new_1d(1) = 0;

  for l = 1 : level_max
    new_1d(l+1) = 2 * l;
  end
%
%  Count the nonzero points in the full dimensional table with the usual
%  LEVEL_MIN restriction.
%
%  Then count the points with 1, 2, 3, ... DIM_NUM zeroes, by counting
%  the nonzero points in a DIM_NUM2 table, with LEVEL_MIN set to 0, and
%  multiplying by the appropriate combinatorial coefficient.
%
  point_num = 0;

  for dim_num2 = dim_num : -1 : 0

    if ( dim_num2 == dim_num ) 
      level_min = max ( 0, level_max - dim_num + 1 );
    else
      level_min = 0;
    end

    if ( dim_num2 == 0 )

      point_num2 = 1;

    else

      level_1d = zeros ( dim_num2, 1 );

      point_num2 = 0;

      for level = level_min : level_max

        more = 0;
        h = 0;
        t = 0;

        while ( 1 )

          [ level_1d, more, h, t ] = comp_next ( level, dim_num2, level_1d, ...
            more, h, t );

          point_num2 = point_num2 + prod ( new_1d(level_1d(1:dim_num2)+1) );

          if ( ~more )
            break
          end

        end

      end

    end

    point_num = point_num + i4_choose ( dim_num, dim_num2 ) * point_num2;

  end

  return
end
