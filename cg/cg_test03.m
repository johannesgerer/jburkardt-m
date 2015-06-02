function cg_test03 ( )

%*****************************************************************************80
%
%% CG_TEST03 tests R8PBU_CG.
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
  fprintf ( 1, 'CG_TEST03\n' );
  fprintf ( 1, '  Test R8PBU_CG, applying CG to an R8PBU matrix.\n' );

  seed = 123456789;
  n = 10;
  mu = 1;
%
%  Let A be the -1 2 -1 matrix.
%
  a = r8pbu_dif2 ( n, n, mu );
%
%  Choose a random solution.
%
  [ x1, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Compute the corresponding right hand side.
%
  b = r8pbu_mv ( n, n, mu, a, x1 );
%
%  Call the CG routine.
%
  x2 = ones ( n, 1 );
  x2 = r8pbu_cg ( n, mu, a, b, x2 );
%
%  Compute the residual.
%
  r = r8pbu_resid ( n, n, mu, a, x2, b );
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
