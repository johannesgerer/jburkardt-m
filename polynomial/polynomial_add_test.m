function polynomial_add_test ( )

%*****************************************************************************80
%
%% POLYNOMIAL_ADD_TEST tests POLYNOMIAL_ADD.
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
  fprintf ( 1, 'POLYNOMIAL_ADD_TEST\n' );
  fprintf ( 1, '  POLYNOMIAL_ADD adds two polynomials.\n' );

  m = 3;

  o1 = 6;
  c1 = [ 7.0, - 5.0, 9.0, 11.0, 0.0, - 13.0 ];
  e1 = [ 1, 2, 4, 5, 12, 33 ];
  title1 = '  P1(X) =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o1, c1, e1, title1 );

  o2 = 5;
  c2 = [ 2.0, 3.0, -8.0, 4.0, 9.0 ];
  e2 = [ 1, 3, 4, 30, 33 ];
  title2 = '  P2(X) =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o2, c2, e2, title2 );

  [ o, c, e ] = polynomial_add ( o1, c1, e1, o2, c2, e2 );
  title = '  P1(X) + P2(X) =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o, c, e, title );

  return
end

