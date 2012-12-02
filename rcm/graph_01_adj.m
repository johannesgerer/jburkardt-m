function [ adj_row, adj ] = graph_01_adj ( node_num, adj_num )

%*****************************************************************************80
%
%% GRAPH_01_ADJ returns the adjacency vector for graph 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan George, Joseph Liu,
%    Computer Solution of Large Sparse Positive Definite Systems,
%    Prentice Hall, 1981.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ADJ_NUM, the number of adjacencies.
%
%    Output, integer ADJ_ROW(NODE_NUM+1), node pointers into ADJ.
%
%    Output, integer ADJ(ADJ_NUM), the adjacency information.
%
  adj(1:adj_num) = [ ...
    4, 6, ...
    3, 5, 7, 10, ...
    2, 4, 5, ...
    1, 3, 6, 9, ...
    2, 3, 7, ...
    1, 4, 7, 8, ...
    2, 5, 6, 8, ...
    6, 7, ...
    4, ...
    2 ];

  adj_row(1:node_num+1) = [ 1, 3, 7, 10, 14, 17, 21, 25, 27, 28, 29 ];

  return
end
