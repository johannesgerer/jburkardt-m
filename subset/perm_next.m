function [ p, more, even ] = perm_next ( n, p, more, even )

%*****************************************************************************80
%
%% PERM_NEXT computes all of the permutations of N objects, one at a time.
%
%  Discussion:
%
%    The routine is initialized by calling with MORE = TRUE, in which case
%    it returns the identity permutation.
%
%    If the routine is called with MORE = FALSE, then the successor of the
%    input permutation is computed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2005
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A Nijenhuis, H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer P(N), the output value of P from the previous call.
%    However, on an initialization call, with MORE = FALSE, the value of P
%    is not needed.
%
%    Input, logical MORE, should be FALSE on the first call, to force
%    initialization.  Thereafter, it should be TRUE, to request the next
%    permutation in the sequence.
%
%    Input, logical EVEN, is the output value of EVEN from the previous call.
%    However, on an initialization call, with MORE = FALSE, the value of EVEN
%    is not needed.
%
%    Output, integer P(N), the next permutation.
%
%    Output, logical MORE, indicates that there are more permutations
%    that may be generated.
%
%    Output, logical EVEN, is TRUE if the output permutation is even,
%    that is, involves an even number of transpositions.
%
  if ( ~more )

    p = i4vec_indicator ( n );
    more = 1;
    even = 1;

    if ( n == 1 )
      more = 0;
      return
    end

    if ( p(n) ~= 1 | p(1) ~= 2 + mod ( n, 2 ) )
      return
    end

    for i = 1 : n-3
      if ( p(i+1) ~= p(i) + 1 )
        return
      end
    end

    more = 0;

  else

    even = even;
    p(1:n) = p(1:n);

    if ( n == 1 )
      p(1) = 0;
      more = 0;
      return
    end

    if ( even )

      ia = p(1);
      p(1) = p(2);
      p(2) = ia;
      even = 0;

      if ( p(n) ~= 1 | p(1) ~= 2 + mod ( n, 2 ) )
        return
      end

      for i = 1 : n-3
        if ( p(i+1) ~= p(i) + 1 )
          return
        end
      end

      more = 0;
      return

    else

      more = 0;

      is = 0;

      for i1 = 2 : n

        ia = p(i1);
        i = i1 - 1;
        id = 0;

        for j = 1 : i
          if ( ia < p(j) )
            id = id + 1;
          end
        end

        is = id + is;

        if ( id ~= i * mod ( is, 2 ) )
          more = 1;
          break
        end

      end

      if ( ~more )
        p(1) = 0;
        return
      end

    end

    m = mod ( is + 1, 2 ) * ( n + 1 );

    for j = 1 : i

      if ( i4_sign ( p(j) - ia ) ~= i4_sign ( p(j) - m ) )
        m = p(j);
        l = j;
      end

    end

    p(l) = ia;
    p(i1) = m;
    even = 1;

  end

  return
end
