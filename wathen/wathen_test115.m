function wathen_test115 ( )

%*****************************************************************************80
%
%% WATHEN_TEST115 assembles, factors and solves using WATHEN_GB + CG_GB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WATHEN_TEST115\n' );
  fprintf ( 1, '  Assemble, factor and solve a Wathen system\n' );
  fprintf ( 1, '  using WATHEN_GB and CG_GB.\n' );
  fprintf ( 1, '\n' );

  nx = 2;
  ny = 2;
  fprintf ( 1, '  Elements in X direction NX = %d\n', nx );
  fprintf ( 1, '  Elements in Y direction NY = %d\n', ny );
  fprintf ( 1, '  Number of elements = %d\n', nx * ny );
%
%  Compute the number of unknowns.
%
  n = wathen_order ( nx, ny );
  fprintf ( 1, '  Number of nodes N = %d\n', n );
%
%  Compute the bandwidth.
%
  [ ml, md, mu ] = wathen_bandwidth ( nx, ny );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Lower bandwidth MU = %d\n', mu );
%
%  Set up a random solution X1.
%
  seed = 123456789;
  [ x1, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Compute the matrix.
%
  seed = 123456789;
  [ a, seed ] = wathen_gb ( nx, ny, n, seed );
%
%  Compute the corresponding right hand side B.
%
  b = mv_gb ( n, n, ml, mu, a, x1 );
%
%  Solve the linear system.
%
  x2 = ones ( n, 1 );
  x2 = cg_gb ( n, ml, mu, a, b, x2 );
%
%  Compute the maximum solution error.
%
  e = max ( abs ( x1 - x2 ) );
  fprintf ( 1, '  Maximum solution error is %g\n', e );

  return
end

