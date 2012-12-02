function i4lib_test63 ( )

%*****************************************************************************80
%
%% TEST63 tests I4VEC_MEAN and I4VEC_MEDIAN;
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
  fprintf ( 1, 'TEST63\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_MEAN:    mean value;\n' );
  fprintf ( 1, '  I4VEC_MEDIAN:  median value;\n' );
 
  seed = 123456789;
  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );
 
  i4vec_print ( n, a, '  Input vector:' );

  mean = i4vec_mean ( n, a );
  median = i4vec_median ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Mean:   %f\n', mean );
  fprintf ( 1, '  Median: %d\n', median );

  return
end
