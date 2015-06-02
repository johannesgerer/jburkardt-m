function c8mat_norm_li_test ( )

%*****************************************************************************80
%
%% C8MAT_NORM_LI_TEST tests C8MAT_NORM_LI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2015
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8MAT_NORM_LI_TEST\n' );
  fprintf ( 1, '  C8MAT_NORM_LI returns the Loo norm of a C8MAT.\n' );

  a = c8mat_indicator ( m, n );

  c8mat_print ( m, n, a, '  The indicator matrix:' );

  value = c8mat_norm_li ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Loo norm = %g\n', value );

  return
end
