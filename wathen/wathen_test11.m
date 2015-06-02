function wathen_test11 ( )

%*****************************************************************************80
%
%% WATHEN_TEST11 assemble, factor and solve using WATHEN_ST + CG_ST.
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
  fprintf ( 1, 'WATHEN_TEST11\n' );
  fprintf ( 1, '  Assemble, factor and solve a Wathen system\n' );
  fprintf ( 1, '  defined by WATHEN_ST and CG_ST.\n' );
  fprintf ( 1, '\n' );

  nx = 1;
  ny = 1;
  fprintf ( 1, '  Elements in X direction NX = %d\n', nx );
  fprintf ( 1, '  Elements in Y direction NY = %d\n', ny );
  fprintf ( 1, '  Number of elements = %d\n', nx * ny );
%
%  Compute the number of unknowns.
%
  n = wathen_order ( nx, ny );
  fprintf ( 1, '  Number of nodes N = %d\n', n );
%
%  Compute the matrix size.
%
  nz_num = wathen_st_size ( nx, ny );
  fprintf ( 1, '  Number of nonzeros = %d\n', nz_num );
%
%  Set up a random solution X1.
%
  seed = 123456789;
  [ x1, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Compute the matrix.
%
  seed = 123456789;
  [ row, col, a, seed ] = wathen_st ( nx, ny, nz_num, seed );
%
%  Compute the corresponding right hand side B.
%
  b = mv_st ( n, n, nz_num, row, col, a, x1 );
%
%  Solve the linear system.
%
  x2 = ones ( n, 1 );
  x2 = cg_st ( n, nz_num, row, col, a, b, x2 );
%
%  Compute the maximum solution error.
%
  e = max ( abs ( x1 - x2 ) );
  fprintf ( 1, '  Maximum solution error is %g\n', e );

  return
end

