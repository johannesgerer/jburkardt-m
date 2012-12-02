function i4lib_test50 ( )

%*****************************************************************************80
%
%% TEST50 tests I4VEC_CUM and I4VEC_CUM0.
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
  fprintf ( 1, 'TEST50\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_CUM:  cumulative sum;\n' );
  fprintf ( 1, '  I4VEC_CUM0: cumulative sum (zero based);\n' );

  seed = 123456789;
  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );

  a_cum = i4vec_cum ( n, a );

  i4vec_print ( n, a_cum, '  Cumulative sums:' );

  a_cum0 = i4vec_cum ( n, a );

  i4vec_print ( n + 1, a_cum0, '  0-based cumulative sums:' );

  return
end
