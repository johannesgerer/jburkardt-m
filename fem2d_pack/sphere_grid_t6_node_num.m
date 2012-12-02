function node_num = sphere_grid_t6_node_num ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_T6_NODE_NUM counts nodes in a T6 sphere grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2006
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
  node_num = 4 * nelemx * nelemy - 2 * nelemx + 2;

  return
end
