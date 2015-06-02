function triangle_poly_integral_test ( )

%*****************************************************************************80
%
%% TRIANGLE_POLY_INTEGRAL_TEST estimates integrals over a triangle.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/triangle_poly_integral_test.m
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
  fprintf ( 1, 'TRIANGLE_POLY_INTEGRAL_TEST\n' );
  fprintf ( 1, '  TRIANGLE_POLY_INTEGRAL returns the integral Q of\n' );
  fprintf ( 1, '  a polynomial over the interior of a triangle.\n' );
%
%  Test 1:
%  Integrate x over reference triangle.
%
  t = [ ...
     0.0, 0.0; ...
     1.0, 0.0; ...
     0.0, 1.0 ]';

  d = 1;
  p = [ 0.0, 1.0, 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle vertices:\n' );
  fprintf ( 1, '    (X1,Y1) = (%g,%g)\n', t(1,1), t(2,1) );
  fprintf ( 1, '    (X2,Y2) = (%g,%g)\n', t(1,2), t(2,2) );
  fprintf ( 1, '    (X3,Y3) = (%g,%g)\n', t(1,3), t(2,3) );

  poly_print ( d, p, '  Integrand p(x,y)' );

  q = triangle_poly_integral ( d, p, t );
  q2 = 1.0 / 6.0;

  fprintf ( 1, '  Computed Q = %g\n', q );
  fprintf ( 1, '  Exact Q    = %g\n', q2 );
%
%  Test 2:
%  Integrate xy over a general triangle.
%
  t = [ ...
     0.0, 0.0; ...
     1.0, 0.0; ...
     1.0, 2.0 ]';

  d = 2;
  p = [ 0.0, 0.0, 0.0, 0.0, 1.0, 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle vertices:\n' );
  fprintf ( 1, '    (X1,Y1) = (%g,%g)\n', t(1,1), t(2,1) );
  fprintf ( 1, '    (X2,Y2) = (%g,%g)\n', t(1,2), t(2,2) );
  fprintf ( 1, '    (X3,Y3) = (%g,%g)\n', t(1,3), t(2,3) );

  poly_print ( d, p, '  Integrand p(x,y)' );

  q = triangle_poly_integral ( d, p, t );
  q2 = 0.5;

  fprintf ( 1, '  Computed Q = %g\n', q );
  fprintf ( 1, '  Exact Q    = %g\n', q2 );
%
%  Test 3:
%  Integrate 2-3x+xy over a general triangle.
%
  t = [ ...
     0.0, 0.0; ...
     1.0, 0.0; ...
     1.0, 3.0 ]';

  d = 2;
  p = [ 2.0, -3.0, 0.0, 0.0, 1.0, 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle vertices:\n' );
  fprintf ( 1, '    (X1,Y1) = (%g,%g)\n', t(1,1), t(2,1) );
  fprintf ( 1, '    (X2,Y2) = (%g,%g)\n', t(1,2), t(2,2) );
  fprintf ( 1, '    (X3,Y3) = (%g,%g)\n', t(1,3), t(2,3) );

  poly_print ( d, p, '  Integrand p(x,y)' );

  q = triangle_poly_integral ( d, p, t );
  q2 = 9.0 / 8.0;

  fprintf ( 1, '  Computed Q = %g\n', q );
  fprintf ( 1, '  Exact Q    = %g\n', q2 );
%
%  Test 4:
%  Integrate -40y + 6x^2 over a general triangle.
%
  t = [ ...
     0.0, 3.0; ...
     1.0, 1.0; ...
     5.0, 3.0 ]';

  d = 2;
  p = [ 0.0, 0.0,-40.0, 6.0, 0.0, 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle vertices:\n' );
  fprintf ( 1, '    (X1,Y1) = (%g,%g)\n', t(1,1), t(2,1) );
  fprintf ( 1, '    (X2,Y2) = (%g,%g)\n', t(1,2), t(2,2) );
  fprintf ( 1, '    (X3,Y3) = (%g,%g)\n', t(1,3), t(2,3) );

  poly_print ( d, p, '  Integrand p(x,y)' );

  q = triangle_poly_integral ( d, p, t );
  q2 = - 935.0 / 3.0;

  fprintf ( 1, '  Computed Q = %g\n', q );
  fprintf ( 1, '  Exact Q    = %g\n', q2 );

  return
end
