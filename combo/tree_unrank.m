function t = tree_unrank ( rank, n )

%*****************************************************************************80
%
%% TREE_UNRANK unranks a tree.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
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
%    Input, integer RANK, the rank of the tree.
%
%    Input, integer N, the number of nodes in the tree.
%    N must be at least 3.
%
%    Output, integer T(2,N-1), describes the edges of the tree
%    as pairs of nodes.
%

%
%  Check.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Input N is illegal.\n' );
    error ( 'TREE_UNRANK - Fatal error!' );
  end

  tree_num = tree_enum ( n );

  if ( rank < 0 || tree_num < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input rank is illegal.\n' );
    error ( 'TREE_UNRANK - Fatal error!' );
  end
%
%  Unrank the Pruefer code.
%
  p = pruefer_unrank ( rank, n );
%
%  Convert the Pruefer code to a tree.
%
  t = pruefer_to_tree ( n, p );

  return
end
