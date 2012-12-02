function [ nodes_per_layer, n ] = hex_grid_approximate_n ( box, n_goal )

%*****************************************************************************80
%
%% HEX_GRID_APPROXIMATE_N seeks a hex grid of about N nodes.
%
%  Discussion:
%
%    The parameter NODES_PER_LAYER controls the number of nodes, but
%    in a somewhat obscure way.  This routine experiments with various
%    values until it is convinced it has the value of NODES_PER_LAYER
%    that comes as close as possible to producing N nodes.
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
%    Input, real BOX(2,2), the lower and upper corners
%    of the rectangular region.
%
%    Input, integer N_GOAL, the desired number of nodes.
%
%    Output, integer NODES_PER_LAYER, the number of nodes per layer
%    which produces a mesh with about N_GOAL nodes.
%
%    Output, integer N, the number of nodes in the mesh.
%
  m = 2;

  if ( n_goal <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HEX_GRID_APPROXIMATE_N - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of N_GOAL = %d\n', n_goal );
    error ( 'HEX_GRID_APPROXIMATE_N - Fatal error!' );
  end

  nodes_per_layer_low = 0;
  n_low = 0;

  nodes_per_layer = round ( sqrt ( n_goal ) );

  nodes_per_layer_high = n_goal;
  n_high = n_goal * n_goal;

  while ( 1 )

    n = hex_grid_n ( nodes_per_layer, box );

    if ( n == n_goal )
      break
    end

    if ( n < n_goal )
      nodes_per_layer_low = nodes_per_layer;
      n_low = n;
    else
      nodes_per_layer_high = nodes_per_layer;
      n_high = n;
    end

    if ( nodes_per_layer_low + 1 == nodes_per_layer_high )
      if ( n - n_low <= n_high - n )
        nodes_per_layer = nodes_per_layer_high;
        n = n_high;
      else
        nodes_per_layer = nodes_per_layer_low;
        n = n_low;
      end
      break
    end

    nodes_per_layer = ...
      round ( ( nodes_per_layer_low + nodes_per_layer_high ) / 2 );

  end

  return
end
