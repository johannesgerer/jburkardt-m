function b = r8mat_poinv ( n, r )

%*****************************************************************************80
%
%% R8MAT_POINV computes the inverse of a factored positive definite matrix.
%
%  Discussion:
%
%    This routine expects to receive R, the upper triangular factor of A,
%    computed by R8MAT_POFAC, with the property that A = R' * R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1,
%    LC: QA214.L56.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.
%
%    Input, real R(N,N), the Cholesky factor of A.
%
%    Input, real B(N,N), the inverse of A.
%
  b(1:n,1:n) = r(1:n,1:n);

  for k = 1 : n

    b(k,k) = 1.0 / b(k,k);
    b(1:k-1,k) = - b(1:k-1,k) * b(k,k);

    for j = k + 1 : n
      t = b(k,j);
      b(k,j) = 0.0;
      b(1:k,j) = b(1:k,j) + t * b(1:k,k);
    end

  end
%
%  Form inverse(R) * (inverse(R))'.
%
  for j = 1 : n
    for k = 1 : j - 1
      t = b(k,j);
      b(1:k,k) = b(1:k,k) + t * b(1:k,j);
    end
    t = b(j,j);
    b(1:j,j) = b(1:j,j) * t;
  end

  return
end