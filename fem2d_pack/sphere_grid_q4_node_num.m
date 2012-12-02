function node_num = sphere_grid_q4_node_num ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_Q4_NODE_NUM counts nodes in a Q4 sphere grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NELEMX, NELEMY, the number of elements along the
%    X and Y directions.
%
%    Output, integer NODE_NUM, the number of nodes in the grid.
%
  node_num = nelemx * ( nelemy - 1 ) + 2;

  return
end
