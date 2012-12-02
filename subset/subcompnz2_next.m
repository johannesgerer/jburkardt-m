function [ a, more ] = subcompnz2_next ( n_lo, n_hi, k, a, more )

%*****************************************************************************80
%
%% SUBCOMPNZ2_NEXT computes the next subcomposition of N into K nonzero parts.
%
%  Discussion:
%
%    A composition of the integer N into K nonzero parts is an ordered sequence
%    of K positive integers which sum to a value of N.
%
%    A subcomposition of the integer N into K nonzero parts is a composition
%    of M into K nonzero parts, where 0 < M <= N.
%
%    This routine computes all compositions of K into nonzero parts which sum
%    to values between N_LO and N_HI.
%
%    The routine SUBCOMPNZ_NEXT can be regarded as a special case where 
%    N_LO = K.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_LO, N_HI, the range of values N for which
%    compositions are desired.
%
%    Input, integer K, the number of parts in the subcomposition.
%    K must be no greater than N_HI.
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

  if ( n_hi < k )
    more = 0;
    a(1:k) = -1;
    return
  end

  if ( n_hi < n_lo )
    more = 0;
    a(1:k) = -1;
    return
  end
%
%  The first computation.
%
  if ( ~more )

    more = 1;

    n2 = max ( k, n_lo );
    more2 = 0;

  [ a, more2 ] = compnz_next ( n2, k, a, more2 );
%
%  Do the next element at the current value of N.
%
  elseif ( more2 )

    [ a, more2 ] = compnz_next ( n2, k, a, more2 );

  else

    n2 = n2 + 1;

    [ a, more2 ] = compnz_next ( n2, k, a, more2 );

  end
%
%  Termination occurs if MORE2 = FALSE and N2 = N_HI.
%
  if ( ~more2 & n2 == n_hi )
    more = 0;
  end

  return
end
