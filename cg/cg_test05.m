function cg_test05 ( )

%*****************************************************************************80
%
%% CG_TEST05 tests R8SP_CG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_TEST05\n' );
  fprintf ( 1, '  Test R8SP_CG, applying CG to an R8SP matrix.\n' );

  seed = 123456789;
  n = 10;
  nz_num = 3 * n - 2;
%
%  Set A to the [-1 2 -1] matrix.
%
  [ row, col, a ] = r8sp_dif2 ( n, n, nz_num );
%
%  Choose a random solution.
%
  x1 = r8vec_uniform_01 ( n, seed );
%
%  Compute the corresponding right hand side.
%
  b = r8sp_mv ( n, n, nz_num, row, col, a, x1 );
%
%  Call the CG routine.
%
  x2 = ones ( n, 1 );
  x2 = r8sp_cg ( n, nz_num, row, col, a, b, x2 );
%
%  Compute the residual.
%
  r = r8sp_resid ( n, n, nz_num, row, col, a, x2, b );
  r_norm = r8vec_norm ( n, r );
%
%  Compute the error.
%
  e_norm = r8vec_diff_norm ( n, x1, x2 );
%
%  Report.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of variables N = %d\n', n );
  fprintf ( 1, '  Norm of residual ||Ax-b|| = %g\n', r_norm );
  fprintf ( 1, '  Norm of error ||x1-x2|| = %g\n', e_norm );

  return
end
