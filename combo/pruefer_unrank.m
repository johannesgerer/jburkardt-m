function p = pruefer_unrank ( rank, n )

%*****************************************************************************80
%
%% PRUEFER_UNRANK unranks a Pruefer code.
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
%    Input, integer RANK, the rank of the Pruefer code.
%
%    Input, integer N, the number of nodes in the tree.
%    N must be at least 3.
%
%    Output, integer P(N-2), the Pruefer code for the tree.
%

%
%  Check.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRUEFER_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Input N is illegal.\n' );
    error ( 'PRUEFER_UNRANK - Fatal error!' );
  end

  ncode = pruefer_enum ( n );

  if ( rank < 0 || ncode < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRUEFER_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input rank is illegal.\n' );
    error ( 'PRUEFER_UNRANK - Fatal error!' );
  end

  for i = n - 2 : -1 : 1
    p(i) = mod ( rank, n ) + 1;
    rank = floor ( ( rank - p(i) + 1 ) ) / n;
  end

  return
end
