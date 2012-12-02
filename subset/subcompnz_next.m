function [ a, more ] = subcompnz_next ( n, k, a, more )

%*****************************************************************************80
%
%% SUBCOMPNZ_NEXT computes the next subcomposition of N into K nonzero parts.
%
%  Discussion:
%
%    A composition of the integer N into K nonzero parts is an ordered sequence
%    of K positive integers which sum to a value of N.
%
%    A subcomposition of the integer N into K nonzero parts is a composition
%    of M into K nonzero parts, where 0 < M <= N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 December 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the integer whose subcompositions are desired.
%
%    Input, integer K, the number of parts in the subcomposition.
%    K must be no greater than N.
%
%    Input, integer A(K), the parts of the subcomposition.
%
%    Input, logical MORE, set to FALSE by the user to start the computation.
%
%    Output, integer A(K), the parts of the subcomposition.
%
%    Output, logical MORE, set to FALSE by the routine to terminate the computation.
%
  persistent more2
  persistent n2

  if ( n < k )
    more = 0;
    a(1:k) = -1;
    return
  end
%
%  The first computation.
%
  if ( ~more )

    more = 1;

    a(1:k) = 1;
    n2 = k;
    more2 = 0;
%
%  Do the next element at the current value of N.
%
  elseif ( more2 )

    [ a, more2 ] = compnz_next ( n2, k, a, more2 );

  else

    more2 = 0;
    n2 = n2 + 1;

    [ a, more2 ] = compnz_next ( n2, k, a, more2 );

  end
%
%  Termination occurs if MORE2 = FALSE and N2 = N.
%
  if ( ~more2 & n2 == n )
    more = 0;
  end

  return
end
