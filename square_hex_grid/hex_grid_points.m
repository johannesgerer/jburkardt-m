function p = hex_grid_points ( nodes_per_layer, layers, n, box )

%*****************************************************************************80
%
%% HEX_GRID_POINTS returns coordinate box hex grid points.
%
%  Discussion:
%
%    This routine determines the coordinates of the elements of
%    a hexagonal grid in the unit square.
%
%    A hexagonal grid is defined in the coordinate box [A,B] x [C,D].
%
%    All nodes of the grid lie on one of LAYERS horizontal lines.
%    The first of these lines is from (A,C) to (B,C), and each
%    successive line is HY units higher.
%
%    On all the odd numbered lines, there are NODES_PER_LAYER points,
%    equally spaced from A to B, with a spacing of HX.
%
%    On the even numbered lines, there are NODES_PER_LAYER-1 points,
%    whose values are the midpoints of successive intervals on
%    an odd numbered line.  (The grid is staggered).
%
%    HY = HX * sqrt ( 3 ) / 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODES_PER_LAYER, the number of grid points on the first
%    horizontal layer of points.
%
%    Input, integer LAYERS, the number of horizontal layers.
%
%    Input, integer N, the total number of hex grid points.
%
%    Input, real BOX(2,2), the values of A, B, C and D
%    that define the coordinate box.
%
%    Output, real P(2,N), the coordinates of the
%    mesh points, listed one horizontal layer at a time.
%
  ndim = 2;

  if ( nodes_per_layer < 1 )
    p = [];
    return
  end

  if ( nodes_per_layer == 1 )
    p(1:ndim,1) = ( box(1:ndim,1) + box(1:ndim,2) ) / 2.0;
    return
  end

  [ hx, hy ] = hex_grid_h ( nodes_per_layer, box );

  k = 0;

  for j = 1 : layers

    y = box(2,1) + hy * ( j - 1 );

    jmod = mod ( j, 2 );

    if ( jmod == 1 )

      for i = 1 : nodes_per_layer
        x = box(1,1) + ( box(1,2) - box(1,1) ) * ( i - 1 ) ...
          / ( nodes_per_layer - 1 );
        k = k + 1;
        if ( k <= n )
          p(1,k) = x;
          p(2,k) = y;
        end
      end

    else

      for i = 1 : nodes_per_layer-1
        x = box(1,1) + ( box(1,2) - box(1,1) ) * ( 2 * i - 1 ) ...
          / ( 2 * nodes_per_layer - 2 );
        k = k + 1;
        if ( k <= n )
          p(1,k) = x;
          p(2,k) = y;
        end
      end

    end

  end

  return
end

