function [ b, info ] = dgtsl ( n, c, d, e, b )

%*****************************************************************************80
%
%% DGTSL solves a general tridiagonal linear system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2005
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, integer N, the order of the tridiagonal matrix.
%
%    Input, real C(N), the subdiagonal of the
%    tridiagonal matrix in entries C(2:N).
%
%    Input, real D(N), the diagonal of the matrix.  
%
%    Input, real E(N), the superdiagonal of the
%    tridiagonal matrix in entries E(1:N-1).  
%
%    Input, real B(N), the right hand side.
%
%    Output, real B(N), the solution.
%
%    Output, integer INFO, error flag.
%    0, normal value.
%    K, the K-th element of the diagonal becomes exactly zero.  The 
%       subroutine returns if this error condition is detected.
%
  info = 0;
  c(1) = d(1);

  if ( 2 <= n )

    d(1) = e(1);
    e(1) = 0.0;
    e(n) = 0.0;

    for k = 1 : n - 1
%
%  Find the larger of the two rows.
%
      if ( abs ( c(k) ) <= abs ( c(k+1) ) )
%
%  Interchange rows.
%
        t = c(k+1);
        c(k+1) = c(k);
        c(k) = t;

        t = d(k+1);
        d(k+1) = d(k);
        d(k) = t;

        t = e(k+1);
        e(k+1) = e(k);
        e(k) = t;

        t = b(k+1);
        b(k+1) = b(k);
        b(k) = t;

      end
%
%  Zero elements.
%
      if ( c(k) == 0.0 )
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

  if ( c(n) == 0.0 )
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
