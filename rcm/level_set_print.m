function level_set_print ( node_num, level_num, level_row, level )

%*****************************************************************************80
%
%% LEVEL_SET_PRINT prints level set information.
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
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer LEVEL_NUM, the number of levels.
%
%    Input, integer LEVEL_ROW(LEVEL_NUM+1), organizes the entries of LEVEL.
%    The entries for level I are in entries LEVEL_ROW(I)
%    through LEVEL_ROW(I+1)-1.
%
%    Input, integer LEVEL(NODE_NUM), is simply a list of the nodes in an
%    order induced by the levels.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEVEL_PRINT\n' );
  fprintf ( 1, '  Show the level set structure of a rooted graph.\n' );
  fprintf ( 1, '  The number of nodes is %d\n', node_num );
  fprintf ( 1, '  The number of levels is %d\n', level_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Level Min Max      Nonzeros\n' );
  fprintf ( 1, '\n' );

  for i = 1 : level_num

    jmin = level_row(i);
    jmax = level_row(i+1) - 1;

    if ( jmax < jmin )

      fprintf ( 1, '  %4d%4d%4d\n', i, jmin, jmax );

    else

      for jlo = jmin : 5 : jmax

        jhi = min ( jlo + 4, jmax );

        if ( jlo == jmin )

          fprintf ( 1, '  %4d%4d%4d   ', i, jmin, jmax );
          for j = jlo : jhi
            fprintf ( 1, '%8d', level(j) );
          end
          fprintf ( 1, '\n' );

        else

          fprintf ( 1, '                 ' );
          for j = jlo : jhi
            fprintf ( 1, '%8d', level(j) );
          end
          fprintf ( 1, '\n' );
        end

      end

    end

  end

  return
end
