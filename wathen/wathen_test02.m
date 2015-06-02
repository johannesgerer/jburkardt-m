function wathen_test02 ( )

%*****************************************************************************80
%
%% WATHEN_TEST02 assembles, factors and solves using WATHEN_GB.
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
  fprintf ( 1, 'WATHEN_TEST02\n' );
  fprintf ( 1, '  Assemble, factor and solve a Wathen system\n' );
  fprintf ( 1, '  using WATHEN_GB.\n' );
  fprintf ( 1, '\n' );

  nx = 4;
  ny = 4;
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
  r8vec_print ( n, b, '  B:' );
%
%  Solve the linear system.
%
  lda = 2 * ml + mu + 1;
  [ alu, ipvt, info ] = dgbfa ( a, lda, n, ml, mu );
  job = 0;
  x2 = dgbsl ( alu, lda, n, ml, mu, ipvt, b, job );
%
%  Compute the maximum solution error.
%
  e = max ( abs ( x1 - x2 ) );
  fprintf ( 1, '  Maximum solution error is %g\n', e );

  return
end

