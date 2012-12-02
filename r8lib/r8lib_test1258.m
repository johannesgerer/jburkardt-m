function r8lib_test1258 ( )

%*****************************************************************************80
%
%% TEST1258 tests R8VEC_LINSPACE and R8VEC_MIDSPACE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2012
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1258\n' );
  fprintf ( 1, '  For a R8VEC:\n' );
  fprintf ( 1, '  R8VEC_LINSPACE: evenly spaced points between A and B;\n' );
  fprintf ( 1, '  R8VEC_MIDSPACE: evenly spaced midpoints between A and B\n' );

  a = 10.0;
  b = 20.0;

  x = r8vec_linspace ( n, a, b );
  r8vec_print ( n, x, '  r8vec_linspace ( 5, 10, 20 )' );

  x = r8vec_midspace ( n, a, b );
  r8vec_print ( n, x, '  r8vec_midspace ( 5, 10, 20 )' );

  return
end
