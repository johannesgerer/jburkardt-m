function i4mat_min_test ( )

%*****************************************************************************80
%
%% I4MAT_MIN_TEST tests I4MAT_MIN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 7;
  b = 0;
  c = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4MAT_MIN_TEST\n' );
  fprintf ( 1, '  I4MAT_MIN returns the minimum;\n' );
 
  seed = 123456789;

  [ a, seed ] = i4mat_uniform_ab ( m, n, b, c, seed );
 
  i4mat_print ( m, n, a, '  Random array:' );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Minimum entry = %d', i4mat_min ( m, n, a ) );

  return
end
