function a = r8mat_geinverse ( a, n, pivot )

%*****************************************************************************80
%
%% R8MAT_GEINVERSE computes the inverse of a matrix factored by R8MAT_GEFA.
%
%  Discussion:
%
%    R8MAT_GEINVERSE is a modified version of the LINPACK routine DGEDI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
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
%    Input/output, real A(N,N).
%    On input, the factor information computed by R8MAT_GEFA.
%    On output, the inverse matrix.
%
%    Input, integer N, the order of the matrix A.
%
%    Input, integer PIVOT(N), the pivot vector from R8MAT_GEFA.
%

%
%  Compute Inverse(U).
%
  for k = 1 : n

    a(k,k) = 1.0 / a(k,k);

    a(1:k-1,k) = - a(1:k-1,k) * a(k,k);

    for j = k + 1 : n

      temp = a(k,j);
      a(k,j) = 0.0;

      a(1:k,j) = a(1:k,j) + temp * a(1:k,k);

    end

  end
%
%  Form Inverse(U) * Inverse(L).
%
  for k = n - 1 : -1 : 1

    work(k+1:n) = a(k+1:n,k);
    a(k+1:n,k) = 0.0;

    for j = k + 1 : n
      a(1:n,k) = a(1:n,k) + work(j) * a(1:n,j);
    end

    if ( pivot(k) ~= k )

      for i = 1 : n
        temp = a(i,k);
        a(i,k) = a(i,pivot(k));
        a(i,pivot(k)) = temp;
      end

    end

  end

  return
end
