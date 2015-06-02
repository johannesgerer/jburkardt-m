function lagrange_nd_test10 ( )

%*****************************************************************************80
%
%% LAGRANGE_ND_TEST10 tests LAGRANGE_PARTIAL2 in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_ND_TEST10\n' );
  fprintf ( 1, '  LAGRANGE_PARTIAL2 determines\n' );
  fprintf ( 1, '  the Lagrange interpolating polynomials L(x)\n' );
  fprintf ( 1, '  for ND points in D dimensions, assuming that\n' );
  fprintf ( 1, '  the number of points is less than or equal to\n' );
  fprintf ( 1, '  R = Pi(D,N), the number of monomials of degree N or less\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this example, the data points are the same as those\n' );
  fprintf ( 1, '  used by the level 2 Clenshaw Curtis sparse grid in 2D.\n' );

  d = 2;
  n = 4;
  r = mono_upto_enum ( d, n );
  nd = 13;
  xd = [ 0.0,  0.0;
        -1.0,  0.0;
         1.0,  0.0,
         0.0, -1.0,
         0.0,  1.0,
        -1.0,  1.0,
         1.0,  1.0,
        -1.0, -1.0,
         1.0, -1.0,
        -0.5,  0.0,
         0.0, -0.5,
         0.0, +0.5,
         0.5,  0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension D = %d\n', d );
  fprintf ( 1, '  Maximum degree N = %d\n', n );
  fprintf ( 1, '  Number of monomials R = %d\n', r );
  fprintf ( 1, '  Number of data points ND = %d\n', nd );

  r8mat_transpose_print ( d, nd, xd, '  Data points XD:' );

  [ po, pc, pe ] = lagrange_partial2 ( d, n, r, nd, xd );
%
%  Print the polynomials.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Lagrange polynomials for XD data points:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nd
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

  err = r8mat_is_identity ( nd, value );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm of Lagrange matrix error = %g\n', err );
%
%  Now evaluate a function at the data points.
%
  pd = zeros ( nd, 1 );
  for i = 1 : nd
    pd(i) = sin ( xd(1,i) ) * cos ( xd(2,i) );
  end
%
%  Compare exact function and interpolant at a grid of points.
%
  ni = 11 * 11;
  xyi = zeros ( 2, ni );

  k = 0;
  for j = 1 : 11
    for i = 1 : 11
      k = k + 1;
      xyi(1,k) = ( ( 11 - i     ) * ( - 1.0 )   ...
                 + (      i - 1 ) * ( + 1.0 ) ) ...
                 / ( 11     - 1 );
      xyi(2,k) = ( ( 11 - j     ) * ( - 1.0 )   ...
                 + (      j - 1 ) * ( + 1.0 ) ) ...
                 / ( 11     - 1 );
    end
  end

  pn = nd;
  zi = interpolant_value ( d, r, pn, po, pc, pe, pd, ni, xyi );

  err = 0.0;
  for k = 1 : ni
    f = sin ( xyi(1,k) ) * cos ( xyi(2,k) );
    err = max ( err, abs ( zi(k) - f ) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum absolute interpolant error on 11x11 grid = %g\n', err );

%
%  Plot the interpolant at a grid of points.
%
%  Reshuffling the shapes of MATLAB vectors is my definition of hell.
%
  x1 = linspace ( -1, +1, 11 );
  y1 = linspace ( -1, +1, 11 );
  [ x2, y2 ] = meshgrid ( x1, y1 );
  x3 = reshape ( x2, 1, 11 * 11 );
  y3 = reshape ( y2, 1, 11 * 11 );
  xyi = [ x3; y3 ];
  ni = 11 * 11;
  zi = interpolant_value ( d, r, pn, po, pc, pe, pd, ni, xyi );
  z2 = reshape ( zi, 11, 11 );

  surf ( x2, y2, z2 );
  title ( 'Lagrange interpolant to sin(x)*cos(y)', 'FontSize', 16 )
  xlabel ( '<---X--->', 'FontSize', 16 )
  ylabel ( '<---Y--->', 'FontSize', 16 )
  zlabel ( '<---F(X,Y)--->', 'FontSize', 16 )

  filename = 'test10_interpolant.png';
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot file in "%s"\n', filename );

  return
end

