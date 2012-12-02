function point = cc_grid ( dim_num, order_1d, order_nd )

%*****************************************************************************80
%
%% CC_GRID returns a multidimensional Clenshaw-Curtis grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension of the points.
%
%    Input, integer ORDER_1D(DIM_NUM), the order of the Clenshaw-Curtis
%    rule in each dimension.
%
%    Input, integer ORDER_ND, the product of the entries of ORDER_1D.
%
%    Output, real POINT(DIM_NUM,ORDER_ND), the points in
%    the grid.  The second dimension of this array is equal to the
%    product of the entries of ORDER_1D.
%
  a = [];
  done = 1;
  p = 0;

  while ( 1 )

    [ a, done, change ] = vec_gray_next ( dim_num, order_1d, a, done );

    if ( done )
      break
    end

    if ( p == 0 )

      for i = 1 : dim_num
        point(i,p+1) = cc_abscissa ( order_1d(i), 1 );
      end

    else

      point(1:dim_num,p+1) = point(1:dim_num,p);
      point(change,p+1) = cc_abscissa ( order_1d(change), a(change)+1 );

    end

    p = p + 1;

  end

  return
end
