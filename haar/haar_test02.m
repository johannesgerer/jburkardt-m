function haar_test02 ( )

%*****************************************************************************80
%
%% HAAR_TEST02 tests HAAR_2D and HAAR_2D_INVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HAAR_TEST02\n' );
  fprintf ( 1, '  HAAR_2D computes the Haar transform of an array.\n' );
  fprintf ( 1, '  HAAR_2D_INVERSE inverts the transform.\n' );
%
%  Demonstrate successful inversion.
%
  m = 16;
  n = 4;
  seed = 123456789;
  [ u, seed ] = r8mat_uniform_01 ( m, n, seed );

  r8mat_print ( m, n, u, '  Input array U:' );

  v = haar_2d ( u );

  r8mat_print ( m, n, v, '  Transformed array V:' );

  w = haar_2d_inverse ( v );

  r8mat_print ( m, n, w, '  Recovered array W:' );

  return
end
