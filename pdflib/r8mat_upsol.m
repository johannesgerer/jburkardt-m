function x = r8mat_upsol ( n, r, b )

%*****************************************************************************80
%
%% R8MAT_UPSOL solves R * X = B for an upper triangular matrix R.
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
%    Input, integer N, the order of the matrix.
%
%    Input, real R(N,N), the upper triangular matrix.
%
%    Input, real B(N), the right hand side.
%
%    Output, real X(N), the solution.
%
  x(1:n) = b(1:n);

  x(n) = x(n) / r(n,n);

  for j = n - 1 : -1 : 1
    x(1:j) = x(1:j) - r(1:j,j+1) * x(j+1);
    x(j) = x(j) / r(j,j);
  end

  return
end