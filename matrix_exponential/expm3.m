function E = expm3 ( A )

%*****************************************************************************80
%
%% EXPM3 approximates the matrix exponential using an eigenvalue approach.
%
%  Discussion:
%
%    exp(A) = V * D * V
%
%    where V is the matrix of eigenvectors of A, and D is the diagonal matrix
%    whose i-th diagonal entry is exp(lambda(i)), for lambda(i) an eigenvalue
%    of A.
%
%    This function is accurate for matrices which are symmetric, orthogonal,
%    or normal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2011
%
%  Author:
%
%    Cleve Moler, Charles Van Loan
%
%  Reference:
%
%    Cleve Moler, Charles VanLoan,
%    Nineteen Dubious Ways to Compute the Exponential of a Matrix,
%    Twenty-Five Years Later,
%    SIAM Review,
%    Volume 45, Number 1, March 2003, pages 3-49.
%
%  Parameters:
%
%    Input, real A(N,N), the matrix.
%
%    Output, real E(N,N), the estimate for exp(A).
%
  [ V, D ] = eig ( A );
  E = V * diag ( exp ( diag ( D ) ) ) / V;

  return
end
