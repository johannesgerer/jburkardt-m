function [ r, info ] = r8po_fa ( n, a )

%*****************************************************************************80
%
%% R8PO_FA factors an R8PO matrix.
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
%    The positive definite symmetric matrix A has a Cholesky factorization
%    of the form:
%
%      A = R' * R
%
%    where R is an upper triangular matrix with positive elements on
%    its diagonal.  This routine overwrites the matrix A with its
%    factor R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2004
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
%    Input, real A(N,N), the matrix in R8PO storage.
%
%    Output, real R(N,N), the Cholesky factor R in R8GE storage.
%
%    Output, integer INFO, error flag.
%    0, normal return.
%    K, error condition.  The principal minor of order K is not
%    positive definite, and the factorization was not completed.
%
  r(1:n,1:n) = a(1:n,1:n);

  for j = 1 : n

    for k = 1 : j - 1
      t = 0.0;
      for i = 1 : k-1
        t = t + r(i,k) * r(i,j);
      end
      r(k,j) = ( r(k,j) - t ) / r(k,k);
    end

    t = 0.0E+00;
    for i = 1 : j - 1
      t = t + r(i,j)^2;
    end

    s = r(j,j) - t;

    if ( s <= 0.0 )
      info = j;
      return;
    end

    r(j,j) = sqrt ( s );

  end

  info = 0;
%
%  Since the Cholesky factor is stored in DGE format, be sure to
%  zero out the lower triangle.
%
  for i = 1 : n
    for j = 1 : i-1
      r(i,j) = 0.0;
    end
  end

  return
end
