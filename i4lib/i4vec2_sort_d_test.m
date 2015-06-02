function i4vec2_sort_d_test (  )

%*****************************************************************************80
%
%% I4VEC2_SORT_D_TEST tests I4VEC2_SORT_D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC2_SORT_D_TEST\n' );
  fprintf ( 1, '  For a pair of integer vectors:\n' );
  fprintf ( 1, '  I4VEC2_SORT_D descending sorts;\n' );

  b = 1;
  c = 3;

  [ v1, seed ] = i4vec_uniform_ab ( n, b, c, seed );
  [ v2, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  v1(3) = v1(1);
  v2(3) = v2(1);

  v1(5) = v1(2);
  v2(5) = v2(2);

  v1(9) = v1(1);
  v2(9) = v2(1);

  i4vec2_print ( n, v1, v2, '  The array:' );

  [ v1, v2 ] = i4vec2_sort_d ( n, v1, v2 );

  i4vec2_print ( n, v1, v2, '  After descending sort:' );

  return
end
