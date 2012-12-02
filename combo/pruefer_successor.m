function [ p, rank ] = pruefer_successor ( n, p, rank )

%*****************************************************************************80
%
%% PRUEFER_SUCCESSOR computes the lexical Pruefer sequence successor.
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
%    Input/output, integer P(N-2), on input, the Pruefer code for a tree.
%    and on output, its lexical successor.
%
%    Input/output, integer RANK, the rank.
%    If RANK = -1 on input, then the routine understands that this is
%    the first call, and that the user wishes the routine to supply
%    the first element in the ordering, which has RANK = 0.
%    In general, the input value of RANK is increased by 1 for output,
%    unless the very last element of the ordering was input, in which
%    case the output value of RANK is 0.
%

%
%  Return the first element.
%
  if ( rank == -1 )
    p(1:n-2) = 1;
    rank = 0;
    return
  end
%
%  Check.
%
  ierror = pruefer_check ( n, p );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRUEFER_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  Input array is illegal.\n' );
    fprintf ( 1, '  Error code = %d\n', ierror );
    error ( 'PRUEFER_SUCCESSOR - Fatal error!' );
  end

  j = n - 2;

  while ( 1 )

    if ( p(j) ~= n )
      break
    end

    j = j - 1;

    if ( j <= 0 )
      break
    end

  end

  if ( j ~= 0 )
    p(j) = p(j) + 1;
    p(j+1:n-2) = 1;
    rank = rank + 1;
  else
    p(1:n-2) = 1;
    rank = 0;
  end

  return
end
