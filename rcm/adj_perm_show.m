function adj_perm_show ( node_num, adj_num, adj_row, adj, perm, perm_inv )

%*****************************************************************************80
%
%% ADJ_PERM_SHOW displays a symbolic picture of a permuted adjacency matrix.
%
%  Discussion:
%
%    The matrix is defined by the adjacency information and a permutation.
%
%    The routine also computes the bandwidth and the size of the envelope.
%
%    If no permutation has been done, you must set PERM(I) = PERM_INV(I) = I
%    before calling this routine.
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
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Input, integer PERM(NODE_NUM), integer PERM_INV(NODE_NUM), the permutation
%    and inverse permutation.
%
  band_lo = 0;
  nonzero_num = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nonzero structure of matrix:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : node_num

    band(1:node_num) = '.';

    band(i) = 'D';

    for j = adj_row(perm(i)) : adj_row(perm(i)+1)-1
      col = perm_inv(adj(j));
      if ( col < i )
        nonzero_num = nonzero_num + 1;
      end
      band_lo = max ( band_lo, i-col );
      if ( col ~= i )
        band(col) = 'X';
      end
    end

    fprintf ( 1, '  %8d ', i );
    for j = 1 : node_num
      fprintf ( 1, '%c', band(j) );
    end
    fprintf ( 1, '\n' );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Lower bandwidth = %d\n', band_lo );
  fprintf ( 1, '  Lower envelope contains %d nonzeros.', nonzero_num );

  return
end
