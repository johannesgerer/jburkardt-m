function rank = pruefer_rank ( n, p )

%*****************************************************************************80
%
%% PRUEFER_RANK ranks a Pruefer code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
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
%    N must be at least 3.
%
%    Input, integer P(N-2), the Pruefer code for the tree.
%
%    Output, integer RANK, the rank of the Pruefer code.
%

%
%  Check.
%
  ierror = pruefer_check ( n, p );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRUEFER_RANK - Fatal error!\n' );
    fprintf ( 1, '  Input array is illegal.\n' );
    fprintf ( 1, '  Error code = %d\n', ierror );
    error ( 'PRUEFER_RANK - Fatal error!' );
  end

  rank = 0;
  k = 1;
  for i = n - 2 : -1 : 1
    rank = rank + k * ( p(i) - 1 );
    k = k * n;
  end

  return
end
