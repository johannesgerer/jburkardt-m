function linplus_test605 ( )

%*****************************************************************************80
%
%% TEST605 tests R8UT_INDICATOR.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST605\n' );
  fprintf ( 1, '  For an upper triangular matrix,\n' );
  fprintf ( 1, '  R8UT_INDICATOR sets up an indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );

  a = r8ut_indicator ( m, n );

  r8ut_print ( m, n, a, '  The R8UT indicator matrix:' );

  return
end
