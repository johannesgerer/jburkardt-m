function legendre_set_test ( )

%*****************************************************************************80
%
%% LEGENDRE_SET_TEST tests LEGENDRE_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_SET_TEST\n' );
  fprintf ( 1, '  LEGENDRE_SET returns points and weights of \n' );
  fprintf ( 1, '  Gauss-Legendre quadrature rules.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N               1             X^4           Runge\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 10
    [ x, w ] = legendre_set ( n );
    e1 = sum ( w(1:n,1) );
    e2 = w(1:n,1)' * x(1:n,1).^4;
    e3 = w(1:n,1)' * ( 1.0 ./ ( 1.0 + 25.0 * x(1:n,1).^2 ) );
    fprintf ( 1, '  %2d  %14.6g  %14.6g  %14.6g\n', n, e1, e2, e3 );
  end

  return
end

