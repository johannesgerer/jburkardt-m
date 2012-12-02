function linplus_test157 ( )

%*****************************************************************************80
%
%% TEST157 tests R8CB_INDICATOR.
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
  ml = 2;
  mu = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST157\n' );
  fprintf ( 1, '  For a compact band matrix:\n' );
  fprintf ( 1, '  R8CB_INDICATOR computes the indicator matrix;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M      = %d\n', m );
  fprintf ( 1, '  Matrix columns N   = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );

  a = r8cb_indicator ( m, n, ml, mu );

  r8cb_print ( m, n, ml, mu, a, '  The R8CB indicator matrix:' );

  return
end
