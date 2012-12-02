function p = tree_to_pruefer ( n, t )

%*****************************************************************************80
%
%% TREE_TO_PRUEFER converts a tree to a Pruefer code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer N, the number of nodes in the tree.
%    N must be positive.
%
%    Input, integer T(2,N-1), describes the edges of the tree
%    as pairs of nodes.
%
%    Output, integer P(N-2,1), the Pruefer code for the tree.
%

%
%  Check.
%
  ierror = tree_check ( n, t );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_TO_PRUEFER - Fatal error!\n' );
    fprintf ( 1, '  Input tree is illegal.\n' );
    fprintf ( 1, '  Error code = %d\n', ierror );
    error ( 'TREE_TO_PRUEFER - Fatal error!' );
  end
%
%  Compute the degree of each node.
%
  d = edge_degree ( n, n-1, t );

  for j = 1 : n - 2
%
%  Find a node of degree 1.
%
    x = n;
    while ( d(x) ~= 1 )
      x = x - 1;
    end
%
%  Find its neighbor.
%
    k = 1;

    while ( 1 )

      if ( t(1,k) == x )
        y = t(2,k);
        break
      end

      if ( t(2,k) == x )
        y = t(1,k);
        break
      end

      k = k + 1;

    end
%
%  Store the neighbor.
%
    p(j) = y;
%
%  Delete the edge from the tree.
%
    d(x) = d(x) - 1;
    d(y) = d(y) - 1;

    t(1,k) = - t(1,k);
    t(2,k) = - t(2,k);

  end

  return
end
