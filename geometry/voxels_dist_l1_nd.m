function value = voxels_dist_l1_dim_num ( dim_num, p1, p2 )

%*****************************************************************************80
%
%% VOXELS_DIST_L1_ND computes the L1 distance between voxels in ND.
%
%  Discussion:
%
%    A voxel is generally a point in 3D space with integer coordinates.
%    There's no reason to stick with 3D, so this routine will handle any dimension.
%
%    We can imagine that, in traveling from P1 to P2, we are allowed to 
%    increment or decrement just one coordinate at a time.  The minimum number 
%    of such changes required is the L1 distance. 
%
%    More formally,
%
%      DIST_L1 ( P1, P2 ) = sum ( 1 <= I <= N ) | P1(I) - P2(I) |
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer P1(DIM_NUM), the voxel that begins the line.
%
%    Input, integer P2(DIM_NUM), the voxel that ends the line.
%
%    Output, integer VALUE, the L1 distance between the voxels.
%
  value = sum ( abs ( p1(1:dim_num) - p2(1:dim_num) ) );

  return
end
