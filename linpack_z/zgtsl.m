function [ b, info ] = zgtsl ( n, c, d, e, b )

%*****************************************************************************80
%
%% ZGTSL solves a complex general tridiagonal system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2007
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch and Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, complex C(N); the subdiagonal of the matrix in entries C(2:N).
%
%    Input, complex D(N); the diagonal of the tridiagonal matrix.
%
%    Input, complex E(N), the superdiagonal of the matrix in entries E(1:N-1).
%
%    Input, complex B(N), the right hand side.
%
%    Output, complex B(N).  the solution.
%
%    Output, integer INFO.
%    0, normal value.
%    K, if the K-th element of the diagonal becomes exactly zero.  The
%    subroutine returns when this is detected.
%
  info = 0;
  c(1) = d(1);

  if ( 1 <= n-1 )

    d(1) = e(1);
    e(1) = 0.0;
    e(n) = 0.0;

    for k = 1 : n-1

      if ( zabs1 ( c(k) ) <= zabs1 ( c(k+1) ) )

        t      = b(k);
        b(k)   = b(k+1);
        b(k+1) = t;

        t      = c(k);
        c(k)   = c(k+1);
        c(k+1) = t;

        t      = d(k);
        d(k)   = d(k+1);
        d(k+1) = t;

        t      = e(k);
        e(k)   = e(k+1);
        e(k+1) = t;

      end

      if ( zabs1 ( c(k) ) == 0.0 )
        info = k;
        return
      end

      t = -c(k+1) / c(k);
      c(k+1) = d(k+1) + t * d(k);
      d(k+1) = e(k+1) + t * e(k);
      e(k+1) = 0.0;
      b(k+1) = b(k+1) + t * b(k);

    end

  end

  if ( zabs1 ( c(n) ) == 0.0 )
    info = n;
    return
  end
%
%  Back solve.
%
  b(n) = b(n) / c(n);

  if ( 1 < n )

    b(n-1) = ( b(n-1) - d(n-1) * b(n) ) / c(n-1);

    for k = n-2 : -1 : 1
      b(k) = ( b(k) - d(k) * b(k+1) - e(k) * b(k+2) ) / c(k);
    end

  end

  return
end
