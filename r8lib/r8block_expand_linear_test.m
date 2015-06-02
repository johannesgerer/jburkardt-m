function r8block_expand_linear_test ( )

%*****************************************************************************80
%
%% R8BLOCK_EXPAND_LINEAR_TEST tests R8BLOCK_EXPAND_LINEAR.
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
  l = 4;
  m = 3;
  n = 2;
  lfat = 1;
  mfat = 2;
  nfat = 1;
  l2 = ( l - 1 ) * ( lfat + 1 ) + 1;
  m2 = ( m - 1 ) * ( mfat + 1 ) + 1;
  n2 = ( n - 1 ) * ( nfat + 1 ) + 1;
  x = reshape ( [ ...
        1.0,  2.0,  3.0,   4.0,  1.0, ...
        4.0,  9.0, 16.0,   1.0,  8.0, ...
       27.0, 64.0,  2.0,   4.0,  6.0, ...
        8.0,  2.0,  8.0,  18.0, 32.0, ...
        2.0, 16.0, 54.0, 128.0 ], [ l, m, n ] );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8BLOCK_EXPAND_LINEAR_TEST\n' );
  fprintf ( 1, '  R8BLOCK_EXPAND_LINEAR linearly interpolates new data\n' );
  fprintf ( 1, '  between old values in a 3D block.\n' );

  r8block_print ( l, m, n, x, '  Original block:' )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LFAT = %d\n', lfat );
  fprintf ( 1, '  MFAT = %d\n', mfat );
  fprintf ( 1, '  NFAT = %d\n', nfat );

  xfat = r8block_expand_linear ( l, m, n, x, lfat, mfat, nfat );

  r8block_print ( l2, m2, n2, xfat, '  Fattened block:' );

  return
end
