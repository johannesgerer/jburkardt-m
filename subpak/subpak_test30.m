function subpak_test30 ( )

%*****************************************************************************80
%
%% TEST30 tests ROOTS_TO_R8POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST30\n' );
  fprintf ( 1, '  ROOTS_TO_R8POLY computes the coefficients of\n' );
  fprintf ( 1, '  a polynomial from its roots.\n' );
  fprintf ( 1, '  R8POLY_PRINT prints a polynomial.\n' );

  x = r8vec_indicator ( n );

  r8vec_print ( n, x, '  Roots:' );

  c = roots_to_r8poly ( n, x );

  r8poly_print ( n, c, '  The polynomial' );

  return
end
