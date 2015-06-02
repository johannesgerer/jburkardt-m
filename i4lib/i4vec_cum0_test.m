function i4vec_cum0_test ( )

%*****************************************************************************80
%
%% I4VEC_CUM0_TEST tests I4VEC_CUM0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 December 2010
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_CUM0_TEST\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_CUM0: cumulative sum (zero based);\n' );

  seed = 123456789;
  b = 0;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );

  a_cum0 = i4vec_cum0 ( n, a );

  i4vec_print ( n + 1, a_cum0, '  0-based cumulative sums:' );

  return
end
