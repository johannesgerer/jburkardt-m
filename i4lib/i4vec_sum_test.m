function i4vec_sum_test ( )

%*****************************************************************************80
%
%% I4VEC_SUM_TEST tests I4VEC_SUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2014
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_SUM_TEST\n' );
  fprintf ( 1, '  I4VEC_SUM sums the entries of an I4VEC.\n' );

  lo = 0;
  hi = 10;
  seed = 123456789;

  [ a, seed ] = i4vec_uniform_ab ( n, lo, hi, seed );
  i4vec_print ( n, a, '  The vector:' );

  s = i4vec_sum ( n, a );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The vector entries sum to %d\n', s );

  return
end
