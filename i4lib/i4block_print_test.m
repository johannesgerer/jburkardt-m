function i4block_print_test ( )

%*****************************************************************************80
%
%% I4BLOCK_PRINT_TEST tests I4BLOCK_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2012
%
%  Author:
%
%    John Burkardt
%
  l = 4;
  m = 3;
  n = 2;
  xvec = [ ...
        1,  2,  3,   4,  1, ...
        4,  9, 16,   1,  8, ...
       27, 64,  2,   4,  6, ...
        8,  2,  8,  18, 32, ...
        2, 16, 54, 128 ];

  x = reshape ( xvec, l, m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4BLOCK_PRINT_TEST\n' );
  fprintf ( 1, '  I4BLOCK_PRINT prints an I4BLOCK.\n' );

  i4block_print ( l, m, n, x, '  The 3D array:' )

  return
end
