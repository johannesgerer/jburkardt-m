function [ a, seed ] = r8po_random ( n, seed )

%*****************************************************************************80
%
%% R8PO_RANDOM randomizes a R8PO matrix.
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
%    The matrix computed here is not simply a set of random numbers in
%    the nonzero slots of the R8PO array.  It is also a positive definite
%    matrix.  It is computed by setting a "random" upper triangular
%    Cholesky factor R, and then computing A = R'*R.
%    The randomness is limited by the fact that all the entries of
%    R will be between 0 and 1.  A truly random R is only required
%    to have positive entries on the diagonal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(N,N), the R8PO matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%

%
%  Set the whole matrix to zero.
%
  a(1:n,1:n) = 0.0;

  for i = n : -1 : 1
%
%  Set row I of R.
%
    for j = i : n
      [ a(i,j), seed ] = r8_uniform_01 ( seed );
    end
%
%  Consider element J of row I, last to first.
%
    for j = n : -1 : i
%
%  Add multiples of row I to lower elements of column J.
%
      a(i+1:j,j) = a(i+1:j,j) + a(i,i+1:j)' * a(i,j);
%
%  Reset element J.
%
      a(i,j) = a(i,i) * a(i,j);

    end
  end

  return
end
