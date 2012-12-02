function x = sample_paths2_cholesky ( n, n2, rhomin, rhomax, rho0, correlation2 )

%*****************************************************************************80
%
%% SAMPLE_PATHS2_CHOLESKY: sample paths for nonstationary correlation functions.
%
%  Discussion:
%
%    This function assumes does not assume that the correlation function
%    C(S,T) is actually a function of ||S-T||. 
%
%    This method uses the Cholesky factorization of the correlation matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2012
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
%    Input, real RHOMIN, RHOMAX, the argument range to examine.
%
%    Input, real RHO0, the correlation length.
%
%    Input, @CORRELATION2, a handle for a correlation function, which has
%    the form c = correlation2 ( m, n, s, t, rho0 ).
%
%    Output, real X(N,N2), the sample paths.
%

%
%  Choose 2 equal N vectors of equally spaced sample points from RHOMIN to RHOMAX.
%
  s = linspace ( rhomin, rhomax, n );
%
%  Evaluate the correlation function of two arguments.
%
  cor = correlation2 ( n, n, s, s, rho0 );
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
    fprintf ( 1, 'SAMPLE_PATHS2_CHOLESKY - Fatal error!\n' );
    fprintf ( 1, '  MATLAB believes the correlation matrix is not\n' );
    fprintf ( 1, '  symmetric positive definite.\n' );
    fprintf ( 1, '  P = %d\n', p );
    error ( 'SAMPLE_PATHS2_CHOLESKY - Fatal error!' )
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

