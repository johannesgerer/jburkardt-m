function r8vec_split_test ( )

%*****************************************************************************80
%
%% R8VEC_SPLIT_TEST tests R8VEC_SPLIT.
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
  n = 25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_SPLIT_TEST\n' );
  fprintf ( 1, '  R8VEC_SPLIT splits a vector into\n' );
  fprintf ( 1, '  entries less than and greater than a\n' );
  fprintf ( 1, '  splitting value.\n' );

  b = 0.0;
  c = 10.0;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  a(1:n) = round ( a(1:n) ) / 2.0;

  split = 0.5 * ( a(1) + a(n) );

  r8vec_print ( n, a, '  The array:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Splitting value is %f\n', split );

  [ a, isplit ] = r8vec_split ( n, a, split );
 
  r8vec_print ( n, a, '  The split array:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Array entries <= SPLIT up to index %d\n', isplit );

  return
end
