function linplus_test581 ( )

%*****************************************************************************80
%
%% TEST581 tests R8STO_INDICATOR.
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
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST581\n' );
  fprintf ( 1, '  R8STO_INDICATOR sets up a R8STO indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  a = r8sto_indicator ( n );

  r8sto_print ( n, a, '  The R8STO indicator matrix:' );

  return
end
