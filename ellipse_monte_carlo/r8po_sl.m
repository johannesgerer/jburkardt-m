function x = r8po_sl ( n, r, b )

%*****************************************************************************80
%
%% R8PO_SL solves a R8PO system factored by R8PO_FA.
%
%  Discussion:
%
%    The R8PO storage format is appropriate for a symmetric positive definite 
%    matrix and its inverse.  (The Cholesky factor of a R8PO matrix is an
%    upper triangular matrix, so it will be in R8GE storage format.)
%
%    Only the diagonal and upper triangle of the square array are used.
%    This same storage scheme is used when the matrix is factored by
%    R8PO_FA, or inverted by R8PO_INVERSE.  For clarity, the lower triangle
%    is set to zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2004
%
%  Author:
%
%    FORTRAN77 original version by Dongarra, Bunch, Moler, Stewart.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real R(N,N), the Cholesky factor, in R8GE storage, 
%    returned by R8PO_FA.
%
%    Input, real B(N), the right hand side.
%
%    Output, real X(N), the solution vector.
%
  x(1:n) = b(1:n);
%
%  Solve R' * y = b.
%
  for k = 1 : n
    t = 0.0;
    for i = 1 : k-1
      t = t + x(i) * r(i,k);
    end
    x(k) = ( x(k) - t ) / r(k,k);
  end
%
%  Solve R * x = y.
%
  for k = n : -1 : 1
    x(k) = x(k) / r(k,k);
    x(1:k-1) = x(1:k-1) - r(1:k-1,k)' * x(k);
  end

  return
end
