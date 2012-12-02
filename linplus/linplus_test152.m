function linplus_test152 ( )

%*****************************************************************************80
%
%% TEST152 tests R8BLT_INDICATOR.
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
  n = 6;
  ml = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST152\n' );
  fprintf ( 1, '  R8BLT_INDICATOR sets up a R8BLT indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N     = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
%
%  Set the matrix.
%
  a = r8blt_indicator ( n, ml );

  r8blt_print ( n, ml, a, '  The indicator matrix:' );

  return
end
