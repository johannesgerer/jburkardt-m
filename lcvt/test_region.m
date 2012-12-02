function value = test_region ( x, dim_num )

%*****************************************************************************80
%
%% TEST_REGION determines if a point is within the physical region.
%
%  Discussion:
%
%    Using a simple routine like this is only appropriate for a simple
%    region that can be easily defined by user formulas.
%
%    Computation of the "on-the-boundary" case is not considered important.
%    Only "inside" or "outside" is essential.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(DIM_NUM), the point to be checked.
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Output, integer VALUE, indicates the status of the point:
%    -1: the point is on the boundary of the region.
%     0: the point is outside the region.
%    +1: the point is inside the region.
%
  value = 1;

  return
end
