function cg_test01 ( n )

%*****************************************************************************80
%
%% CG_TEST01 tests R8GE_CG for a full storage matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the system.
%
  if ( nargin < 1 )
    n = 10;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_TEST01\n' );
  fprintf ( 1, '  Test R8GE_CG, applying CG to a full storage matrix.\n' );

  seed = 123456789;
%
%  Choose a random positive definite symmetric matrix A.
%
  [ a, seed ] = pds_random ( n, seed );
%
%  Choose a random solution.
%
  [ x1, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Compute the corresponding right hand side.
%
  b = r8ge_mv ( n, n, a, x1 );
%
%  Call the CG routine.
%
  x2 = ones ( n, 1 );
  x2 = r8ge_cg ( n, a, b, x2 );
%
%  Compute the residual.
%
  r = r8ge_resid ( n, n, a, x2, b );
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
