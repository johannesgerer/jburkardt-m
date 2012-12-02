function linplus_test25 ( )

%*****************************************************************************80
%
%% TEST25 tests R8GB_PRINT.
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
  m = 8;
  n = 10;
  ml = 1;
  mu = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST25\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  R8GB_PRINT prints the matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =      %d\n', m );
  fprintf ( 1, '  Matrix columns N =   %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );

  a = r8gb_indicator ( m, n, ml, mu );

  r8gb_print ( m, n, ml, mu, a, '  The R8GB matrix:' );

  return
end
