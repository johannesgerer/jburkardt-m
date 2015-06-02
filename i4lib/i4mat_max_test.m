function i4mat_max_test ( )

%*****************************************************************************80
%
%% I4MAT_MAX_TEST tests I4MAT_MAX.
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
  fprintf ( 1, 'I4MAT_MAX_TEST\n' );
  fprintf ( 1, '  I4MAT_MAX returns the maximum;\n' );
 
  seed = 123456789;

  [ a, seed ] = i4mat_uniform_ab ( m, n, b, c, seed );
 
  i4mat_print ( m, n, a, '  Random array:' );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum entry = %d', i4mat_max ( m, n, a ) );

  return
end
