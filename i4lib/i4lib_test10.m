function i4lib_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests I4_HUGE_NORMALIZER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  i4 = i4_huge ( );
  r8 = i4_huge_normalizer ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  I4_HUGE_NORMALIZER returns 1/(I4_HUGE+1).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I4_HUGE() = %d\n', i4 );
  fprintf ( 1, '  I4_HUGE_NORMALIZER() = %e\n', r8 );

  value = i4 * r8;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I4_HUGE * I4_HUGE_NORMALIZER = %e\n', value );

  return
end
