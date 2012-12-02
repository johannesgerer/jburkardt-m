function linplus_test275 ( )

%*****************************************************************************80
%
%% TEST275 tests R8GD_INDICATOR.
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
  ndiag = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST275\n' );
  fprintf ( 1, '  For a general diagonal matrix:\n' );
  fprintf ( 1, '  R8GD_INDICATOR sets up an indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N            = %d\n', n );
  fprintf ( 1, '  Number of diagonals NDIAG = %d\n', ndiag );
%
%  Set the matrix.
%
  offset = [ -2, 0, 1, n - 1 ];

  i4vec_print ( ndiag, offset, '  The offset vector:' );

  a = r8gd_indicator ( n, ndiag, offset );

  r8gd_print ( n, ndiag, offset, a, '  The general diagonal matrix:' );

  return
end
