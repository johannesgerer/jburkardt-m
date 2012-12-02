function [ adj_num, adj_row, adj ] = adj_set ( node_num, adj_max, adj_num, ...
  adj_row, adj, irow, jcol )

%*****************************************************************************80
%
%% ADJ_SET sets up the adjacency information.
%
%  Discussion:
%
%    The routine records the locations of each nonzero element,
%    one at a time.
%
%    The first call for a given problem should be with IROW or ICOL
%    negative.  This is a signal indicating the data structure should
%    be initialized.
%
%    Then, for each case in which A(IROW,JCOL) is nonzero, or
%    in which IROW is adjacent to JCOL, call this routine once
%    to record that fact.
%
%    Diagonal entries are not to be stored.
%
%    The matrix is assumed to be symmetric, so setting I adjacent to J
%    will also set J adjacent to I.
%
%    Repeated calls with the same values of IROW and JCOL do not
%    actually hurt.  No extra storage will be allocated.
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
%    Input, integer ADJ_MAX, the maximum dimension of the adjacency array.
%
%    Input, integer ADJ_NUM, the number of adjaceny entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about
%    row I is stored in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%
%    Input, integer IROW, JCOL, the row and column indices of a nonzero
%    entry of the matrix.
%
%    Output, integer ADJ_NUM, the updated  number of adjaceny entries.
%
%    Output, integer ADJ_ROW(NODE_NUM+1), the updated adjacency row
%    information.
%
%    Output, integer ADJ(ADJ_NUM), the updated adjacency structure.
%

%
%  Negative IROW or JCOL indicates the data structure should be initialized.
%
  if ( irow < 0 | jcol < 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'ADJ_SET - Note:\n' );
    fprintf ( 1, '  Initializing adjacency information.\n' );
    fprintf ( 1, '  Number of nodes NODE_NUM = %d\n', node_num );
    fprintf ( 1, '  Maximum adjacency ADJ_MAX = %d\n', adj_max );

    adj_num = 0;
    adj_row(1:node_num+1) = 1;
    adj(1:adj_max) = 0;

    return
  end
%
%  Diagonal entries are not stored.
%
  if ( irow == jcol )
    return
  end

  if ( node_num < irow )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ADJ_SET - Fatal error!\n' );
    fprintf ( 1, '  NODE_NUM < IROW.\n' );
    fprintf ( 1, '  IROW = %d\n', irow );
    fprintf ( 1, '  NODE_NUM = %d\n', node_num );
    error ( 'ADJ_SET - Fatal error!' );
  elseif ( irow < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ADJ_SET - Fatal error!\n' );
    fprintf ( 1, '  IROW < 1.\n' );
    fprintf ( 1, '  IROW = %d\n', irow );
    error ( 'ADJ_SET - Fatal error!' );
  elseif ( node_num < jcol )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ADJ_SET - Fatal error!\n' );
    fprintf ( 1, '  NODE_NUM < JCOL.\n' );
    fprintf ( 1, '  JCOL = %d\n', jcol );
    fprintf ( 1, '  NODE_NUM = %d\n', node_num );
    error ( 'ADJ_SET - Fatal error!' );
  elseif ( jcol < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ADJ_SET - Fatal error!\n' );
    fprintf ( 1, '  JCOL < 1.\n' );
    fprintf ( 1, '  JCOL = %d\n', jcol );
    error ( 'ADJ_SET - Fatal error!' );
  end

  if ( ~adj_contains_ij ( node_num, adj_num, adj_row, adj, irow, jcol ) )

    [ adj_num, adj_row, adj ] = adj_insert_ij ( node_num, adj_max, ...
      adj_num, adj_row, adj, irow, jcol );

  end

  if ( ~adj_contains_ij ( node_num, adj_num, adj_row, adj, jcol, irow ) )

    [ adj_num, adj_row, adj ] = adj_insert_ij ( node_num, adj_max, ...
      adj_num, adj_row, adj, jcol, irow );

  end

  return
end
