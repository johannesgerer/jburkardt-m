function value = adj_bandwidth ( node_num, adj_num, adj_row, adj )

%*****************************************************************************80
%
%% ADJ_BANDWIDTH computes the bandwidth of an adjacency matrix.
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
%    Output, integer VALUE, the bandwidth of the adjacency
%    matrix.
%
  band_lo = 0;
  band_hi = 0;

  for i = 1 : node_num

    for j = adj_row(i) : adj_row(i+1)-1
      col = adj(j);
      band_lo = max ( band_lo, i - col );
      band_hi = max ( band_hi, col - i );
    end

  end

  value = band_lo + 1 + band_hi;

  return
end
