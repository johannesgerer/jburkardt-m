function r8lib_test128 ( )

%*****************************************************************************80
%
%% TEST128 tests R8VEC_MEAN and R8VEC_MEDIAN;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST128\n' );
  fprintf ( 1, '  For an R8VEC\n' );
  fprintf ( 1, '  R8VEC_MEAN:      mean value;\n' );
  fprintf ( 1, '  R8VEC_MEDIAN:    median value;\n' );
 
  b = -n;
  c = n;

  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  r8vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );

  mean = r8vec_mean ( n, a );
  fprintf ( 1, '  Mean:   %f\n', mean );
  median = r8vec_median ( n, a );
  fprintf ( 1, '  Median: %f\n', median );

  return
end
