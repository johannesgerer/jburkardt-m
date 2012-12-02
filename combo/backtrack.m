function [ l, iarray, indx, k, nstack, stack ] = backtrack ( l, iarray, ...
  indx, k, nstack, stack, maxstack )

%*****************************************************************************80
%
%% BACKTRACK supervises a backtrack search.
%
%  Discussion:
%
%    The routine builds a vector, one element at a time, which is
%    required to satisfy some condition.
%
%    At any time, the partial vector may be discovered to be
%    unsatisfactory, but the routine records information about where the
%    last arbitrary choice was made, so that the search can be
%    carried out efficiently, rather than starting out all over again.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2011
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms for Computers and Calculators,
%    Second Edition,
%    Academic Press, 1978,
%    ISBN: 0-12-519260-6,
%    LC: QA164.N54.
%
%  Parameters:
%
%    Input/output, integer L, the length of the completed
%    candidate vector.
%
%    Input/output, integer IARRAY(L), the candidate vector.
%
%    Input/output, integer INDX.
%    On input, set INDX = 0 to start a search.
%    On output:
%    1, a complete output vector has been determined.
%    2, candidates are needed.
%    3, no more possible vectors exist.
%
%    Input/output, integer K, the current length of the candidate
%    vector.
%
%    Input/output, integer NSTACK, the current length of the stack.
%
%    Input/output, integer STACK(MAXSTACK), a list of more candidates
%    for positions 1 through K.
%
%    Input, integer MAXSTACK, the maximum length of the stack.
%

%
%  If this is the first call, request a candidate for position 1.
%
  if ( indx == 0 )
    k = 1;
    nstack = 0;
    indx = 2;
    return
  end
%
%  Examine the stack.
%
  while ( 1 )

    nstack = nstack - 1;
%
%  If there are candidates for position K, take the first available
%  one off the stack, and increment K.
%
%  This may cause K to reach the desired value of L, in which case
%  we need to signal the user that a complete set of candidates
%  is being returned.
%
    if ( stack(nstack+1) ~= 0 )

      iarray(k) = stack(nstack);
      stack(nstack) = stack(nstack+1) - 1;

      if ( k ~= l )
        k = k + 1;
        indx = 2;
      else
        indx = 1;
      end

      break
%
%  If there are no candidates for position K, then decrement K.
%  If K is still positive, repeat the examination of the stack.
%
    else

      k = k - 1;

      if ( k <= 0 )
        indx = 3;
        break
      end

    end

  end

  return
end
