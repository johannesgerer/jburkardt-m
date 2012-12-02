function linplus_test235 ( )

%*****************************************************************************80
%
%% TEST235 tests R8GB_INDICATOR.
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
  m = 10;
  n = 8;
  ml = 3;
  mu = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST235\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  R8GB_INDICATOR computes the indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M       = %d\n', m );
  fprintf ( 1, '  Matrix columns N    = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML  = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU  = %d\n', mu );

  a = r8gb_indicator ( m, n, ml, mu );

  r8ge_print ( 2*ml+mu+1, n, a, '  The banded matrix in R8GE format:' );

  r8gb_print ( m, n, ml, mu, a, '  The R8GB indicator matrix:' );

  return
end
