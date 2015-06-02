function cg_test04 ( )

%*****************************************************************************80
%
%% CG_TEST04 tests R8SD_CG.
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
  fprintf ( 1, 'CG_TEST04\n' );
  fprintf ( 1, '  Test R8SD_CG, applying CG to an R8SD matrix.\n' );

  n = 10;

  ndiag = 2;
  offset = zeros ( ndiag, 1 );
  offset(1) = 0;
  offset(2) = 1;
%
%  Set A to the [-1 2 -1] matrix.
%
  a = r8sd_dif2 ( n, n, ndiag, offset );
%
%  Choose a random solution.
%
  seed = 123456789;
  [ x1, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Compute the corresponding right hand side.
%
  b = r8sd_mv ( n, n, ndiag, offset, a, x1 );
%
%  Call the CG routine.
%
  x2 = ones ( n, 1 );
  x2 = r8sd_cg ( n, ndiag, offset, a, b, x2 );
%
%  Compute the residual.
%
  r = r8sd_resid ( n, n, ndiag, offset, a, x2, b );
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
