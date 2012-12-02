function x = sample_paths2_eigen ( n, n2, rhomin, rhomax, rho0, correlation2 )

%*****************************************************************************80
%
%% SAMPLE_PATHS2_EIGEN: sample paths for nonstationary correlation functions.
%
%  Discussion:
%
%    This function does not assume that the correlation function
%    C(S,T) is actually a function of ||S-T||.
%
%    This method uses the eigen-decomposition of the correlation matrix.
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
%    Input, real RHOMIN, RHOMAX, the minimum and maximum values of RHO.
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
%  Evaluate the correlation function.
%
  cor = correlation2 ( n, n, s, s, rho0 );
%
%  Get the eigendecomposition of COR:
%
%    COR = V * D * V'.
%
%  Because COR is symmetric, V is orthogonal.
%
  [ v, d ] = eig ( cor );
%
%  We assume COR is non-negative definite, and hence that there
%  are no negative eigenvalues.  If this is not the case,
%  warn the user, hope the numbers are only slightly negative,
%  and reset them to 0.
%
  dmin = min ( min ( d ) );

  if ( dmin < - sqrt ( eps ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SAMPLE_PATHS2_EIGEN - Warning!\n' );
    fprintf ( 1, '  Negative eigenvalues observed as low as %g\n', dmin );
  end

  d = max ( d, 0.0 );
%
%  Compute the eigenvalues of the factor C.
%
  sqrt_d = sqrt ( d );
%
%  Compute C, such that C' * C = COR.
%
  c = v * sqrt_d * v';
%
%  Compute N independent random normal values.
%
  r(1:n,1:n2) = randn ( n, n2 );
%
%  Get the variables X which have correlation COR.
%
  x(1:n,1:n2) = c(1:n,1:n) * r(1:n,1:n2);

  return
end

