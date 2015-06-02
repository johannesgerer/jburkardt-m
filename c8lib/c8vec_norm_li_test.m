function c8vec_norm_li_test ( )

%*****************************************************************************80
%
%% C8VEC_NORM_LI_TEST tests C8VEC_NORM_LI;
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
  fprintf ( 1, 'C8VEC_NORM_LI_TEST\n' );
  fprintf ( 1, '  C8VEC_NORM_LI computes the Loo norm of a C8VEC.\n' );

  a = c8vec_indicator ( n );
 
  c8vec_print ( n, a, '  The "indicator" vector:' );

  value = c8vec_norm_li ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Loo norm = %g\n', value );

  return
end
