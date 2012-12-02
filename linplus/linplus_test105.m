function linplus_test105 ( )

%*****************************************************************************80
%
%% TEST105 tests R83P_INDICATOR.
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
  fprintf ( 1, 'TEST105\n' );
  fprintf ( 1, '  R83P_INDICATOR sets up an R83P indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %n\d', n );
%
%  Set the matrix.
%
  a = r83p_indicator ( n );

  r83p_print ( n, a, '  The R83P indicator matrix:' );

  return
end
