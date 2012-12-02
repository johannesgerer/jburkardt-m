function linplus_test517 ( )

%*****************************************************************************80
%
%% TEST517 tests R8PO_INDICATOR.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST517\n' );
  fprintf ( 1, '  R8PO_INDICATOR sets up a R8PO indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  a = r8po_indicator ( n );

  r8po_print ( n, a, '  The R8PO indicator matrix:' );

  return
end
