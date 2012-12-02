function r8lib_test158 ( )

%*****************************************************************************80
%
%% R8LIB_TEST158 tests R8VECS_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2012
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  na = 15;

  a = [ ...
    11.0, 12.0, 13.0, ...
    21.0, 22.0, ...
    31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, ...
    41.0, 42.0, ...
    51.0 ];

  nvec = [ 1, 4, 6, 13, 15, 16 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST158\n' );
  fprintf ( 1, '  R8VECS_PRINT prints a packed R8VEC.\n' );

  r8vecs_print ( m, nvec, na, a, '  Packed R8VEC:' );

  return
end

