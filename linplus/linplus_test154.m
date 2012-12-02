function linplus_test154 ( )

%*****************************************************************************80
%
%% TEST154 tests R8BTO_INDICATOR.
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
  l = 3;
  m = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST154\n' );
  fprintf ( 1, '  For a real block Toeplitz matrix,\n' );
  fprintf ( 1, '  R8BTO_INDICATOR sets up an indicator matrix\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Block order M =  %d\n', m );
  fprintf ( 1, '  Block number L = %d\n', l );
  fprintf ( 1, '  Matrix order N = %d\n', m * l );

  a = r8bto_indicator ( m, l );

  r8bto_print ( m, l, a, '  The block Toeplitz matrix:' );

  return
end
