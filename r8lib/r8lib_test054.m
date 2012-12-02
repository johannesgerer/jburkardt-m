function subpak_test054 ( )

%*****************************************************************************80
%
%% TEST054 tests R8MAT_EXPAND_LINEAR.
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
  m = 4;
  n = 3;
  mfat = 2;
  nfat = 1;
  m2 = ( m - 1 ) * ( mfat + 1 ) + 1;
  n2 = ( n - 1 ) * ( nfat + 1 ) + 1;
%
%  Each row of this definition is a COLUMN of the matrix.
%
  x = [ ...
    1.0, 2.0,  3.0,  4.0; ...
    1.0, 4.0,  9.0, 16.0; ...
    1.0, 8.0, 27.0, 64.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST054\n' );
  fprintf ( 1, '  R8MAT_EXPAND_LINEAR linearly interpolates new data\n' );
  fprintf ( 1, '    between old values in a matrix.\n' );

  r8mat_print ( m, n, x, '  Original matrix:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MFAT = %d\n', mfat );
  fprintf ( 1, '  NFAT = %d\n', nfat );

  xfat = r8mat_expand_linear ( m, n, x, mfat, nfat );

  r8mat_print ( m2, n2, xfat, '  Fattened matrix:' );

  return
end
