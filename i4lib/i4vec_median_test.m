function i4vec_median_test ( )

%*****************************************************************************80
%
%% I4VEC_MEDIAN_TEST tests I4VEC_MEDIAN;
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
  fprintf ( 1, 'I4VEC_MEDIAN_TEST\n' );
  fprintf ( 1, '  For an I4VEC:\n' );
  fprintf ( 1, '  I4VEC_MEDIAN:  median value;\n' );
 
  seed = 123456789;
  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );
 
  i4vec_print ( n, a, '  Input vector:' );

  median = i4vec_median ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Median: %d\n', median );

  return
end
