function linplus_test571 ( )

%*****************************************************************************80
%
%% TEST571 tests R8SP_INDICATOR.
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
  m = 7;
  n = 5;
  nz_num = 10;
  col = [ 2, 5, 1, 5, 1, 2, 3, 4, 4, 1 ];
  row = [ 1, 1, 2, 2, 4, 4, 4, 5, 6, 7 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST571\n' );
  fprintf ( 1, '  R8SP_INDICATOR sets up a R8SP indicator matrix;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );
  fprintf ( 1, '  Matrix nonzeros =  %d\n', nz_num );

  a = r8sp_indicator ( m, n, nz_num, row, col );

  r8sp_print ( m, n, nz_num, row, col, a, '  The R8SP indicator matrix:' );

  return
end
