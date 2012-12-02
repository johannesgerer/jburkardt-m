function digraph_arc_print ( nedge, inode, jnode, title )

%*****************************************************************************80
%
%% DIGRAPH_ARC_PRINT prints out a digraph from an edge list.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NEDGE, the number of edges.
%
%    Input, integer INODE(NEDGE), JNODE(NEDGE), the beginning and end
%    nodes of the edges.
%
%    Input, character ( len = * ) TITLE, a title.
%
  if ( s_len_trim ( title ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );

  for i = 1 : nedge
    fprintf ( 1, '  %4d    %4d  %4d\n', i, inode(i), jnode(i) );
  end

  return
end
