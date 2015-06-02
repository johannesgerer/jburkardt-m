function [ x, seed ] = ellipsoid_sample ( m, n, a, v, r, seed )

%*****************************************************************************80
%
%% ELLIPSOID_SAMPLE samples points uniformly from an ellipsoid.
%
%  Discussion:
%
%    The points X in the ellipsoid are described by a M by M
%    positive definite symmetric matrix A, a "center" V, and 
%    a "radius" R, such that
%
%      (X-V)' * A * (X-V) <= R * R
%
%    The algorithm computes the Cholesky factorization of A:
%
%      A = U' * U.
%
%    A set of uniformly random points Y is generated, satisfying:
%
%      Y' * Y <= R * R.
%
%    The appropriate points in the ellipsoid are found by solving
%
%      U * X = Y
%      X = X + V
%
%    Thanks to Dr Karl-Heinz Keil for pointing out that the original
%    coding was actually correct only if A was replaced by its inverse.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation, and Sensitivity
%    of Queueing Networks,
%    Krieger, 1992,
%    ISBN: 0894647644,
%    LC: QA298.R79.
%
%  Parameters:
%
%    Input, integer M, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input, real A(M,M), the matrix that describes
%    the ellipsoid.
%
%    Input, real V(M), the "center" of the ellipsoid.
%
%    Input, real R, the "radius" of the ellipsoid.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real X(M,N), the points.
%

%
%  Get the Cholesky factor U.
%
  [ u, info ] = r8po_fa ( m, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ELLIPSOID_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  R8PO_FA reports that the matrix A\n' );
    fprintf ( 1, '  is not positive definite symmetric.\n' );
    error ( 'ELLIPSOID_SAMPLE - Fatal error!' );
  end
%
%  Get the points Y that satisfy Y' * Y <= 1.
%
  [ y, seed ] = uniform_in_sphere01_map ( m, n, seed );
%
%  Get the points Y that satisfy Y' * Y <= R * R.
%
  y(1:m,1:n) = r * y(1:m,1:n);
%
%  Solve U * X = Y.
%
  x = zeros ( m, n );

  for j = 1 : n
    x(1:m,j) = r8po_sl ( m, u, y(1:m,j) );
  end
%
%  X = X + V.
%
  for i = 1 : m
    x(i,1:n) = x(i,1:n) + v(i);
  end

  return
end