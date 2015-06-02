function polynomial_value_test ( )

%*****************************************************************************80
%
%% POLYNOMIAL_VALUE_TEST tests POLYNOMIAL_VALUE.
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
  fprintf ( 1, 'POLYNOMIAL_VALUE_TEST\n' );
  fprintf ( 1, '  POLYNOMIAL_VALUE evaluates a polynomial.\n' );

  m = 3;

  o = 6;
  c = [ 7.0, - 5.0, 9.0, 11.0, 0.0, - 13.0 ];
  e = [ 1, 2, 4, 5, 12, 33 ];
  title1 = '  P(X) =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o, c, e, title1 );

  nx = 2;
  x(1:m,1) = [ 1.0, 2.0, 3.0 ];
  x(1:m,2) = [ -2.0, 4.0, 1.0 ];
  p = polynomial_value ( m, o, c, e, nx, x );
  for j = 1 : nx
    fprintf ( 1, '  P(%g,%g,%g) = %g\n', x(1:m,j), p(j) );
  end

  return
end

