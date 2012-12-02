function indx = multigrid_index_z ( dim_num, order_1d, order_nd )

%*****************************************************************************80
%
%% MULTIGRID_INDEX_Z returns an indexed multidimensional grid.
%
%  Discussion:
%
%    For dimension DIM, the number of points is ORDER_1D(DIM).
%
%    We assume that ORDER_1D(DIM) is an odd number,
%      ORDER_1D(DIM) = N = 2 * M + 1
%    so that the points have coordinates
%      -M/M, -(M-1)/M, ..., -1/M, 0/M, 1/M, 2/M, 3/M, ..., (M-1)/M, M/M.
%    and we index them as
%      -M,   -(M-1),        -1,   0,   1,   2,   3,   ...,  M-1,    M.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2011
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
%    Input, integer DIM_NUM, the spatial dimension of the points.
%
%    Input, integer ORDER_1D(DIM_NUM,1), the order of the
%    rule in each dimension.
%
%    Input, integer ORDER_ND, the product of the entries of ORDER_1D.
%
%    Output, integer INDX(DIM_NUM,ORDER_ND), the indices of the points in
%    the grid.  The second dimension of this array is equal to the
%    product of the entries of ORDER_1D.
%
  indx = zeros ( dim_num, order_nd );

  a = zeros ( dim_num, 1 );
  more = 0;
  p = 0;

  while ( 1 )

    [ a, more ] = vec_colex_next2 ( dim_num, order_1d, a, more );

    if ( ~more )
      break
    end

    p = p + 1;
%
%  The values of A(DIM) are between 0 and ORDER_1D(DIM)-1 = N - 1 = 2 * M.
%  Subtracting M sets the range to -M to +M, as we wish.
%
    indx(1:dim_num,p) = a(1:dim_num,1) - round ( ( order_1d(1:dim_num,1) - 1 ) / 2 );

  end

  return
end
