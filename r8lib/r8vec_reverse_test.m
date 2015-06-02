function r8vec_reverse_test ( )

%*****************************************************************************80
%
%% R8VEC_REVERSE_TEST tests R8VEC_REVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2014
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_REVERSE_TEST\n' );
  fprintf ( 1, '  R8VEC_REVERSE reverses an R8VEC.\n' );
 
  a = r8vec_indicator1 ( n );
 
  r8vec_print ( n, a, '  Original array:' );

  a = r8vec_reverse ( n, a );

  r8vec_print ( n, a, '  Reversed array:' );
 
  return
end
