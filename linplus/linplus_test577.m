function linplus_test577 ( )

%*****************************************************************************80
%
%% TEST577 tests R8SS_INDICATOR.
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
  n = 9;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST577\n' );
  fprintf ( 1, '  For a symmetric skyline storage matrix,\n' );
  fprintf ( 1, '  R8SS_INDICATOR computes an indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  [ na, diag, a ] = r8ss_indicator ( n );

  r8ss_print ( n, na, diag, a, '  The R8SS indicator matrix:' );

  return
end
