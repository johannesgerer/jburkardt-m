function indx = multigrid_index0 ( dim_num, order_1d, order_nd )

%*****************************************************************************80
%
%% MULTIGRID_INDEX0 returns an indexed multidimensional grid.
%
%  Discussion:
%
%    For dimension DIM, the second index of INDX may vary from 
%    0 to ORDER_1D(DIM)-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension of the points.
%
%    Input, integer ORDER_1D(DIM_NUM), the order of the
%    rule in each dimension.
%
%    Input, integer ORDER_ND, the product of the entries of ORDER_1D.
%
%    Output, integer INDX(DIM_NUM,ORDER_ND), the indices of the points in
%    the grid.  The second dimension of this array is equal to the
%    product of the entries of ORDER_1D.
%
  p = 0;
  indx = zeros(dim_num,order_nd);

  a = [];
  more = 0;

  while ( 1 )

    [ a, more ] = vec_colex_next2 ( dim_num, order_1d, a, more );

    if ( ~more )
      break
    end

    p = p + 1;

    indx(1:dim_num,p) = a(1:dim_num)';

  end

  return
end
