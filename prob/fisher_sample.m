function [ xyz, seed ] = fisher_sample ( kappa, mu, n, seed )

%*****************************************************************************80
%
%% FISHER_SAMPLE samples the Fisher distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Nicholas Fisher, Toby Lewis, Brian Embleton,
%    Statistical Analysis of Spherical Data,
%    Cambridge, 2003,
%    ISBN13: 978-0521456999,
%    LC: QA276.F489.
%
%  Parameters:
%
%    Input, real KAPPA, the concentration parameter.
%
%    Input, real MU(3), the mean direction.
%    MU should have unit Euclidean norm, but this routine will
%    automatically work with a normalized version of MU.
%
%    Input, integer N, the number of samples to choose.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real XYZ(3,N), a sample of the Fisher distribution.
%
%    Output, integer SEED, a seed for the random number generator.
%
%  Local Parameters:
%
%    Input, real ALPHA, BETA, the colatitude (theta) and 
%    longitude (phi) of the mean direction.  
%
  mu_norm = norm ( mu(1:3) );

  if ( mu_norm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FISHER_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  Direction vector MU is zero\n' );
    error ( 'FISHER_SAMPLE - Fatal error!' );
  end

  alpha = - acos ( mu(3) / mu_norm );
  beta = atan2 ( mu(2), mu(1) );

  lambda = exp ( - 2.0 * kappa );

  [ theta, seed ] = r8vec_uniform_01 ( n, seed );

  if ( kappa == 0.0 ) 
    theta(1:n) = 2.0 * asin ( sqrt ( 1.0 - theta(1:n) ) );
  else
    theta(1:n) = 2.0 * asin ( sqrt ( ...
      - log ( theta(1:n) * ( 1.0 - lambda ) ) ...
      / ( 2.0 * kappa ) ) );
  end

  [ phi, seed ] = r8vec_uniform_01 ( n, seed );

  phi(1:n) = 2.0 * pi * phi(1:n);
%
%  Compute the unrotated points.
%
  xyz(1,1:n) = ( sin ( theta(1:n) ) .* cos ( phi(1:n) ) )';
  xyz(2,1:n) = ( sin ( theta(1:n) ) .* sin ( phi(1:n) ) )';
  xyz(3,1:n) = ( cos ( theta(1:n) ) )';
%
%  Compute the rotation matrix.
%
  a(1,1) =   cos ( alpha ) * cos ( beta );
  a(2,1) =                 - sin ( beta );
  a(3,1) =   sin ( alpha ) * cos ( beta ) ;

  a(1,2) =   cos ( alpha ) * sin ( beta );
  a(2,2) =                 + cos ( beta );
  a(3,2) =   sin ( alpha ) * sin ( beta );

  a(1,3) = - sin ( alpha );
  a(2,3) =   0.0;
  a(3,3) =   cos ( alpha );
%
%  Rotate the points.
%
  xyz(1:3,1:n) = a(1:3,1:3) * xyz(1:3,1:n);

  return
end
