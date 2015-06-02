function x = r8vec_multinormal_sample ( n, mu, r )

%*****************************************************************************80
%
%% R8VEC_MULTINORMAL_SAMPLE samples a multivariate normal PDF.
%
%  Discussion:
%
%    PDF ( MU(1:N), C(1:N,1:N); X(1:N) ) = 
%      1 / ( 2 * pi ) ^ ( N / 2 ) * 1 / sqrt ( det ( C ) )
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
%    29 July 2013
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
%    Output, real X(N), a sample of the distribution.
%

%
%  Compute X = MU + R' * Z
%  where Z is a vector of standard normal variates.
%
  z = zeros ( n, 1 );
  for j = 1 : n
    z(j) = r8_normal_01_sample ( );
  end

  x = zeros ( n, 1 );
  for i = 1 : n
    x(i) = mu(i);
    for j = 1 : i
      x(i) = x(i) + r(j,i) * z(j);
    end
  end

  return
end
