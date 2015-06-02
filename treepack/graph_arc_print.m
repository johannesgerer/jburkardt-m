function graph_arc_print ( nedge, inode, jnode, title )

%*****************************************************************************80
%
%% GRAPH_ARC_PRINT prints out a graph from an edge list.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NEDGE, the number of edges.
%
%    Input, integer INODE(NEDGE), JNODE(NEDGE), the beginning 
%    and end nodes of the edges.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : nedge
    fprintf ( 1, '  %2d  %4d  %4d\n', i, inode(i), jnode(i) );
  end

  return
end

