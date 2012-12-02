function [ x, indx, k, nstack, ncan ] = r8vec_backtrack ( ...
  n, maxstack, stacks, x, indx, k, nstack, ncan )

%*****************************************************************************80
%
%% R8VEC_BACKTRACK supervises a backtrack search for an R8VEC.
%
%  Discussion:
%
%    The routine tries to construct a real vector one index at a time,
%    using possible candidates as supplied by the user.
%
%    At any time, the partially constructed vector may be discovered to be
%    unsatisfactory, but the routine records information about where the
%    last arbitrary choice was made, so that the search can be
%    carried out efficiently, rather than starting out all over again.
%
%    First, call the routine with INDX = 0 so it can initialize itself.
%
%    Now, on each return from the routine, if INDX is:
%      1, you've just been handed a complete candidate vector;
%         Admire it, analyze it, do what you like.
%      2, please determine suitable candidates for position X(K).
%         Return the number of candidates in NCAN(K), adding each
%         candidate to the end of STACKS, and increasing NSTACK.
%      3, you're done.  Stop calling the routine;
%
%    At one time, the variable "stacks" was called "stack", but MATLAB
%    now seems to have taken "stack" as a keyword that is no longer
%    acceptable as a variable name.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 July 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of positions to be filled in the vector.
%
%    Input, integer MAXSTACK, the maximum length of the stack.
%
%    Input, real STACKS(MAXSTACK), a list of all current candidates for
%    all positions 1 through K.
%
%    Input, real X(N), the partially filled in candidate vector.
%
%    Input, integer INDX, a communication flag.
%    * 0, to begin a backtracking search.
%    * 2, the requested candidates for position K have been added to
%      STACKS, and NCAN(K) was updated.
%
%    Input, integer K, the index in X that we are trying to fill.
%
%    Input, integer NSTACK, the current length of the stack.
%
%    Input, integer NCAN(N), lists the current number of candidates for
%    all positions 1 through K.
%
%    Output, real X(N), the partially filled in candidate vector.
%
%    Output, integer INDX, a communication flag.
%    * 1, a complete output vector has been determined and returned in X(1:N);
%    * 2, candidates are needed for position X(K);
%    * 3, no more possible vectors exist.
%
%    Output, integer K, the index in X that we are trying to fill.
%
%    Output, integer NSTACK, the current length of the stack.
%
%    Output, integer NCAN(N), lists the current number of candidates for
%    all positions 1 through K.
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
%
%  If there are candidates for position K, take the first available
%  one off the stack, and increment K.
%
%  This may cause K to reach the desired value of N, in which case
%  we need to signal the user that a complete set of candidates
%  is being returned.
%
    if ( 0 < ncan(k) )

      x(k) = stacks(nstack);
      nstack = nstack - 1;

      ncan(k) = ncan(k) - 1;

      if ( k ~= n )
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
