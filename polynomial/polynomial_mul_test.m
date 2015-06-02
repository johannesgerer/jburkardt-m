function polynomial_mul_test ( )

%*****************************************************************************80
%
%% POLYNOMIAL_MUL_TEST tests POLYNOMIAL_MUL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYNOMIAL_MUL_TEST\n' );
  fprintf ( 1, '  POLYNOMIAL_MUL multiplies two polynomials.\n' );

  m = 2;

  o1 = 4;
  c1 = [ 2.0, 3.0, 4.0, 5.0 ];
  e1 = [ 1, 3, 4, 6 ];
  title1 = '  P1(X) =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o1, c1, e1, title1 );

  o2 = 2;
  c2 = [ 6.0, 7.0 ];
  e2 = [ 2, 5 ];
  title2 = '  P2(X) =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o2, c2, e2, title2 );

  [ o, c, e ] = polynomial_mul ( m, o1, c1, e1, o2, c2, e2 );
  title = '  P1(X) * P2(X) =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o, c, e, title );

  return
end

