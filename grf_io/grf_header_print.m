function grf_header_print ( node_num, edge_num )

%*****************************************************************************80
%
%% GRF_HEADER_PRINT prints the header of a GRF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Skiena,
%    Implementing Discrete Mathematics,
%    Combinatorics and Graph Theory with Mathematica,
%    Addison-Wesley, 1990.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer EDGE_NUM, the number of edges.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of nodes NODE_NUM = %d\n', node_num );
  fprintf ( 1, '  The number of edges EDGE_NUM = %d\n', edge_num );

  return
end
