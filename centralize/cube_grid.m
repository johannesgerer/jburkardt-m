function x = cube_grid ( m, ng, x0 )

%*****************************************************************************80
%
%% CUBE_GRID projects hypersphere gridpoints onto the surface of a cube in MD.
%
%  Discussion:
%
%    In M dimensions, the hypersphere coordinate system uses an M-dimensional
%    center point X0, a nonnegative distance R, and M-1 angular coordinates
%    THETA.
%
%    A grid of index NG is a collection of values for THETA that is a cartesian
%    product formed by 2*NG points in THETA1, and NG-1 points in each further
%    angle.
% 
%    Coordinate THETA1 uses 2*NG points:
%      (0:2*NG-1) * PI / NG
%    Other THETA coordinates use NG-1 points:
%      (1:NG-1) * PI / NG
%
%    The total number of points in a grid of index NG is 
%    therefore N=(2*NG)*(NG-1)^(M-2).
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
%    Input, integer M, the spatial dimension.
%
%    Input, integer NG, the 1D grid index, which determines the fineness of
%    the grid.
%
%    Input, real X0(M,1) the base point, or origin of the hyperspherical 
%    coordinate system, which should be inside the cube.
%
%    Output, real X(M,N), the coordinates of points on the cube surface,
%    projected from the hypersphere.  N = (2*NG)*(NG-1)^(M-2).
%
  if ( nargin < 3 )
    x0 = zeros ( m, 1 );
  else
    x0 = x0(:);
  end

  if ( nargin < 2 )
    ng = 21;
  end
%
%  Set up the 1D information defining the hypersphere grid.
%
  n1 = 2 * ng;
  n2 = ng - 1;
  theta1 = ( 0 : 2 * ng - 1 ) * pi / ng;
  theta2 = ( 1 :     ng - 1 ) * pi / ng;
%
%  Determine the number of grid points on the hypersphere grid.
%
  n = 2 * ng * ( ng - 1 ) ^ ( m - 2 );
%
%  Create the matrix of angular coordinates defining the
%  hypersphere grid points.
%
  t = zeros ( m - 1, n );

  for i = 1 : m - 1

    if ( i == 1 )
      t = r8vec_direct_product ( i, n1, theta1, m - 1, n, t );
    else
      t = r8vec_direct_product ( i, n2, theta2, m - 1, n, t );
    end

  end
%
%  Compute the radial coordinate R of the projection of each hypersphere
%  grid point onto the cube surface.
%
  r = zeros ( n, 1 );

  for k = 1 : n
    r(k,1) = bisect_characteristic ( x0, t(1:m-1,k), @cube_characteristic );
  end
%
%  Convert R,T -> X.
%
  x = hypersphere_to_cartesian ( m, n, x0, r, t );

  return
end
