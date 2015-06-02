function [ xmat, ymat ] = r8vec_mesh_2d ( nx, ny, xvec, yvec )

%*****************************************************************************80
%
%% R8VEC_MESH_2D creates a 2D mesh from X and Y vectors.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    NX = 2
%    XVEC = ( 1, 2, 3 )
%    NY = 3
%    YVEC = ( 4, 5 )
%
%    XMAT = (
%      1, 2, 3
%      1, 2, 3 )
%
%    YMAT = (
%      4, 4, 4
%      5, 5, 5 ) 
%    
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2013
%
%  Parameters:
%
%    Input, integer NX, NY, the number of X and Y values.
%
%    Input, real XVEC(NX), YVEC(NY), the X and Y coordinate
%    values.
%
%    Output, real XMAT(NX,NY), YMAT(NX,NY), the coordinate
%    values of points on an NX by NY mesh.
%
  xmat = zeros ( nx, ny );
  ymat = zeros ( nx, ny );

  for j = 1 : ny
    xmat(1:nx,j) = xvec(1:nx);
  end

  for j = 1 : ny
    ymat(1:nx,j) = yvec(j);
  end

 return
end