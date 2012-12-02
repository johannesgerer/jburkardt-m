function adj_print_some ( node_num, node_lo, node_hi, adj_num, adj_row, ...
  adj, title )

%*****************************************************************************80
%
%% ADJ_PRINT_SOME prints some adjacency information.
%
%  Discussion:
%
%    The list has the form:
%
%    Row   Nonzeros
%
%    1       2   5   9
%    2       7   8   9   15   78   79   81  86  91  99
%          100 103
%    3      48  49  53
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
%    Input, integer NODE_LO, NODE_HI, the first and last nodes for
%    which the adjacency information is to be printed.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1), organizes the adjacency entries
%    into rows.  The entries for row I are in entries ADJ_ROW(I)
%    through ADJ_ROW(I+1)-1.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure, which contains,
%    for each row, the column indices of the nonzero entries.
%
%    Input, string TITLE, a title to be printed.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sparse adjacency structure:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes       = %d\n', node_num );
  fprintf ( 1, '  Number of adjacencies = %d\n', adj_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node Min Max      Nonzeros \n' );
  fprintf ( 1, '\n' );

  for i = node_lo : node_hi

    jmin = adj_row(i);
    jmax = adj_row(i+1) - 1;

    if ( jmax < jmin )

      fprintf ( 1, '  %4d%4d%4d\n', i, jmin, jmax );

    else

      for jlo = jmin : 5 : jmax

        jhi = min ( jlo + 4, jmax );

        if ( jlo == jmin )

          fprintf ( 1, '  %4d%4d%4d   ', i, jmin, jmax );
          for j = jlo : jhi
            fprintf ( 1, '%8d', adj(j) );
          end
          fprintf ( 1, '\n' );

        else

          fprintf ( 1, '                 ' );
          for j = jlo : jhi
            fprintf ( 1, '%8d', adj(j) );
          end
          fprintf ( 1, '\n' );

        end

      end

    end

  end

  return
end
