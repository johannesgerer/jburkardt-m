function polynomial_dif_test ( )

%*****************************************************************************80
%
%% POLYNOMIAL_DIF_TEST tests POLYNOMIAL_DIF.
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
  fprintf ( 1, 'POLYNOMIAL_DIF_TEST\n' );
  fprintf ( 1, '  POLYNOMIAL_DIF computes derivatives of a polynomial.\n' );

  m = 2;

  o1 = 4;
  c1 = [ 2.0, 3.0, 4.0, 5.0 ];
  e1 = [ 1, 10, 12, 32 ];
  title1 = '  P(X) =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o1, c1, e1, title1 );

  dif = [ 2, 1 ];

  [ o, c, e ] = polynomial_dif ( m, o1, c1, e1, dif );
  title = '  d3 P(X) dx1 dx1 dx2 =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o, c, e, title );

  return
end

