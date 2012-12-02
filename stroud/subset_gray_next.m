function [ a, more, ncard, iadd ] = subset_gray_next ( n, a, more, ncard )

%*****************************************************************************80
%
%% SUBSET_GRAY_NEXT generates all subsets of a set of order N, one at a time.
%
%  Discussion:
%
%    This routine generates the subsets one at a time, by adding or subtracting
%    exactly one element on each step.
%
%    This uses a Gray code ordering of the subsets.
%
%    The user should set MORE = FALSE and the value of N before
%    the first call.  On return, the user may examine A which contains
%    the definition of the new subset, and must check MORE, because
%    as soon as it is FALSE on return, all the subsets have been
%    generated and the user probably should cease calling.
%
%    The first set returned is the empty set.
%
%  Example:
%
%    N = 4
%
%    0 0 0 0
%    1 0 0 0
%    1 1 0 0
%    0 1 0 0
%    0 1 1 0
%    1 1 1 0
%    1 0 1 0
%    0 0 1 0
%    0 0 1 1
%    1 0 1 1
%    1 1 1 1
%    0 1 1 1
%    0 1 0 1
%    1 1 0 1
%    1 0 0 1
%    0 0 0 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2004
%
%  Author:
%
%    FORTRAN77 original version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the order of the total set from which
%    subsets will be drawn.
%
%    Input, integer A(N), the value of A_NEW on the previous call.
%    This value is not needed on the first call, with MORE = FALSE.
%
%    Input, logical MORE, should be set to FALSE on the first call, and
%    then set to TRUE for all subsequent calls.  
%
%    Input, integer NCARD, the cardinality of A.  This value is not needed
%    on the first call, with MORE = FALSE.
%
%    Output, integer A(N), the Gray code for the next subset.  A(I) = 0 
%    if element I is in the subset, 1 otherwise.
%
%    Output, logical MORE. will be returned TRUE until all the subsets
%    have been generated.
%
%    Output, integer NCARD, the cardinality of A_NEW.
%
%    Output, integer IADD, the element which was added or removed to the
%    previous subset to generate the current one.  Exception:
%    the empty set is returned on the first call, and IADD is set to 0.
%

%
%  The first set returned is the empty set.
%
  if ( ~more )

    a(1:n) = 0;
    ncard = 0;
    more = 1;
    iadd = 0;

  else

    a(1:n) = a(1:n);
    iadd = 1;

    if ( mod ( ncard, 2 ) ~= 0 )

      while ( 1 )

        iadd = iadd + 1;
        if ( a(iadd-1) ~= 0 )
          break
        end

      end

    end

    a(iadd) = 1 - a(iadd);
    ncard = ncard + 2 * a(iadd) - 1;
%
%  The last set returned is the singleton A(N).
%
    if ( ncard == a(n) )
      more = 0;
    end

  end

  return
end
