function node_xy = grid_nodes_01 ( x_num, y_num )

%*****************************************************************************80
%
%% GRID_NODES_01 returns an equally spaced rectangular grid of nodes in the unit square.
%
%  Example:
%
%    X_NUM = 5
%    Y_NUM = 3
%
%    NODE_XY = 
%    ( 0, 0.25, 0.5, 0.75, 1, 0,   0.25, 0.5, 0.75, 1,   0, 0.25, 0.5, 0.75, 1;
%      0, 0,    0,   0,    0, 0.5, 0.5,  0.5, 0.5,  0.5, 1, 1.0,  1.0, 1.0,  1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, Y_NUM, the number of nodes in the X and Y directions.
%
%    Output, real NODE_XY(2,X_NUM*Y_NUM), the coordinates of the nodes.
%
  node_num = x_num * y_num;

  node_xy(1:2,1:node_num) = 0.0;

  if ( x_num == 1 )
    node_xy(1,1:node_num) = 0.5;
  else
    for i = 1 : x_num
      node_xy(1,i:x_num:i+(y_num-1)*x_num) = ( i - 1 ) / ( x_num - 1 );
    end
  end

  if ( y_num == 1 )
    node_xy(2,1:node_num) = 0.5;
  else
    for j = 1 : y_num
      node_xy(2,1+(j-1)*x_num:j*x_num) = ( j - 1 ) / ( y_num - 1 );
    end
  end

  return
end
