function node_xyz = sphere_grid_q16_node_xyz ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_Q16_NODE_XYZ produces node coordinates for a Q16 sphere grid.
%
%  Discussion:
%
%    The number of nodes to be generated is
%
%      NODE_NUM = 9 * NELEMX * NELEMY - 3 * NELEMX + 2
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
%    Output, real NODE_XYZ(3,NODE_NUM), the node coordinates.
%
  node = 0;

  for j = 3 * nelemy + 1 : -1 : 1

    phi = ( j - 1 ) * pi / ( 3 * nelemy );

    if ( j == 1 )

      node = node + 1;
      node_xyz(1,node) =  0.0;
      node_xyz(2,node) =  0.0;
      node_xyz(3,node) =  1.0;

    elseif ( j < 3 * nelemy + 1 )

      for i = 1 : 3 * nelemx

        theta = ( i - 1 ) * 2.0 * pi / ( 3 * nelemx );

        node = node + 1;    
        node_xyz(1,node) = cos ( theta ) * sin ( phi );
        node_xyz(2,node) = sin ( theta ) * sin ( phi );
        node_xyz(3,node) =                 cos ( phi );

      end

    elseif ( j == 3 * nelemy + 1 )

      node = node + 1;
      node_xyz(1,node) =  0.0;
      node_xyz(2,node) =  0.0;
      node_xyz(3,node) = -1.0;

    end

  end

  return
end
