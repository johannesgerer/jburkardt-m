function linplus_test555 ( )

%*****************************************************************************80
%
%% TEST555 tests R8SD_INDICATOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  ndiag = 3;
  offset = [ 0, 1, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST555\n' );
  fprintf ( 1, '  R8SD_INDICATOR sets up a R8SD indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N =         %d\n', n );
  fprintf ( 1, '  Matrix diagonals NDIAG = %d\n', ndiag );

  a = r8sd_indicator ( n, ndiag, offset );

  r8sd_print ( n, ndiag, offset, a, '  The R8SD indicator matrix:' );

  return
end
