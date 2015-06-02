function r8mat_norm_l1_test ( )

%*****************************************************************************80
%
%% R8MAT_NORM_L1_TEST tests R8MAT_NORM_L1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_NORM_L1_TEST\n' );
  fprintf ( 1, '  R8MAT_NORM_L1 computes the L1 norm of an R8MAT;\n' );

  m = 5;
  n = 4;
  x1 = -5.0;
  x2 = +5.0;
  seed = 123456789;
  [ a, seed ] = r8mat_uniform_ab ( m, n, x1, x2, seed );
  a = r8mat_nint ( m, n, a );

  r8mat_print ( m, n, a, '  A:' );

  t = r8mat_norm_l1 ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed L1 norm = %g\n', t );

  return
end