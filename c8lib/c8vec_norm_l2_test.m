function c8vec_norm_l2_test ( )

%*****************************************************************************80
%
%% C8VEC_NORM_L2_TEST tests C8VEC_NORM_L2;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2015
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8VEC_NORM_L2_TEST\n' );
  fprintf ( 1, '  C8VEC_NORM_L2 computes the L2 norm of a C8VEC.\n' );

  a = c8vec_indicator ( n );
 
  c8vec_print ( n, a, '  The "indicator" vector:' );

  value = c8vec_norm_l2 ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 norm = %g\n', value );

  return
end
