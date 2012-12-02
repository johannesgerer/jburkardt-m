function p = triang ( n, zeta )

%*****************************************************************************80
%
%% TRIANG renumbers elements in accordance with a partial ordering.
%
%  Discussion:
%
%    TRIANG is given a partially ordered set.  The partial ordering
%    is defined by a matrix ZETA, where element I is partially less than
%    or equal to element J if and only if ZETA(I,J) = 1.
%
%    TRIANG renumbers the elements with a permutation P so that if
%    element I is partially less than element J in the partial ordering,
%    then P(I) < P(J) in the usual, numerical ordering.
%
%    In other words, the elements are relabeled so that their labels
%    reflect their ordering.  This is equivalent to relabeling the
%    matrix so that, on unscrambling it, the matrix would be upper
%    triangular.
%
%    Calling I4MAT_PERM or R8MAT_PERM with P used for both the row
%    and column permutations applied to matrix ZETA will result in
%    an upper triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2004
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
%    Input, integer N, the number of elements in the set.  
%
%    Input, integer ZETA(N,N), describes the partial ordering.  
%    ZETA(I,J) =:
%      0, for diagonal elements (I = J), or 
%         for unrelated elements, or
%         if J << I.
%      1, if I << J.
%
%    Output, integer P(N), a permutation of the elements that reflects
%    their partial ordering.  P(I) is the new label of element I, with
%    the property that if ZETA(I,J) = 1, that is, I << J,
%    then P(I) < P(J) (in the usual ordering).
%

%
%  Make sure ZETA represents a partially ordered set.  In other words,
%  if ZETA(I,J) = 1, then ZETA(J,I) must NOT be 1.
%
  ierror = pord_check ( n, zeta );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANG - Fatal error!\n' );
    fprintf ( 1, '  The matrix ZETA does not represent a\n' );
    fprintf ( 1, '  partial ordering.\n' );
    error ( 'TRIANG - Fatal error!' );
  end

  m = 0;
  l = 0;
  p(1:n) = 0;
%
%  Find the next value of M for which P(M) is 0.
%
  while ( 1 )

    m = m + 1;

    if ( p(m) == 0 )
      break;
    end

    if ( m == n )
      return
    end

  end

  it = m + 1;
  ir = m + 1;

  while ( 1 )

    if ( ir <= n )

      if ( p(ir) == 0 & zeta(ir,m) ~= 0 )
        p(ir) = m;
        m = ir;
        ir = it;
      else
        ir = ir + 1;
      end

    else

      l = l + 1;
      iq = p(m);
      p(m) = l;

      if ( iq ~= 0 )

        ir = m + 1;
        m = iq;

      elseif ( m == n )

        break;

      else

        while ( 1 )

          m = m + 1;

          if ( p(m) == 0 )
            break;
          end

          if ( m == n )
            return
          end

        end

        it = m + 1;
        ir = m + 1;

      end

    end

  end

  return
end
