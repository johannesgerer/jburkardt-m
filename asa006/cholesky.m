function [ u, nullty, ifault ] = cholesky ( a, n, nn )

%*****************************************************************************80
%
%% CHOLESKY computes the Cholesky factorization of a PDS matrix.
%
%  Discussion:
%
%    For a positive definite symmetric matrix A, the Cholesky factor U
%    is an upper triangular matrix such that A = U' * U.
%
%    This routine was originally named "CHOL", but that conflicts with
%    the name of a built in MATLAB routine.
%
%    The missing initialization "II = 0" has been added to the code.
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
%    Modifications by AJ Miller.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Michael Healy,
%    Algorithm AS 6:
%    Triangular decomposition of a symmetric matrix,
%    Applied Statistics,
%    Volume 17, Number 2, 1968, pages 195-197.
%
%  Parameters:
%
%    Input, real A((N*(N+1))/2), a positive definite matrix
%    stored by rows in lower triangular form as a one dimensional array,
%    in the sequence
%    A(1,1),
%    A(2,1), A(2,2),
%    A(3,1), A(3,2), A(3,3), and so on.
%
%    Input, integer N, the order of A.
%
%    Input, integer NN, the dimension of the array used to store A, 
%    which should be at least (N*(N+1))/2.
%
%    Output, real U((N*(N+1))/2), an upper triangular matrix,
%    stored by columns, which is the Cholesky factor of A.  
%
%    Output, integer NULLTY, the rank deficiency of A.  If NULLTY is zero,
%    the matrix is judged to have full rank.
%
%    Output, integer IFAULT, an error indicator.
%    0, no error was detected;
%    1, if N < 1;
%    2, if A is not positive semi-definite.
%    3, if NN < (N*(N+1))/2.
%
%  Local Parameters:
%
%    Local, real ETA, should be set equal to the smallest positive
%    value such that 1.0 + ETA is calculated as being greater than 1.0 in the
%    accuracy being used.
%

%
%  Initialize output.
%
  u = [];
  nullty = 0;
  ifault = 0;

  eta = 1.0E-09;

  if ( n <= 0 )
    ifault = 1;
    return
  end

  if ( nn < floor ( ( n * ( n + 1 ) ) / 2 ) )
    ifault = 3;
    return
  end

  u(1:nn) = 0.0;
  j = 1;
  k = 0;
  ii = 0;
%
%  Factorize column by column, ICOL = column number.
%
  for icol = 1 : n

    ii = ii + icol;
    x = eta * eta * a(ii);
    l = 0;
    kk = 0;
%
%  IROW = row number within column ICOL.
%
    for irow = 1 : icol

      kk = kk + irow;
      k = k + 1;
      w = a(k);
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

        u(k) = 0.0;

        if ( abs ( x * a(k) ) < w * w )
          ifault = 2;
          return
        end

      end

    end
%
%  End of row, estimate relative accuracy of diagonal element.
%
    if ( abs ( w ) <= abs ( eta * a(k) ) )

      u(k) = 0.0;
      nullty = nullty + 1;

    else

      if ( w < 0.0 )
        ifault = 2;
        return
      end

      u(k) = sqrt ( w );

    end

    j = j + icol;

  end

  return
end
