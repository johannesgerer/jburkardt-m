function subset_test024a ( )

%*****************************************************************************80
%
%% TEST024a calls DIGRAPH_ARC_EULER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  nedge = 7;
  nnode = 5;

  inode = [ 2, 1, 2, 1, 3, 5, 4 ];
  jnode = [ 5, 4, 3, 2, 1, 1, 2 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST024a\n' );
  fprintf ( 1, '  DIGRAPH_ARC_EULER finds an Euler circuit of a digraph.\n' );

  digraph_arc_print ( nedge, inode, jnode, '  The arc list of the digraph:' );

  [ success, trail ] = digraph_arc_euler ( nnode, nedge, inode, jnode );

  if ( success )

    i4vec_print ( nedge, trail, '  The edge list of the Euler circuit:' );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The node list of the Euler circuit:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    I  Edge  Node\n' );
    fprintf ( 1, '\n' );

    for i = 1 : nedge

      j = trail(i);

      if ( i == nedge )
        jp1 = trail(1);
      else
        jp1 = trail(i+1);
      end

      if ( jnode(j) == inode(jp1) )
        in = jnode(j);
      else
        fprintf ( 1, '\n' );
        fprintf ( 1, 'The circuit has failed!\n' );
        break
      end

      fprintf ( 1, '  %4d  %4d  %4d\n', i, j, in );

    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The digraph is not eulerian.\n' );
    fprintf ( 1, '\n' );

  end

  return
end
