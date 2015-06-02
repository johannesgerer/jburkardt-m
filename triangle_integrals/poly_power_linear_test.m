function poly_power_linear_test ( )

%*****************************************************************************80
%
%% POLY_POWER_LINEAR_TEST tests POLY_POWER_LINEAR.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/poly_power_linear_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLY_POWER_LINEAR_TEST:\n' );
  fprintf ( 1, '  POLY_POWER_LINEAR computes the N-th power of \n' );
  fprintf ( 1, '  a linear polynomial in X and Y.\n' );
%
%  P = ( 1 + 2 x + 3 y )^2
%
  d1 = 1;
  p1 = [ 1.0, 2.0, 3.0 ];
  fprintf ( 1, '\n' );
  poly_print ( d1, p1, '  p1(x,y)' );

  [ dp, pp ] = poly_power_linear ( d1, p1, 2 );
  fprintf ( 1, '\n' );
  poly_print ( dp, pp, '  p1(x,y)^n' );

  dc = 2;
  pc = [ 1.0, 4.0, 6.0, 4.0, 12.0, 9.0 ];
  fprintf ( 1, '\n' );
  poly_print ( dc, pc, '  Correct answer: p1(x,y)^2' );
%
%  P = ( 2 - x + 3 y )^3
%
  d1 = 1;
  p1 = [ 2.0, -1.0, 3.0 ];
  fprintf ( 1, '\n' );
  poly_print ( d1, p1, '  p1(x,y)' );

  [ dp, pp ] = poly_power_linear ( d1, p1, 3 );
  fprintf ( 1, '\n' );
  poly_print ( dp, pp, '  p1(x,y)^3' );

  dc = 3;
  pc = [ 8.0, -12.0, 36.0, 6.0, -36.0, 54.0, -1.0, 9.0, -27.0, 27.0 ];
  fprintf ( 1, '\n' );
  poly_print ( dc, pc, '  Correct answer: p1(x,y)^n' );

  return
end
