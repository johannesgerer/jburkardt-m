function linplus_test151 ( )

%*****************************************************************************80
%
%% TEST151 tests R8BB_INDICATOR.
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
  n1 = 6;
  n2 = 2;
  n = n1 + n2;
  ml = 1;
  mu = 1;
  na = ( 2 * ml + mu + 1 ) * n1 + 2 * n1 * n2 + n2 * n2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST151\n' );
  fprintf ( 1, '  R8BB_INDICATOR sets up an indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N     = %d\n', n );
  fprintf ( 1, '  Matrix suborder N1 = %d\n', n1 );
  fprintf ( 1, '  Matrix suborder N2 = %d\n', n2 );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
%
%  Set the matrix.
%
  a = r8bb_indicator ( n1, n2, ml, mu );

  r8bb_print ( n1, n2, ml, mu, a, '  The indicator matrix:' );

  return
end
