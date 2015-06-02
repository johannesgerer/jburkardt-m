function r8mat_sub_test ( )

%*****************************************************************************80
%
%% R8MAT_SUB_TEST tests R8MAT_SUB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2015
%
%  Author:
%
%    John Burkardt
%
  m = 4;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_SUB_TEST\n' );
  fprintf ( 1, '  R8MAT_SUB computes C = A - B for R8MAT''s.\n' );

  a = r8mat_indicator ( m, n );

  b = a';

  c = r8mat_sub ( m, n, a, b );

  r8mat_print ( m, n, a, '  A:' );
  r8mat_print ( m, n, b, '  B:' );
  r8mat_print ( m, n, c, '  C = A-B:' );

  return
end
