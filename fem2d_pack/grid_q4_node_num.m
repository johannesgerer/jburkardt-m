function node_num = grid_q4_node_num ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_Q4_NODE_NUM counts the nodes in a grid of Q4 elements.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NELEMX, NELEMY, the number of elements along the
%    X and Y directions.  The number of elements generated will be
%    NELEMX * NELEMY.
%
%    Output, integer NODE_NUM, the number of nodes in the grid.
%
  node_num = ( nelemx + 1 ) * ( nelemy + 1 );

  return
end
