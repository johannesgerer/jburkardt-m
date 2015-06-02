function lagrange_nd_test11 ( option )

%*****************************************************************************80
%
%% LAGRANGE_ND_TEST11 tests LAGRANGE_PARTIAL3 in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2014
%
%  Author:
%
%    Mike Schneier
%
%  Parameters:
%
%    Input, integer OPTION, determines the initial basis:
%    0, use monomials, 1, x, y, x^2, xy, y^2, x^3, ...
%    1, use Legendre products, 1, y, x, (3y^2-1)/2, xy, (3^x^2-1), (5y^3-3)/2,...
%
  f = @(x,y) exp(y.*x);
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_ND_TEST11\n' );
  fprintf ( 1, '  LAGRANGE_PARTIAL3 determines\n' );
  fprintf ( 1, '  the Lagrange interpolating polynomials L(x)\n' );
  fprintf ( 1, '  for ND points in D dimensions, assuming that\n' );
  fprintf ( 1, '  the number of points is less than or equal to\n' );
  fprintf ( 1, '  R = Pi(D,N), the number of monomials of degree N or less\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If LAGRANGE_PARTIAL3 determines that the problem is not\n' );
  fprintf ( 1, '  well-posed for the given value of N, it increases N\n' );
  fprintf ( 1, '  until a suitable value is found.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this example, the data points are the same as those\n' );
  fprintf ( 1, '  used by the level 2 Clenshaw Curtis sparse grid in 2D.\n' );

  d = 2;
  n = 10;
  r = mono_upto_enum ( d, n );
  nd = 65;
  xd = [0.0000000000000000      0.0000000000000000
     -1.0000000000000000      0.0000000000000000
      1.0000000000000000      0.0000000000000000
      0.0000000000000000     -1.0000000000000000
      0.0000000000000000      1.0000000000000000
     -0.7071067811865475      0.0000000000000000
      0.7071067811865476      0.0000000000000000
     -1.0000000000000000     -1.0000000000000000
      1.0000000000000000     -1.0000000000000000
     -1.0000000000000000      1.0000000000000000
      1.0000000000000000      1.0000000000000000
      0.0000000000000000     -0.7071067811865475
      0.0000000000000000      0.7071067811865476
     -0.9238795325112867      0.0000000000000000
     -0.3826834323650897      0.0000000000000000
      0.3826834323650898      0.0000000000000000
      0.9238795325112867      0.0000000000000000
     -0.7071067811865475     -1.0000000000000000
      0.7071067811865476     -1.0000000000000000
     -0.7071067811865475      1.0000000000000000
      0.7071067811865476      1.0000000000000000
     -1.0000000000000000     -0.7071067811865475
      1.0000000000000000     -0.7071067811865475
     -1.0000000000000000      0.7071067811865476
      1.0000000000000000      0.7071067811865476
      0.0000000000000000     -0.9238795325112867
      0.0000000000000000     -0.3826834323650897
      0.0000000000000000      0.3826834323650898
      0.0000000000000000      0.9238795325112867
     -0.9807852804032304      0.0000000000000000
     -0.8314696123025453      0.0000000000000000
     -0.5555702330196020      0.0000000000000000
     -0.1950903220161282      0.0000000000000000
      0.1950903220161283      0.0000000000000000
      0.5555702330196023      0.0000000000000000
      0.8314696123025452      0.0000000000000000
      0.9807852804032304      0.0000000000000000
     -0.9238795325112867     -1.0000000000000000
     -0.3826834323650897     -1.0000000000000000
      0.3826834323650898     -1.0000000000000000
      0.9238795325112867     -1.0000000000000000
     -0.9238795325112867      1.0000000000000000
     -0.3826834323650897      1.0000000000000000
      0.3826834323650898      1.0000000000000000
      0.9238795325112867      1.0000000000000000
     -0.7071067811865475     -0.7071067811865475
      0.7071067811865476     -0.7071067811865475
     -0.7071067811865475      0.7071067811865476
      0.7071067811865476      0.7071067811865476
     -1.0000000000000000     -0.9238795325112867
      1.0000000000000000     -0.9238795325112867
     -1.0000000000000000     -0.3826834323650897
      1.0000000000000000     -0.3826834323650897
     -1.0000000000000000      0.3826834323650898
      1.0000000000000000      0.3826834323650898
     -1.0000000000000000      0.9238795325112867
      1.0000000000000000      0.9238795325112867
      0.0000000000000000     -0.9807852804032304
      0.0000000000000000     -0.8314696123025453
      0.0000000000000000     -0.5555702330196020
      0.0000000000000000     -0.1950903220161282
      0.0000000000000000      0.1950903220161283
      0.0000000000000000      0.5555702330196023
      0.0000000000000000      0.8314696123025452
      0.0000000000000000      0.9807852804032304
;]';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension D = %d\n', d );
  fprintf ( 1, '  Maximum degree N = %d\n', n );
  fprintf ( 1, '  Number of monomials R = %d\n', r );
  fprintf ( 1, '  Number of data points ND = %d\n', nd );
  fprintf ( 1, '  Monomial/Legendre option OPTION = %d\n', option );

  r8mat_transpose_print ( d, nd, xd, '  Data points XD:' );

  [ po, pc, pe, n2 ] = lagrange_partial3 ( d, n, nd, xd, option );

  if ( n < n2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  LAGRANGE_PARTIAL3 increased N to %d\n', n2 );
    r = mono_upto_enum ( d, n2 );
  end
%
%  Print the polynomials.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (First 2) Lagrange polynomials for XD data points:\n' );
  fprintf ( 1, '\n' );
% for i = 1 : nd
  for i = 1 : 2
    o = po(i);
    label = sprintf ( '  P(%d)(x) =', i );
    polynomial_print ( d, o, pc(i,1:o), pe(i,1:o), label );
  end
%
%  Evaluate the polynomials at XD.
%
  value = zeros ( nd, nd );

  for j = 1 : nd
    o = po(j);
    label = sprintf ( '  P(%d)(x) =', j );
    value(1:nd,j) = polynomial_value ( d, o, pc(j,1:o), pe(j,1:o), nd, xd );    
  end
%
%  Now evaluate a function at the data points.
%
  pd = zeros ( nd, 1 );
  for i = 1 : nd
    pd(i) = exp ( xd(1,i) .* xd(2,i) ); 
  end
%
%  These function values are the coefficients of the intepolant.
%  Evaluate the interpolant at a grid of points.
%
%  Reshuffling the shapes of MATLAB vectors is my definition of hell.
%
  ni_1d = 101;

  x1 = linspace ( -1, +1, ni_1d );
  y1 = linspace ( -1, +1, ni_1d );
  [ x2, y2 ] = meshgrid ( x1, y1 );
  ni = ni_1d * ni_1d;
  x3 = reshape ( x2, 1, ni );
  y3 = reshape ( y2, 1, ni );
  xyi = [ x3; y3 ];

  pn = nd;
  zi = interpolant_value ( d, r, pn, po, pc, pe, pd, ni, xyi );

  z2 = reshape ( zi, ni_1d, ni_1d );
 
  surf ( x2, y2, z2 );
  title ( 'Lagrange interpolant to exp(x*y)', 'FontSize', 16 )
  xlabel ( '<---X--->', 'FontSize', 16 )
  ylabel ( '<---Y--->', 'FontSize', 16 )
  zlabel ( '<---F(X,Y)--->', 'FontSize', 16 )

  filename = 'test11_interpolant.png';
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot file in "%s"\n', filename );
%
%  Report interpolation errors.
%
  Relerror = norm ( ((zi' - f(x3,y3))))/norm(f(x3,y3) );
  Maxerror = max ( abs(zi' - f(x3,y3)) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Relative error is %g\n', Relerror );
  fprintf ( 1, '  Maximum error is %g\n', Maxerror );
  
  return
end

