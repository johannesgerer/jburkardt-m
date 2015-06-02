function [ nodes_per_layer, h ] = hex_grid_01_approximate_h ( h_goal )

%*****************************************************************************80
%
%% HEX_GRID_01_APPROXIMATE_H seeks a unit square hex grid with spacing H.
%
%  Discussion:
%
%    The parameter NODES_PER_LAYER controls the number of nodes and the
%    grid spacing, but in a somewhat obscure way.  This routine experiments
%    with various values until it is convinced it has the value
%    of NODES_PER_LAYER that produces a grid spacing that is no
%    no greater than H.
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
%    Input, real H_GOAL, the desired grid spacing.
%
%    Output, integer NODES_PER_LAYER, the number of nodes per layer
%    which produces a mesh with grid spacing H_GOAL or less.
%
%    Output, real H, the actual grid spacing.
%
  m = 2;

  if ( h_goal <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HEX_GRID_01_APPROXIMATE_H - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of H_GOAL = %f\n', h_goal );
    error ( 'HEX_GRID_01_APPROXIMATE_H - Fatal error!' );
  end

  nodes_per_layer = 1 + round ( 1.0 / h_goal );
%
%  Check whether roundoff means we could use one less node per layer.
%
  if ( 2 < nodes_per_layer )

    nodes_per_layer2 = nodes_per_layer - 1;
    h = 1.0 / ( nodes_per_layer2 - 1 );

    if ( h <= h_goal )
      nodes_per_layer = nodes_per_layer2;
      return
    end

  end

  h = 1.0 / ( nodes_per_layer - 1 );

  return
end
