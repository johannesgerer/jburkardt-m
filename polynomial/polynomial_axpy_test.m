function polynomial_axpy_test ( )

%*****************************************************************************80
%
%% POLYNOMIAL_AXPY_TEST tests POLYNOMIAL_AXPY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYNOMIAL_AXPY_TEST\n' );
  fprintf ( 1, '  POLYNOMIAL_AXPY adds a multiple of one polynomial\n' );
  fprintf ( 1, '  to another.\n' );

  m = 3;

  o1 = 6;
  c1 = [ 7.0, - 5.0, 9.0, 11.0, 0.0, - 13.0 ];
  e1 = [ 1, 2, 4, 5, 12, 33 ];
  label1 = '  P1(X) =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o1, c1, e1, label1 );

  o2 = 5;
  c2 = [ 2.0, 3.0, -8.0, 4.0, 9.0 ];
  e2 = [ 1, 3, 4, 30, 33 ];
  label2 = '  P2(X) =';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o2, c2, e2, label2 );

  s = 10.0;
  [ o, c, e ] = polynomial_axpy ( s, o1, c1, e1, o2, c2, e2 );
  label = sprintf ( '  %g * P1(X) + P2(X) = ', s );
  fprintf ( 1, '\n' );
  polynomial_print ( m, o, c, e, label );

  return
end

