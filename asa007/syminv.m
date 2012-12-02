function [ c, nullty, ifault ] = syminv ( a, n )

%*****************************************************************************80
%
%% SYMINV computes the inverse of a symmetric matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2008
%
%  Author:
%
%    Original FORTRAN77 version by Michael Healy.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Michael Healy,
%    Algorithm AS 7:
%    Inversion of a Positive Semi-Definite Symmetric Matrix,
%    Applied Statistics,
%    Volume 17, Number 2, 1968, pages 198-199.
%
%  Parameters:
%
%    Input, real A((N*(N+1))/2), a positive definite matrix stored
%    by rows in lower triangular form as a one dimensional array, in the sequence
%    A(1,1),
%    A(2,1), A(2,2),
%    A(3,1), A(3,2), A(3,3), and so on.
%
%    Input, integer N, the order of A.
%
%    Output, real C((N*(N+1))/2), the inverse of A, or generalized
%    inverse if A is singular, stored using the same storage scheme employed
%    for A. 
%
%    Output, integer NULLTY, the rank deficiency of A.  If NULLTY is zero,
%    the matrix is judged to have full rank.
%
%    Output, integer IFAULT, error indicator.
%    0, no error detected.
%    1, N < 1.
%    2, A is not positive semi-definite.
%
  c = [];
  nullty = 0;
  ifault = 0;

  if ( n <= 0 )
    ifault = 1;
    return
  end

  nrow = n;
%
%  Compute the Cholesky factorization of A.
%  The result is stored in C.
%
  nn = floor ( ( n * ( n + 1 ) ) / 2 );

  [ c, nullty, ifault ] = cholesky ( a, n, nn );

  if ( ifault ~= 0 )
    return
  end
%
%  Invert C and form the product (Cinv)' * Cinv, where Cinv is the inverse
%  of C, row by row starting with the last row.
%  IROW = the row number,
%  NDIAG = location of last element in the row.
%
  irow = nrow;
  ndiag = nn;

  while ( 1 )
%
%  Special case, zero diagonal element.
%
    if ( c(ndiag) == 0.0 )

      l = ndiag;
      for j = irow : nrow
        c(l) = 0.0;
        l = l + j;
      end

    else

      l = ndiag;
      for i = irow : nrow
        w(i) = c(l);
        l = l + i;
      end

      icol = nrow;
      jcol = nn;
      mdiag = nn;

      while ( 1 )

        l = jcol;

        if ( icol == irow )
          x = 1.0 / w(irow);
        else
          x = 0.0;
        end

        k = nrow;

        while ( irow < k )

          x = x - w(k) * c(l);
          k = k - 1;
          l = l - 1;

          if ( mdiag < l )
            l = l - k + 1;
          end

        end

        c(l) = x / w(irow);

        if ( icol <= irow )
          break
        end

        mdiag = mdiag - icol;
        icol = icol - 1;
        jcol = jcol - 1;

      end

    end

    ndiag = ndiag - irow;
    irow = irow - 1;

    if ( irow <= 0 )
      break
    end

  end

  return
end
