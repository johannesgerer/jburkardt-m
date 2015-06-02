function c8vec_spiral_test ( )

%*****************************************************************************80
%
%% C8VEC_SPIRAL_TEST tests C8VEC_SPIRAL;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 March 2015
%
%  Author:
%
%    John Burkardt
%
  n = 13;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8VEC_SPIRAL_TEST\n' );
  fprintf ( 1, '  C8VEC_SPIRAL returns N points on a spiral\n' );
  fprintf ( 1, '  which includes M complete turns.\n' );

  m = 1;
  c1 = 5.0 + 0.0 * i;
  c2 = 3.0 + 0.0 * i;

  c = c8vec_spiral ( n, m, c1, c2 );

  c8vec_print ( n, c, '  The spiral points:' );

  return
end
