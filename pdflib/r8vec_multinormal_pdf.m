function value = r8vec_multinormal_pdf ( n, mu, r, c_det, x )

%*****************************************************************************80
%
%% R8VEC_MULTINORMAL_PDF evaluates a multivariate normal PDF.
%
%  Discussion:
%
%    PDF ( MU(1:N), C(1:N,1:N); X(1:N) ) = 
%      1 / ( 2 * pi ) ^ ( N / 2 ) * 1 / det ( C )
%      * exp ( - ( X - MU )' * inverse ( C ) * ( X - MU ) / 2 )
%
%    Here,
%
%      X is the argument vector of length N,
%      MU is the mean vector of length N,
%      C is an N by N positive definite symmetric covariance matrix.
%
%    The properties of C guarantee that it has an upper triangular
%    matrix R, the Cholesky factor, such that C = R' * R.  It is the
%    matrix R that is required by this routine.
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
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, real MU(N), the mean vector.
%
%    Input, real R(N,N), the upper triangular Cholesky
%    factor of the covariance matrix C.
%
%    Input, real C_DET, the determinant of the
%    covariance matrix C.
%
%    Input, real X(N), a sample of the distribution.
%
%    Output, real VALUe, the PDF evaluated
%    at X.
%
  x = x ( : );
  mu = mu ( : );
%
%  Compute:
%    inverse(R')*(x-mu) = y
%  by solving:
%    R'*y = x-mu
%
  b(1:n) = x(1:n) - mu(1:n);
  y = r8mat_utsol ( n, r, b );
%
%  Compute:
%    (x-mu)' * inv(C)          * (x-mu)
%  = (x-mu)' * inv(R'*R)       * (x-mu)
%  = (x-mu)' * inv(R) * inv(R) * (x-mu)
%  = y' * y.
%
  xcx = y' * y;

  value = 1.0 / sqrt ( ( 2.0 * pi ) ^ n ) ...
      * 1.0 / sqrt ( c_det ) ...
      * exp ( -0.5 * xcx );

  return
end