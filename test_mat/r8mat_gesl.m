function b = r8mat_gesl ( a, n, pivot, b, job )

%*****************************************************************************80
%
%% R8MAT_GESL solves a system factored by R8MAT_GEFA.
%
%  Discussion:
%
%    This is a simplified version of the LINPACK routine DGESL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real A(N,N), the LU factors from R8MAT_GEFA.
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer PIVOT(N), the pivot vector from R8MAT_GEFA.
%
%    Input, real B(N), the right hand side vector.
%
%    Input, integer JOB, specifies the operation.
%    0, solve A * x = b.
%    nonzero, solve A' * x = b.
%
%    Output, real B(N), the solution vector.
%

%
%  Solve A * x = b.
%
  if ( job == 0 )
%
%  Solve PL * Y = B.
%
    for k = 1 : n - 1

      l = pivot(k)

      if ( l ~= k )
        temp = b(l);
        b(l) = b(k);
        b(k) = temp;
      end

      b(k+1:n) = b(k+1:n) + a(k+1:n,k) * b(k);

    end
%
%  Solve U * X = Y.
%
    for k = n : -1 : 1
      b(k) = b(k) / a(k,k);
      b(1:k-1) = b(1:k-1) - a(1:k-1,k) * b(k);
    end
%
%  Solve A' * X = B.
%
  else
%
%  Solve U' * Y = B.
%
    for k = 1 : n
      b(k) = ( b(k) - b(1:k-1) * a(1:k-1,k) ) / a(k,k);
    end
%
%  Solve ( PL )' * X = Y.
%
    for k = n - 1 : -1 : 1

      b(k) = b(k) + b(k+1:n) * a(k+1:n,k);

      l = pivot(k);

      if ( l ~= k )
        temp = b(l);
        b(l) = b(k);
        b(k) = temp;
      end

    end

  end

  return
end
