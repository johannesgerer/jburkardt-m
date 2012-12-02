function linplus_test193 ( )

%*****************************************************************************80
%
%% TEST193 tests R8CBB_INDICATOR.
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
  n1 = 8;
  n2 = 2;
  n = n1 + n2;
  ml = 1;
  mu = 1;
  na = ( ml + mu + 1 ) * n1 + 2 * n1 * n2 + n2 * n2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST193\n' );
  fprintf ( 1, '  For a compressed border banded matrix:\n' );
  fprintf ( 1, '  R8CBB_INDICATOR sets an indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N     = %d\n', n );
  fprintf ( 1, '  Matrix suborder N1 = %d\n', n1 );
  fprintf ( 1, '  Matrix suborder N2 = %d\n', n2 );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );

  a = r8cbb_indicator ( n1, n2, ml, mu );

  r8cbb_print ( n1, n2, ml, mu, a, '  The compact border-banded matrix:' );

  return
end
