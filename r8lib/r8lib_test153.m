function r8lib_test153 ( )

%*****************************************************************************80
%
%% R8LIB_TEST153 tests R8VEC2_SORT_A and R8VEC2_SORT_D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST153\n' );
  fprintf ( 1, '  For a pair of R8VEC''s:\n' );
  fprintf ( 1, '  R8VEC2_SORT_A ascending sorts;\n' );
  fprintf ( 1, '  R8VEC2_SORT_D descending sorts;\n' );

  b = 1.0;
  c = 3.0;
  seed = 123456789;

  [ a1, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  b = 5.0;
  c = 10.0;

  [ a2, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  a1(3) = a1(1);
  a2(3) = a2(1);

  a1(6) = a1(2);
  a2(6) = a2(2);

  a1(9) = a1(1);
  a2(9) = a2(1);

  r8vec2_print ( n, a1, a2, '  The pair of arrays:' );

  [ a1, a2 ] = r8vec2_sort_a ( n, a1, a2 );

  r8vec2_print ( n, a1, a2, '  Arrays after ascending sort:' );

  [ a1, a2 ] = r8vec2_sort_d ( n, a1, a2 );

  r8vec2_print ( n, a1, a2, '  Arrays after descending sort:' );

  return
end
