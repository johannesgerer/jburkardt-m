function r8poly_print_test ( )

%*****************************************************************************80
%
%% R8POLY_PRINT_TEST tests R8POLY_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2015
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  c = [ 12.0, -3.4, 56.0, 0.0, 0.78, 9.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8POLY_PRINT_TEST\n' );
  fprintf ( 1, '  R8POLY_PRINT prints an R8POLY.\n' );

  r8poly_print ( m, c, '  The R8POLY:' )

  return
end
