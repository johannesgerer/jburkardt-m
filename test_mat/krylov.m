function a = krylov ( n, b, x )

%*****************************************************************************80
%
%% KRYLOV returns a Krylov matrix.
%
%  Formula:
%
%    Column 1 of A is X.
%    Column 2 of A is B*X.
%    Column 3 of A is B*B*X.
%    ..
%    Column N of A is B**(N-1)*X.
%
%  Example:
%
%    N = 5, X = ( 1, -2, 3, -4, 5 )
%
%    Matrix B:
%
%    1  2 1 0 1
%    1  0 3 1 4
%    2  1 3 2 1
%    1  1 2 1 0
%    1 -4 3 5 0
%
%    Matrix A:
%
%     6  61  71  688
%    26  16 -37 2752
%     6  54 312 1878
%     1  44 229  887
%    -2 -76 379 2300
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, Charles Van Loan,
%    Matrix Computations,
%    Johns Hopkins University Press, 1983, page 224.
%
%  Parameters:
%
%    Input, integer N, the order of A and B.
%
%    Input, real B(N,N), the multiplying matrix.
%
%    Input, real X(N), the vector defining A.
%
%    Output, real A(N,N), the matrix.
%
  a(1:n,1) = x(1:n);

  for j = 2 : n
    a(1:n,j) = b(1:n,1:n) * a(1:n,j-1);
  end

  return
end
