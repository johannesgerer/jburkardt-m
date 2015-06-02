function fem1d_lagrange_stiffness_test ( x_num, q_num )

%*****************************************************************************80
%
%% FEM1D_LAGRANGE_STIFFNESS_TEST tests FEM1D_LAGRANGE_STIFFNESS.
%
%  Discussion:
%
%    The results are very sensitive to the quadrature rule.
%
%    In particular, if X_NUM points are used, the mass matrix will
%    involve integrals of polynomials of degree 2*(X_NUM-1), so the
%    quadrature rule should use at least Q_NUM = X_NUM - 1 points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, integer Q_NUM, the number of quadrature points.
%
  if ( nargin < 1 )
    x_num = 11;
  end

  if ( nargin < 2 )
    q_num = x_num - 1;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_LAGRANGE_STIFFNESS_TEST\n' );
  fprintf ( 1, '  FEM1D_LAGRANGE_STIFFNESS computes the stiffness matrix,\n' );
  fprintf ( 1, '  the mass matrix, and right hand side vector for a\n' );
  fprintf ( 1, '  finite element problem using Lagrange interpolation\n' );
  fprintf ( 1, '  basis polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solving:\n' );
  fprintf ( 1, '    -u"+u=x on 0 < x < 1\n' );
  fprintf ( 1, '    u(0) = u(1) = 0\n' );
  fprintf ( 1, '  Exact solution:\n' );
  fprintf ( 1, '    u(x) = x - sinh(x)/sinh(1)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The mesh used %d points.\n', x_num );
  fprintf ( 1, '  Quadrature uses %d points.\n', q_num );

  x_lo = 0.0;
  x_hi = 1.0;
  x = linspace ( x_lo, x_hi, x_num );

  [ a, m, b ] = fem1d_lagrange_stiffness ( x_num, x, q_num, @f );

  k = a + m;

  k(1,1:x_num) = 0.0;
  k(1,1) = 1.0;
  b(1) = 0.0;

  k(x_num,1:x_num) = 0.0;
  k(x_num,x_num) = 1.0;
  b(x_num) = 0.0;

  u = k \ b;
  u_e = exact ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I      X             U              U(exact)         Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : x_num
    fprintf ( 1, '  %2d  %8.4f  %14.6g  %14.6g  %14.6g\n', ...
      i, x(i), u(i), u_e(i), abs ( u(i) - u_e(i) ) );
  end

  return
end
function value = f ( x )

  value = x;

  return
end
function value = exact ( x )

  value = x - sinh ( x ) / sinh ( 1.0 );

  return
end
