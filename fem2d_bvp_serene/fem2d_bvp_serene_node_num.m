function node_num = fem2d_bvp_serene_node_num ( nx, ny )

%*****************************************************************************80
%
%% FEM2D_BVP_SERENE_NODE_NUM counts the number of nodes.
%
%  Discussion:
%
%    The program uses the finite element method, with piecewise serendipity 
%    basis functions to solve a 2D boundary value problem over a rectangle.
%
%    The grid uses NX nodes in the X direction and NY nodes in the Y direction.
%
%    Both NX and NY must be odd.
%
%    Because of the peculiar shape of the serendipity elements, counting the
%    number of nodes and variables is a little tricky.  Here is a grid for
%    the case when NX = 7 and NY = 5, for which there are 29 nodes 
%    and variables.
%
%     23 24 25 26 27 28 29
%     19    20    21    22
%     12 13 14 15 16 17 18
%      8     9    10    11
%      1  2  3  4  5  6  7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NX, NY, the number of X and Y grid values.
%    NX and NY must be odd and at least 3.
%
%    Output, integer NODE_NUM, the number of nodes and variables.
%
  node_num =   nx           * ( ny + 1 ) / 2 ...
           + ( nx + 1 ) / 2 * ( ny - 1 ) / 2; 

  return
end

