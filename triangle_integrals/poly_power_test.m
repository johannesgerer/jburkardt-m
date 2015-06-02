function poly_power_test ( )

%*****************************************************************************80
%
%% POLY_POWER_TEST tests POLY_POWER.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/poly_power_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLY_POWER_TEST:\n' );
  fprintf ( 1, '  POLY_POWER computes the N-th power of an X,Y polynomial.\n' );
%
%  P1 = ( 1 + 2 x + 3 y )
%  P2 = P1^2 = 1 + 4x + 6y + 4x^2 + 12xy + 9y^2 
%
  d1 = 1;
  p1 = [ 1.0, 2.0, 3.0 ];
  n = 2;

  fprintf ( 1, '\n' );
  poly_print ( d1, p1, '  p1(x,y)' );

  [ d2, p2 ] = poly_power ( d1, p1, n );
  fprintf ( 1, '\n' );
  poly_print ( d2, p2, '  p2(x,y) = p1(x,y)^2' );

  d3 = 2;
  p3 = [ 1.0, 4.0, 6.0, 4.0, 12.0, 9.0 ];
  fprintf ( 1, '\n' );
  poly_print ( d3, p3, '  p3(x,y)=correct answer' );
%
%  P1 = ( 1 - 2 x + 3 y - 4 x^2 + 5 xy - 6 y^2 )
%  P2 = P1^3 =
%    1
%    -6x +9y
%    +0x^2 - 21xy + 9y^2
%    +40x^3 - 96x^2y  + 108x^y2 - 81y^3
%    +0x^4 + 84x^3y - 141 x^2y^2 +171xy^3 - 54y^4
%    -96x^5 + 384x^4y -798x^3y^2 + 1017 x^2y^3 - 756 xy^4 + 324 y^5
%    -64x^6 + 240x^5y - 588x^4y^2 + 845 x^3y^3 - 882 x^2y^4 +540 xy^5 - 216y^6
%
  d1 = 2;
  p1 = [ 1.0, -2.0, 3.0, -4.0, +5.0, -6.0 ];
  n = 3;

  fprintf ( 1, '\n' );
  poly_print ( d1, p1, '  p1(x,y)' );

  [ d2, p2 ] = poly_power ( d1, p1, n );
  fprintf ( 1, '\n' );
  poly_print ( d2, p2, '  p2(x,y) = p1(x,y)^3' );

  d3 = 6;
  p3 = [ ...
      1.0, ...
     -6.0,  9.0, ...   
      0.0, -21.0,    9.0, ...
     40.0, -96.0,  108.0,  -81.0, ...
      0.0,  84.0, -141.0,  171.0,  -54.0, ...
    -96.0, 384.0, -798.0, 1017.0, -756.0, 324.0, ...
    -64.0, 240.0, -588.0,  845.0, -882.0, 540.0, -216.0 ];
  fprintf ( 1, '\n' );
  poly_print ( d3, p3, '  p3(x,y)=correct answer' );

  return
end
