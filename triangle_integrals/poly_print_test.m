function poly_print_test ( )

%*****************************************************************************80
%
%% POLY_PRINT_TEST tests POLY_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLY_PRINT_TEST:\n' );
  fprintf ( 1, '  POLY_PRINT can print a D-degree polynomial in X and Y.\n' );
%
%  P = 12.34
%
  d = 0;
  p = [ 12.34 ];
  fprintf ( 1, '\n' );
  poly_print ( d, p, '  p1(x,y)' );
%
%  P = 1.0 + 2.0 * x + 3.0 * Y
%
  d = 1;
  p = [ 1.0, 2.0, 3.0 ];
  fprintf ( 1, '\n' );
  poly_print ( d, p, '  p2(x,y)' );
%
%  P = XY
%
  d = 2;
  p = [ 0.0, 0.0, 0.0, 0.0, 1.0, 0.0 ];
  fprintf ( 1, '\n' );
  poly_print ( d, p, '  p3(x,y) = xy' );
%
%  P = 1 - 2.1 * x + 3.2 * y - 4.3 * x^2 + 5.4 * xy - 6.5 * y^2
%    + 7.6 * x^3 - 8.7 * x^2y + 9.8 * xy^2 - 10.9 * y^3.
%
  d = 3;
  p = [ 1.0, -2.1, +3.2, -4.3, +5.4, -6.5, +7.6, -8.7, +9.8, -10.9 ];
  fprintf ( 1, '\n' );
  poly_print ( d, p, '  p4(x,y)' );

  return
end
