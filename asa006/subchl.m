function [ u, nullty, ifault, det ] = subchl ( a, b, n, ndim )

%*****************************************************************************80
%
%% SUBCHL computes the Cholesky factorization of a (subset of a) PDS matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2008
%
%  Author:
%
%    Original FORTRAN77 version by Michael Healy, PR Freeman.
%    MATLAB version by  John Burkardt.
%
%  Reference:
%
%    PR Freeman,
%    Remark AS R44:
%    A Remark on AS 6 and AS7: Triangular decomposition of a symmetric matrix
%    and Inversion of a positive semi-definite symmetric matrix,
%    Applied Statistics,
%    Volume 31, Number 3, 1982, pages 336-339.
%
%    Michael Healy,
%    Algorithm AS 6:
%    Triangular decomposition of a symmetric matrix,
%    Applied Statistics,
%    Volume 17, Number 2, 1968, pages 195-197.
%
%  Parameters:
%
%    Input, real A((M*(M+1))/2), a positive definite matrix
%    stored by rows in lower triangular form as a one dimensional array,
%    in the sequence
%    A(1,1),
%    A(2,1), A(2,2),
%    A(3,1), A(3,2), A(3,3), and so on.
%    In the simplest case, M, the order of A, is equal to N.
%
%    Input, integer B(N), indicates the order in which the
%    rows and columns of A are to be used.  In the simplest case,
%    B = (1,2,3...,N).
%
%    Input, integer N, the order of the matrix, that is,
%    the matrix formed by using B to select N rows and columns of A.
%
%    Input, integer NDIM, the dimension of A and U, which might
%    be presumed to be (N*(N+1))/2.
%
%    Output, real U((N*(N+1))/2), an upper triangular matrix,
%    stored by columns, which is the Cholesky factor of A.  The program is
%    written in such a way that A and U can share storage.
%
%    Output, integer NULLTY, the rank deficiency of A.
%    If NULLTY is zero, the matrix is judged to have full rank.
%
%    Output, integer IFAULT, an error indicator.
%    0, no error was detected;
%    1, if N < 1;
%    2, if A is not positive semi-definite.
%
%    Output, real DET, the determinant of the matrix.
%
  u(1:(n*(n+1))/2) = 0.0;

  eta = 1.0E-09;
  ifault = 0;
  nullty = 0;
  det = 1.0;

  if ( n <= 0 )
    ifault = 1;
    return
  end

  ifault = 2;
  j = 1;
  k = 0;

  for icol = 1 : n

    ij = ( b(icol) * ( b(icol) - 1 ) ) / 2;
    ii = ij + b(icol);
    x = eta * eta * a(ii);
    l = 0;

    for irow = 1 : icol

      kk = ( b(irow) * ( b(irow) + 1 ) ) / 2;
      k = k + 1;
      jj = ij + b(irow);
      w = a(jj);
      m = j;

      for i = 1 : irow - 1
        l = l + 1;
        w = w - u(l) * u(m);
        m = m + 1;
      end

      l = l + 1;

      if ( irow == icol )
        break
      end

      if ( u(l) ~= 0.0 )

        u(k) = w / u(l);

      else

        if ( abs ( x * a(kk) ) < w * w )
          ifault = 2;
          return
        end

        u(k) = 0.0;

      end

    end

    if ( abs ( eta * a(kk) ) <= abs ( w ) )

      if ( w < 0.0 )
        ifault = 2;
        return
      end

      u(k) = sqrt ( w );

    else

      u(k) = 0.0;
      nullty = nullty + 1;

    end

    j = j + icol;
    det = det * u(k) * u(k);

  end

  return
end
