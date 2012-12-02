function r8lib_test157 ( )

%*****************************************************************************80
%
%% R8LIB_TEST157 tests R8VEC2_SUM_MAX_INDEX.
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
  fprintf ( 1, 'R8LIB_TEST157\n' );
  fprintf ( 1, '  For a pair of R8VEC''s:\n' );
  fprintf ( 1, '  R8VEC2_SUM_MAX_INDEX: index of the sum vector\n' );
  fprintf ( 1, '  with maximum value.\n' );

  b = 0.0;
  c = 10.0;
  seed = 123456789;

  [ a1, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  b = 0.0;
  c = 5.0;

  [ a2, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  r8vec2_print ( n, a1, a2, '  The pair of vectors:' );

  ival = r8vec2_sum_max_index ( n, a1, a2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index of maximum in A+B: %d\n', ival );

  return
end
