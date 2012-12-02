function x = sample_paths_cholesky ( n, n2, rhomax, rho0, correlation )

%*****************************************************************************80
%
%% SAMPLE_PATHS_CHOLESKY: sample paths for stationary correlation functions.
%
%  Discussion:
%
%    This method uses the Cholesky factorization of the correlation matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points on each path.
%
%    Input, integer N2, the number of paths.
%
%    Input, real RHOMAX, the maximum value of RHO.
%
%    Input, real RHO0, the correlation length.
%
%    Input, @CORRELATION, a handle for a correlation function.
%
%    Output, real X(N,N2), the sample paths.
%

%
%  Choose N equally spaced sample points from 0 to RHOMAX.
%
  rho_vec = linspace ( 0.0, rhomax, n );
%
%  Evaluate the correlation function.
%
  cor_vec = correlation ( n, rho_vec, rho0 );

  cor = zeros ( n, n );
%
%  Construct the correlation matrix;
%
%  From the vector 
%    [ C(0), C(1), C(2), ... C(N-1) ]
%  construct the vector
%    [ C(N-1), ..., C(2), C(1), C(0), C(1), C(2), ...  C(N-1) ]
%  Every row of the correlation matrix can be constructed by a subvector
%  of this vector.
%
  cor_vec = [ cor_vec(n:-1:2)', cor_vec(1:n)' ];
  for i = 1 : n
    cor(i,1:n) = cor_vec(n+1-i:2*n-i);
  end
%
%  Get the Cholesky factorization of COR:
%
%    COR = L * L'.
%
  [ l, p ] = chol ( cor, 'lower' );
%
%  The matrix might not be positive definite.
%
  if ( p ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SAMPLE_PATHS_CHOLESKY - Fatal error!\n' );
    fprintf ( 1, '  MATLAB believes the correlation matrix is not\n' );
    fprintf ( 1, '  symmetric positive definite.\n' );
    fprintf ( 1, '  P = %d\n', p );
    error ( 'SAMPLE_PATHS_CHOLESKY - Fatal error!' )
  end
%
%  Compute N independent random normal values.
%
  r(1:n,1:n2) = randn ( n, n2 );
%
%  Compute the sample path.
%
  x(1:n,1:n2) = l(1:n,1:n) * r(1:n,1:n2);

  return
end

