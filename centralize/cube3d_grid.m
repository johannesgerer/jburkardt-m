function [ x1, x2, x3 ] = cube3d_grid ( ng, x0 )

%*****************************************************************************80
%
%% CUBE3D_GRID projects hypersphere gridpoints onto the surface of a cube in 3D. 
%
%  Discussion:
%
%    In M dimensions, the hypersphere coordinate system uses an M-dimensional
%    center point X0, a nonnegative distance R, and M-1 angular coordinates
%    THETA.
%
%    A grid of index NG is a collection of values for THETA that is a cartesian
%    product formed by 2*NG or 2*NG+1 points in THETA1, and NG-1 or NG+1
%    points in each further angle.
% 
%    Coordinate THETA1 uses 2*NG points:
%      (0:2*N-1) * PI / NG
%    Other THETA coordinates use NG-1 points:
%      (1:NG-1) * PI / NG
%
%    so that the total number of points in a grid of index NG is 
%    therefore N=(2*NG)*(NG-1)^(M-2).
%
%    or, alternatively
%
%    Coordinate THETA1 uses 2*NG+1 points:
%      (0:2*N) * PI / NG
%    Other THETA coordinates use NG+1 points:
%      (0:NG) * PI / NG
%
%    so the total number of points in a grid of index NG is 
%    therefore N = (2*NG+1)*(NG+1)^(M-2).
%
%    This function assumes that the cube is defined by a characteristic
%    function, which is evaluated by the MATLAB function cube_characteristic.m.
%
%    This function assumes that the base point X0 is inside the unit cube.
%
%    It generates a grid of index NG, and for each grid point, determines
%    the point on the cube's surface that is projected to the grid point by a
%    ray starting at X0.  The set of points on the cube's surface, which
%    are the preimage of the grid under this projection, are returned as
%    output.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NG, the 1D grid index, which determines the fineness of
%    the grid.
%
%    Input, real X0(3,1) the base point, or origin of the hyperspherical 
%    coordinate system, which should be inside the cube.
%
%    Output, real X1(2*NG+1,NG+1), X2(2*NG+1,NG+1), X3(2*NG+1,NG+1), the \
%    coordinates of points on the cube surface, projected from the hypersphere.
%
  if ( nargin < 2 )
    x0 = [ 0.0; 0.0; 0.0 ];
  else
    x0 = x0(:);
  end

  if ( nargin < 1 )
    ng = 21;
  end
%
%  Generate the angular grid THETA.
%
% n1 = 2 * ng;
% n2 = ng - 1;
% n = n1 * n2;
% theta1 = ( 0 : 2 * ng - 1 ) * pi / ng;
% theta2 = ( 1 :     ng - 1 ) * pi / ng;
%
%  Revised N1 and N2 for graphics sake!
%
  n1 = 2 * ng + 1;
  n2 = ng + 1;
  n = n1 * n2;
  theta1 = ( 0 : 2 * ng ) * pi / ng;
  theta2 = ( 0 :     ng ) * pi / ng;
%
%  I prefer NDGRID to MESHGRID.
%
  [ t1, t2 ] = ndgrid ( theta1, theta2 );

  r = zeros ( n1, n2 );
  x1 = zeros ( n1, n2 );
  x2 = zeros ( n1, n2 );
  x3 = zeros ( n1, n2 );

  for i = 1 : n1
    for j = 1 : n2 
      r(i,j) = bisect_characteristic ( x0, [ theta1(i); theta2(j) ], ...
        @cube_characteristic );
    end
  end

  x1 = r .* cos ( t1 );
  x2 = r .* sin ( t1 ) .* cos ( t2 );
  x3 = r .* sin ( t1 ) .* sin ( t2 );

  return
end
