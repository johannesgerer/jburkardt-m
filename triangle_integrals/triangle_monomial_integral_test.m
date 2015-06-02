function triangle_monomial_integral_test ( )

%*****************************************************************************80
%
%% TRIANGLE_MONOMIAL_INTEGRAL_TEST estimates integrals over a triangle.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/triangle_monomial_integral_test.m
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_MONOMIAL_INTEGRAL_TEST\n' );
  fprintf ( 1, '  TRIANGLE_MONOMIAL_INTEGRAL returns the integral Q of\n' );
  fprintf ( 1, '  a monomial X^I Y^J over the interior of a triangle.\n' );
%
%  Test 1:
%
  t = [ ...
     0.0, 0.0; ...
     1.0, 0.0; ...
     0.0, 1.0 ]';

  i = 1;
  j = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle vertices:\n' );
  fprintf ( 1, '    (X1,Y1) = (%g,%g)\n', t(1,1), t(2,1) );
  fprintf ( 1, '    (X2,Y2) = (%g,%g)\n', t(1,2), t(2,2) );
  fprintf ( 1, '    (X3,Y3) = (%g,%g)\n', t(1,3), t(2,3) );
  fprintf ( 1, '  Integrand = x^%d * y^%d\n', i, j );

  q = triangle_monomial_integral ( i, j, t );
  q2 = 1.0 / 6.0;

  fprintf ( 1, '  Computed Q = %g\n', q );
  fprintf ( 1, '  Exact Q    = %g\n', q2 );
%
%  Test 2:
%
  t = [ ...
     0.0, 0.0; ...
     1.0, 0.0; ...
     1.0, 2.0 ]';

  i = 1;
  j = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle vertices:\n' );
  fprintf ( 1, '    (X1,Y1) = (%g,%g)\n', t(1,1), t(2,1) );
  fprintf ( 1, '    (X2,Y2) = (%g,%g)\n', t(1,2), t(2,2) );
  fprintf ( 1, '    (X3,Y3) = (%g,%g)\n', t(1,3), t(2,3) );
  fprintf ( 1, '  Integrand = x^%d * y^%d\n', i, j );

  q = triangle_monomial_integral ( i, j, t );
  q2 = 0.5;

  fprintf ( 1, '  Computed Q = %g\n', q );
  fprintf ( 1, '  Exact Q    = %g\n', q2 );
%
%  Test 3:
%
  t = [ ...
    -3.0, 0.0; ...
     6.0, 0.0; ...
     0.0, 3.0 ]';

  i = 1;
  j = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle vertices:\n' );
  fprintf ( 1, '    (X1,Y1) = (%g,%g)\n', t(1,1), t(2,1) );
  fprintf ( 1, '    (X2,Y2) = (%g,%g)\n', t(1,2), t(2,2) );
  fprintf ( 1, '    (X3,Y3) = (%g,%g)\n', t(1,3), t(2,3) );
  fprintf ( 1, '  Integrand = x^%d * y^%d\n', i, j );

  q = triangle_monomial_integral ( i, j, t );
  q2 = 13.5;

  fprintf ( 1, '  Computed Q = %g\n', q );
  fprintf ( 1, '  Exact Q    = %g\n', q2 );
%
%  Test 4:
%
  t = [ ...
     0.0, 0.0; ...
     4.0, 0.0; ...
     0.0, 1.0 ]';

  i = 1;
  j = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle vertices:\n' );
  fprintf ( 1, '    (X1,Y1) = (%g,%g)\n', t(1,1), t(2,1) );
  fprintf ( 1, '    (X2,Y2) = (%g,%g)\n', t(1,2), t(2,2) );
  fprintf ( 1, '    (X3,Y3) = (%g,%g)\n', t(1,3), t(2,3) );
  fprintf ( 1, '  Integrand = x^%d * y^%d\n', i, j );

  q = triangle_monomial_integral ( i, j, t );
  q2 = 2.0 / 3.0;

  fprintf ( 1, '  Computed Q = %g\n', q );
  fprintf ( 1, '  Exact Q    = %g\n', q2 );

  return
end
