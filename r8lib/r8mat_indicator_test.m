function r8mat_indicator_test ( )

%*****************************************************************************80
%
%% R8MAT_INDICATOR_TEST tests R8MAT_INDICATOR_TEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_INDICATOR_TEST\n' );
  fprintf ( 1, '  R8MAT_INDICATOR returns an indicator matrix.\n' );

  a = r8mat_indicator ( m, n );

  r8mat_print ( m, n, a, '  Indicator matrix:' );

  return
end
