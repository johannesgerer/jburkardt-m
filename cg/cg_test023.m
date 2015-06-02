function cg_test023 ( )

%*****************************************************************************80
%
%% CG_TEST023 tests R83S_CG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_TEST023\n' );
  fprintf ( 1, '  Test R83S_CG, applying CG to an R83S matrix.\n' );

  n = 10;
%
%  Let A be the -1 2 -1 matrix.
%
  a = r83s_dif2 ( n, n );
%
%  Choose a random solution.
%
  seed = 123456789;
  [ x1, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Compute the corresponding right hand side.
%
  b = r83s_mv ( n, n, a, x1 );
%
%  Call the CG routine.
%
  x2 = ones ( n, 1 );
  x2 = r83s_cg ( n, a, b, x2 );
%
%  Compute the residual.
%
  r = r83s_resid ( n, n, a, x2, b );
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
