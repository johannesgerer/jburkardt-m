function linplus_test423 ( )

%*****************************************************************************80
%
%% TEST423 tests R8CC_INDICATOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 5;
  nz_num = 12;
  colptr = [ 1, 4, 6, 8, 10, 13 ];
  rowind = [ 1, 2, 4, 1, 2, 3, 5, 4, 5, 1, 2, 5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST423\n' );
  fprintf ( 1, '  R8CC_INDICATOR sets up the indicator matrix;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =          %d\n', m );
  fprintf ( 1, '  Matrix columns N =       %d\n', n );
  fprintf ( 1, '  Matrix nonzeros NZ_NUM = %d\n', nz_num );

  a = r8cc_indicator ( m, n, nz_num, colptr, rowind );

  r8cc_print ( m, n, nz_num, colptr, rowind, a, '  The R8CC indicator matrix:' );

  return
end
