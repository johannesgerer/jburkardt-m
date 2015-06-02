function triangle_xy_integral_test ( )

%*****************************************************************************80
%
%% TRIANGLE_XY_INTEGRAL_TEST tests TRIANGLE_XY_INTEGRAL.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/triangle_xy_integral_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_XY_INTEGRAL_TEST\n' );
  fprintf ( 1, '  TRIANGLE_XY_INTEGRAL determines Q, the integral of the\n' );
  fprintf ( 1, '  monomial X*Y over a triangle (X1,Y1), (X2,Y2), (X3,Y3).\n' );

  x1 = 0.0;
  y1 = 0.0;

  x2 = 1.0;
  y2 = 0.0;

  x3 = 1.0;
  y3 = 2.0;

  q = triangle_xy_integral ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  (X1,Y1) = ( %g,%g )\n', x1, y1 );
  fprintf ( 1, '  (X2,Y2) = ( %g,%g )\n', x2, y2 );
  fprintf ( 1, '  (X3,Y3) = ( %g,%g )\n', x3, y3 );
  fprintf ( 1, '  Q = %g\n', q );
  fprintf ( 1, '  (Expecting answer 1/2.\n');

  x1 = 0.0;
  y1 = 0.0;

  x2 = 4.0;
  y2 = 0.0;

  x3 = 0.0;
  y3 = 1.0;

  q = triangle_xy_integral ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  (X1,Y1) = ( %g,%g )\n', x1, y1 );
  fprintf ( 1, '  (X2,Y2) = ( %g,%g )\n', x2, y2 );
  fprintf ( 1, '  (X3,Y3) = ( %g,%g )\n', x3, y3 );
  fprintf ( 1, '  Q = %g\n', q );
  fprintf ( 1, '  (Expecting answer 2/3.\n');

  return
end
