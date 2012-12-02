function b = r8plu_mul ( n, pivot, lu, x )

%*****************************************************************************80
%
%% R8PLU_MUL computes A * x using the PLU factors of A.
%
%  Discussion:
%
%    It is assumed that R8MAT_TO_R8PLU has computed the PLU factors of
%    the matrix A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer PIVOT(N), the pivot vector computed by R8MAT_TO_R8PLU.
%
%    Input, real LU(N,N), the matrix factors computed by
%    R8MAT_TO_R8PLU.
%
%    Input, real X(N), the vector to be multiplied.
%
%    Output, real B(N), the result of the multiplication.
%
  b(1:n) = x(1:n);
%
%  Y = U * X.
%
  for j = 1 : n
    b(1:j-1) = b(1:j-1) + lu(1:j-1,j)' * b(j);
    b(j) = lu(j,j) * b(j);
  end
%
%  B = PL * Y = PL * U * X = A * x.
%
  for j = n-1 : -1 : 1

    b(j+1:n) = b(j+1:n) - lu(j+1:n,j)' * b(j);

    k = pivot(j);

    if ( k ~= j )
      temp = b(k);
      b(k) = b(j);
      b(j) = temp;
    end

  end

  return
end
