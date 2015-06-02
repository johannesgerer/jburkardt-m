function [ hx, hy ] = hex_grid_h ( nodes_per_layer, box )

%*****************************************************************************80
%
%% HEX_GRID_H computes the coordinate box hex grid spacings.
%
%  Discussion:
%
%    This routine determines the values of HX and HY from
%    the fundamental hexagonal grid parameter NODES_PER_LAYER.
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
%    Input, real BOX(2,2), the values of A, B, C and D
%    that define the coordinate box.
%
%    Output, real HX, the spacing between grid points
%    on a horizontal line.
%
%    Output, real HY, the spacing between horizontal lines.
%
  if ( nodes_per_layer < 1 )

    hx = 0.0;
    hy = 0.0;

  elseif ( nodes_per_layer == 1 )

    hx = box(1,2) - box(1,1);
    hy = box(2,2) - box(2,1);

  else

    hx = ( box(1,2) - box(1,1) ) / ( nodes_per_layer - 1 );
    hy = hx * sqrt ( 3.0 ) / 2.0;

  end 

  return
end
