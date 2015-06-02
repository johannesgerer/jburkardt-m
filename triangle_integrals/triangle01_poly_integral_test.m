function triangle01_poly_integral_test ( )

%*****************************************************************************80
%
%% TRIANGLE01_POLY_INTEGRAL_TEST: polynomial integrals over the unit triangle.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/triangle01_poly_integral_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2015
%
%  Author:
%
%    John Burkardt
%
  d_max = 6;
  k_max = ( ( d_max + 1 ) * ( d_max + 2 ) ) / 2;
  qm = zeros ( k_max, 1 );
  for k = 1 : k_max
    [ i, j ] = i4_to_pascal ( k );
    qm(k) = triangle01_monomial_integral ( i, j );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE01_POLY_INTEGRAL_TEST\n' );
  fprintf ( 1, '  TRIANGLE01_POLY_INTEGRAL returns the integral Q of\n' );
  fprintf ( 1, '  a polynomial P(X,Y) over the interior of the unit triangle.\n' );

  d = 1;
  m = ( ( d + 1 ) * ( d + 2 ) ) / 2;
  p = [ 1.0, 2.0, 3.0 ]';
  fprintf ( 1, '\n' );
  poly_print ( d, p, '  p(x,y)' );
  q = triangle01_poly_integral ( d, p );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q =         %g\n', q );
  q2 = p(1:m)' * qm(1:m);
  fprintf ( 1, '  Q (exact) = %g\n', q2 );

  d = 2;
  m = ( ( d + 1 ) * ( d + 2 ) ) / 2;
  p = [ 0.0, 0.0, 0.0, 0.0, 1.0, 0.0 ]';
  fprintf ( 1, '\n' );
  poly_print ( d, p, '  p(x,y)' );
  q = triangle01_poly_integral ( d, p );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q =         %g\n', q );
  q2 = p(1:m)' * qm(1:m);
  fprintf ( 1, '  Q (exact) = %g\n', q2 );

  d = 2;
  m = ( ( d + 1 ) * ( d + 2 ) ) / 2;
  p = [ 1.0, -2.0, 3.0, -4.0, 5.0, -6.0 ]';
  fprintf ( 1, '\n' );
  poly_print ( d, p, '  p(x,y)' );
  q = triangle01_poly_integral ( d, p );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q =         %g\n', q );
  q2 = p(1:m)' * qm(1:m);
  fprintf ( 1, '  Q (exact) = %g\n', q2 );

  return
end
