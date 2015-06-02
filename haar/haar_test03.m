function haar_test03 ( )

%*****************************************************************************80
%
%% HAAR_TEST03 tests HAAR_2D and HAAR_2D_INVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HAAR_TEST03\n' );
  fprintf ( 1, '  HAAR_2D computes the Haar transform of an array.\n' );
  fprintf ( 1, '  HAAR_2D_INVERSE inverts the transform.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Apply this to a 128x128 matrix of 0 and 1 values\n' );
  fprintf ( 1, '  which is actually a bit map of the Sierpinski triangle.\n' );
%
%  Load data from a file.
%
  u = load ( 'sierpinski.txt' );

  [ m, n ] = size ( u );
%
%  Demonstrate successful inversion.
%
  r8mat_print_some ( m, n, u, 1, 1, 10, 10, '  Input array U:' );

  v = haar_2d ( u );

  r8mat_print_some ( m, n, v, 1, 1, 10, 10, '  Transformed array V:' );

  w = haar_2d_inverse ( v );

  r8mat_print_some ( m, n, w, 1, 1, 10, 10, '  Recovered array W:' );

  return
end
