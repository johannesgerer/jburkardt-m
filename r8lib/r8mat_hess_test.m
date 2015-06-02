function r8mat_hess_test ( )

%*****************************************************************************80
%
%% R8MAT_HESS_TEST tests R8MAT_HESS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  x = [ 1.0, 2.0, 3.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_HESS_TEST\n' );
  fprintf ( 1, '  R8MAT_HESS estimates the Hessian matrix\n' );
  fprintf ( 1, '  of a scalar function.\n' );

  h = r8mat_hess ( @r8mat_hess_f, n, x );

  r8mat_print ( n, n, h, '  Estimated Hessian:' );

  h = r8mat_hess_exact ( n, x );

  r8mat_print ( n, n, h, '  Exact Hessian:' );

  return
end
