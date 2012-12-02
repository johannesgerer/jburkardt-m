function [ p, more ] = perm_next3 ( n, p, more )

%*****************************************************************************80
%
%% PERM_NEXT3 computes all of the permutations of N objects, one at a time.
%
%  Discussion:
%
%    The routine is initialized by calling with MORE = TRUE, in which case
%    it returns the identity permutation.
%
%    If the routine is called with MORE = FALSE, then the successor of the
%    input permutation is computed.
%
%    Trotter's algorithm is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    H Trotter,
%    PERM, Algorithm 115,
%    Communications of the Association for Computing Machinery,
%    Volume 5, 1962, pages 434-435.
%
%  Parameters:
%
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer P(N), is the previous permutation, if MORE is TRUE.
%    But on a startup call, with MORE FALSE, the input value of P is not needed.
%
%    Input, logical MORE, should be set to FALSE on an initialization call.
%    Thereafter, set MORE to the output value of MORE.
%
%    Output, integer P(N), the next permutation; if MORE is FALSE, then
%    P is the first permutation in the sequence.
%
%    Output, logical MORE, is TRUE if there was a next permutation to
%    produce, or FALSE if there are no more permutations to produce.
%
  persistent nfact;
  persistent rank;

  if ( ~more )

    p = i4vec_indicator ( n );
    more = 1;
    rank = 1;

    nfact = i4_factorial ( n );

  else

    n2 = n;
    m2 = rank;
    s = n;

    while ( 1 )

      q = mod ( m2, n2 );
      t = mod ( m2, 2 * n2 );

      if ( q ~= 0 )
        break
      end

      if ( t == 0 )
        s = s - 1;
      end

      m2 = floor ( m2 / n2 );
      n2 = n2 - 1;

    end

    if ( q == t )
      s = s - q;
    else
      s = s + q - n2;
    end

    t      = p(s);
    p(s)   = p(s+1);
    p(s+1) = t;

    rank = rank + 1;

    if ( rank == nfact );
      more = 0;
    end

  end

  return
end
