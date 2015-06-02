function r8vec_convolution_circ_test ( )

%*****************************************************************************80
%
%% R8VEC_CONVOLUTION_CIRC_TEST tests R8VEC_CONVOLUTION_CIRC
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
  n = 4;

  x = [ 1.0, 2.0, 3.0, 4.0 ];
  y = [ 1.0, 2.0, 4.0, 8.0 ];
  z_correct = [ 37.0, 44.0, 43.0, 26.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_CONVOLUTION_CIRC_TEST\n' );
  fprintf ( 1, '  R8VEC_CONVOLUTION_CIRC computes the circular convolution\n' );
  fprintf ( 1, '  of two vectors.\n' );

  r8vec_print ( n, x, '  The factor X:' );
  r8vec_print ( n, y, '  The factor Y:' );

  z = r8vec_convolution_circ ( n, x, y );

  r8vec_print ( n, z, '  The circular convolution z = xCCy:' );

  r8vec_print ( n, z_correct, '  Correct answer:' );

  return
end
