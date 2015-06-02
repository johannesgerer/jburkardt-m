function r8mat_nint_test ( )

%*****************************************************************************80
%
%% R8MAT_NINT_TEST tests R8MAT_NINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_NINT_TEST\n' );
  fprintf ( 1, '  R8MAT_NINT rounds an R8MAT.\n' );

  x1 = -5.0;
  x2 = +5.0;
  seed = 123456789;
  [ a, seed ] = r8mat_uniform_ab ( m, n, x1, x2, seed );
  r8mat_print ( m, n, a, '  Matrix A:' );
  a = r8mat_nint ( m, n, a );
  r8mat_print ( m, n, a, '  Rounded matrix A:' );

  return
end
