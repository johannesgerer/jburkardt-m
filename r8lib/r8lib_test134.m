function r8lib_test134 ()

%*****************************************************************************80
%
%% TEST134 tests R8VEC_ROTATE.
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
  n = 5;

  a = [ 1.0, 2.0, 3.0, 4.0, 5.0 ];

  m = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST134\n' );
  fprintf ( 1, '  R8VEC_ROTATE rotates a DVEC in place.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rotate entries %d places to the right.\n', m );

  r8vec_print ( n, a, '  Original array:' );

  a = r8vec_rotate ( n, a, m );

  r8vec_print ( n, a, '  Rotated array:' );

  return
end
