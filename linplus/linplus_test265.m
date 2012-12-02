function linplus_test265 ( )

%*****************************************************************************80
%
%% TEST265 tests R8GB_TO_R8GE, R8GE_TO_R8GB.
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
  m = 5;
  n = 8;
  ml = 2;
  mu = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST265\n' );
  fprintf ( 1, '  R8GB_TO_R8GE copies a R8GB matrix to a R8GE matrix.\n' );
  fprintf ( 1, '  R8GE_TO_R8GB copies a R8GE matrix to a R8GB matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =      %d\n', m );
  fprintf ( 1, '  Matrix columns N =   %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );

  a = r8gb_indicator ( m, n, ml, mu );

  r8gb_print ( m, n, ml, mu, a, '  The R8GB matrix:' );

  b = r8gb_to_r8ge ( m, n, ml, mu, a );

  r8ge_print ( m, n, b, '  The R8GE matrix:' );

  c = r8ge_to_r8gb ( m, n, ml, mu, b );

  r8gb_print ( m, n, ml, mu, c, '  The recovered R8GB matrix:' );

  return
end
