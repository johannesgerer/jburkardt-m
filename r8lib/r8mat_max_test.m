function r8mat_max_test ( )

%*****************************************************************************80
%
%% R8MAT_MAX_TEST tests R8MAT_MAX.
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
  m = 5;
  n = 3;

  b = 0.0;
  c = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_MAX_TEST\n' );
  fprintf ( 1, '  For a real matrix,\n' );
  fprintf ( 1, '  R8MAT_MAX computes the maximum value;\n' );
 
  seed = 123456789;

  [ a, seed ] = r8mat_uniform_ab ( m, n, b, c, seed );
 
  r8mat_print ( m, n, a, '  Random array:' );
 
  temp = r8mat_max ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum value = %f\n', temp );

  return
end
