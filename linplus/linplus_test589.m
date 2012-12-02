function linplus_test589 ( )

%*****************************************************************************80
%
%% TEST589 tests R8TO_INDICATOR.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST589\n' );
  fprintf ( 1, '  R8TO_INDICATOR sets up a R8TO indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  a = r8to_indicator ( n );

  r8to_print ( n, a, '  The R8TO indicator matrix:' );

  return
end
