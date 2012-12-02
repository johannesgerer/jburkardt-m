function subpak_test058 ( )

%*****************************************************************************80
%
%% TEST058 tests R8MAT_HESS.
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
  fprintf ( 1, 'TEST058\n' );
  fprintf ( 1, '  R8MAT_HESS estimates the Hessian matrix\n' );
  fprintf ( 1, '    of a scalar function.\n' );

  h = r8mat_hess ( @r8lib_test058_f, n, x );

  r8mat_print ( n, n, h, '  Estimated jacobian:' );

  h = r8lib_test058_hess ( n, x );

  r8mat_print ( n, n, h, '  Exact jacobian:' );

  return
end
