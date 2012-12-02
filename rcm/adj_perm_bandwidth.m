function value = adj_perm_bandwidth ( node_num, adj_num, adj_row, adj, ...
  perm, perm_inv )

%*****************************************************************************80
%
%% ADJ_PERM_BANDWIDTH computes the bandwidth of a permuted adjacency matrix.
%
%  Discussion:
%
%    The matrix is defined by the adjacency information and a permutation.
%
%    The routine also computes the bandwidth and the size of the envelope.
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
%    Output, integer ADJ_PERM_BANDWIDTH, the bandwidth of the permuted
%    adjacency matrix.
%
  band_lo = 0;
  band_hi = 0;

  for i = 1 : node_num

    for j = adj_row(perm(i)) : adj_row(perm(i)+1)-1
      col = perm_inv(adj(j));
      band_lo = max ( band_lo, i - col );
      band_hi = max ( band_hi, col - i );
    end

  end

  value = band_lo + 1 + band_hi;

  return
end
