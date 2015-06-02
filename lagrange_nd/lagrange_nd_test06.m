function lagrange_nd_test06 ( )

%*****************************************************************************80
%
%% LAGRANGE_ND_TEST06 tests LAGRANGE_ND_COMPLETE in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_ND_TEST06\n' );
  fprintf ( 1, '  LAGRANGE_COMPLETE determines\n' );
  fprintf ( 1, '  the Lagrange interpolating polynomials L(x)\n' );
  fprintf ( 1, '  for ND points in D dimensions, assuming that\n' );
  fprintf ( 1, '  the number of points exactly coincides with\n' );
  fprintf ( 1, '  R = Pi(D,N), the number of monomials of degree N or less\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data points are the grid nodes of a triangle.\n' );

  d = 2;
  n = 2;
  r = mono_upto_enum ( d, n );
  nd = 6;
  xd = [ 0.0,  0.0; ...
         1.0,  0.0; ...
         2.0,  0.0; ...
         0.0,  1.0; ...
         1.0,  1.0;
         0.0,  2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension D = %d\n', d );
  fprintf ( 1, '  Maximum degree N = %d\n', n );
  fprintf ( 1, '  Number of monomials R = %d\n', r );
  fprintf ( 1, '  Number of data points ND = %d\n', nd );

  r8mat_transpose_print ( d, nd, xd, '  Data points XD:' );

  [ po, pc, pe ] = lagrange_complete ( d, n, r, nd, xd );
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

  return
end

