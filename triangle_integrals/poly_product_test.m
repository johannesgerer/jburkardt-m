function poly_product_test ( )

%*****************************************************************************80
%
%% POLY_PRODUCT_TEST tests POLY_PRODUCT.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/poly_product_test.m
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
  fprintf ( 1, 'POLY_PRODUCT_TEST:\n' );
  fprintf ( 1, '  POLY_PRODUCT computes the product of two X,Y polynomials.\n' );
%
%  P1 = ( 1 + 2 x + 3 y )
%  P2 = ( 4 + 5 x )
%  P3 = 4 + 13x + 12y + 10x^2 + 15xy + 0y^2 
%
  d1 = 1;
  p1 = [ 1.0, 2.0, 3.0 ];
  fprintf ( 1, '\n' );
  poly_print ( d1, p1, '  p1(x,y)' );

  d2 = 1;
  p2 = [ 4.0, 5.0, 0.0 ];
  fprintf ( 1, '\n' );
  poly_print ( d2, p2, '  p2(x,y)' );

  [ d3, p3 ] = poly_product ( d1, p1, d2, p2 );
  fprintf ( 1, '\n' );
  poly_print ( d3, p3, '  p3(x,y) = p1(x,y) * p2(x,y)' );

  dc = 2;
  pc = [ 4.0, 13.0, 12.0, 10.0, 15.0, 0.0 ];
  fprintf ( 1, '\n' );
  poly_print ( dc, pc, '  Correct answer: p3(x,y)=p1(x,y)*p2(x,y)' );
%
%  P1 = ( 1 - 2 x + 3 y - 4x^2 + 5xy - 6y^2)
%  P2 = ( 7 + 3x^2 )
%  P3 = 7 
%    - 14x + 21y 
%    - 25 x^2 + 35 xy -  42y^2 
%    -  6x^3  + 9x^2y +  0xy^2   + 0y^3
%    - 12x^4 + 15x^3y - 18x^2y^2 + 0 xy^3 + 0y^4
%
  d1 = 2;
  p1 = [ 1.0, -2.0, 3.0 -4.0, +5.0, -6.0 ];
  fprintf ( 1, '\n' );
  poly_print ( d1, p1, '  p1(x,y)' );

  d2 = 2;
  p2 = [ 7.0, 0.0, 0.0, 3.0, 0.0, 0.0 ];
  fprintf ( 1, '\n' );
  poly_print ( d2, p2, '  p2(x,y)' );

  [ d3, p3 ] = poly_product ( d1, p1, d2, p2 );
  fprintf ( 1, '\n' );
  poly_print ( d3, p3, '  p3(x,y) = p1(x,y) * p2(x,y)' );

  dc = 4;
  pc = [ ...
      7.0, ...
    -14.0,  21.0, ...
    -25.0, +35.0, -42.0, ...
     -6.0,   9.0,   0.0, 0.0, ...
    -12.0, +15.0, -18.0, 0.0, 0.0 ];
  fprintf ( 1, '\n' );
  poly_print ( dc, pc, '  Correct answer: p3(x,y)=p1(x,y)*p2(x,y)' );

  return
end
