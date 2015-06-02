function r8block_print_test ( )

%*****************************************************************************80
%
%% R8BLOCK_PRINT_TEST tests R8BLOCK_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2012
%
%  Author:
%
%    John Burkardt
%
  l = 4;
  m = 3;
  n = 2;

  x = reshape ( [ ...
        1.0,  2.0,  3.0,   4.0,  1.0, ...
        4.0,  9.0, 16.0,   1.0,  8.0, ...
       27.0, 64.0,  2.0,   4.0,  6.0, ...
        8.0,  2.0,  8.0,  18.0, 32.0, ...
        2.0, 16.0, 54.0, 128.0 ], [ l, m, n ] );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8BLOCK_PRINT_TEST\n' );
  fprintf ( 1, '  R8BLOCK_PRINT prints an R8BLOCK.\n' );

  r8block_print ( l, m, n, x, '  The 3D array:' )

  return
end
