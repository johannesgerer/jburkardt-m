function [ a, more, h, t ] = subcomp_next ( n, k, a, more, h, t )

%*****************************************************************************80
%
%% SUBCOMP_NEXT computes the next subcomposition of N into K parts.
%
%  Discussion:
%
%    A composition of the integer N into K parts is an ordered sequence
%    of K nonnegative integers which sum to a value of N.
%
%    A subcomposition of the integer N into K parts is a composition
%    of M into K parts, where 0 <= M <= N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 July 2008
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
%
%    Input, integer A(K), the parts of the subcomposition.
%
%    Input, logical MORE, set to FALSE by the user to start the computation.
%
%    Input, integer H, T, two internal parameters needed for the
%    computation.  The user may need to initialize these before the
%    very first call, but these initial values are not important.
%    The user should not alter these parameters once the computation
%    begins.
%
%    Output, integer A(K), the parts of the subcomposition.
%
%    Output, logical MORE, set to FALSE by the routine to terminate 
%    the computation.
%
%    Output, integer H, T, the updated values of the two internal 
%    parameters.
%
  persistent more2
  persistent n2
%
%  The first computation.
%
  if ( ~more )

    n2 = 0;
    a(1:k) = 0;
    more2 = 0;
    h = 0;
    t = 0;

    more = 1;
%
%  Do the next element at the current value of N.
%
  elseif ( more2 )

    [ a, more2, h, t ] = comp_next ( n2, k, a, more2, h, t );

  else

    more2 = 0;
    n2 = n2 + 1;

    [ a, more2, h, t ] = comp_next ( n2, k, a, more2, h, t );

  end
%
%  Termination occurs if MORE2 = FALSE and N2 = N.
%
  if ( ~more2 & n2 == n )
    more = 0;
  end

  return
end

