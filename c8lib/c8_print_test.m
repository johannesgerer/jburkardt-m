function c8_print_test ( )

%*****************************************************************************80
%
%% C8_PRINT_TEST tests C8_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_PRINT_TEST\n' );
  fprintf ( 1, '  C8_PRINT prints a C8.\n' );
  fprintf ( 1, '\n' );

  c1 = 0.0 + 0.0 * i;
  c2 = 1.0 + 0.0 * i;
  c3 = 3.141592653589793 + 0.0 * i;
  c4 =  0.0 + 1.0 * i;
  c5 = 1.0 + 2.0 * i;
  c6 = -12.34 + 56.78 * i;
  c7 = 0.001 + 0.000002 * i;
  c8 = 3.0E+08 - 4.5E+09 * i;

  c8_print ( c1, '  Zero:' );
  c8_print ( c2, '  One:' );
  c8_print ( c3, '  Pi:' );
  c8_print ( c4, '  i:' );
  c8_print ( c5, '  1+2i:' );
  c8_print ( c6, ' -12.34 + 56.78i:' );
  c8_print ( c7, '  1E-3 + 2E-6i' );
  c8_print ( c8, '  3E8 - 4.5E9i:' );

  return
end
