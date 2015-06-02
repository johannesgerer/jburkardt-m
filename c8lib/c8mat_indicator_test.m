function c8mat_indicator_test ( )

%*****************************************************************************80
%
%% C8MAT_INDICATOR_TEST tests C8MAT_INDICATOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2015
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8MAT_INDICATOR_TEST\n' );
  fprintf ( 1, '  C8MAT_INDICATOR returns the complex indicator matrix.\n' );

  a = c8mat_indicator ( m, n );

  c8mat_print ( m, n, a, '  The indicator matrix:' );

  return
end
