function polynomial_print_test ( )

%*****************************************************************************80
%
%% POLYNOMIAL_PRINT_TEST tests POLYNOMIAL_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYNOMIAL_PRINT_TEST\n' );
  fprintf ( 1, '  POLYNOMIAL_PRINT prints a polynomial.\n' );

  m = 3;
  o = 6;
  c = [ 7.0, - 5.0, 9.0, 11.0, 0.0, - 13.0 ];
  e = [ 1, 2, 4, 5, 12, 33 ];
  title = '  P1(X) =';

  fprintf ( 1, '\n' );
  polynomial_print ( m, o, c, e, title );

  return
end

