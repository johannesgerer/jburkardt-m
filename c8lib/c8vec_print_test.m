function c8vec_print_test ( )

%*****************************************************************************80
%
%% C8VEC_PRINT_TEST tests C8VEC_PRINT;
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
  fprintf ( 1, 'C8VEC_PRINT_TEST\n' );
  fprintf ( 1, '  C8VEC_PRINT prints a C8VEC\n' );

  a = c8vec_indicator ( n );
 
  c8vec_print ( n, a, '  The "indicator" vector:' );

  return
end
