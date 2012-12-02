function r8lib_test1147 ( )

%*****************************************************************************80
%
%% R8LIB_TEST1147 tests R8VEC_CONVOLUTION.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2012
%
%  Author:
%
%    John Burkardt
%
  m = 4;
  n = 3;

  x = [ 1.0, 2.0, 3.0, 4.0 ]';
  y = [ -1.0, 5.0, 3.0 ]';
  z_correct = [ -1.0, 3.0, 10.0, 17.0, 29.0, 12.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST1147\n' );
  fprintf ( 1, '  R8VEC_CONVOLUTION computes the convolution\n' );
  fprintf ( 1, '  of two vectors.\n' );

  r8vec_print ( m, x, '  The factor X:' );
  r8vec_print ( n, y, '  The factor Y:' );

  z = r8vec_convolution ( m, x, n, y );

  r8vec_print ( m + n - 1, z, '  The circular convolution z = x star y:' );

  r8vec_print ( m + n - 1, z_correct, '  Correct answer:' );

  return
end
