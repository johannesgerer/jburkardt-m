function [ a, m, b ] = fem1d_lagrange_stiffness ( x_num, x, q_num, f )

%*****************************************************************************80
%
%% FEM1D_LAGRANGE_STIFFNESS evaluates the Lagrange polynomial stiffness matrix.
%
%  Discussion:
%
%    The finite element method is to be applied over a given interval that
%    has been meshed with X_NUM points X.
%
%    The finite element basis functions are to be the X_NUM Lagrange
%    basis polynomials L(i)(X), such that
%      L(i)(X(j)) = delta(i,j).
%
%    The following items are computed:
%    * A, the stiffness matrix, with A(I,J) = integral L'(i)(x) L'(j)(x)
%    * M, the mass matrix, with M(I,J) = integral L(i)(x) L(j)(x)
%    * B, the load matrix, with B(I) = integral L(i)(x) F(x)
%
%    The integrals are approximated by quadrature.
%
%    Boundary conditions are not handled by this routine.
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
%    Input, real X(X_NUM,1), the coordinates of the nodes.
%
%    Input, integer Q_NUM, the number of quadrature points to use.
%
%    Input, function handle, real F(X), the right hand side function.
%
%    Output, real A(X_NUM,X_NUM), the stiffness matrix.
%
%    Output, real M(X_NUM,X_NUM), the mass matrix.
%
%    Output, real B(X_NUM), the right hand side vector.
%
%
%  Get the quadrature rule for [-1,+1].
%
  [ q_x, q_w ] = legendre_set ( q_num );
%
%  Adjust the quadrature rule to the interval [ x(1), x(x_num) }
%
  q_x(1:q_num) =  ( ( 1.0 - q_x(1:q_num) ) * x(1) ...
                  + ( 1.0 + q_x(1:q_num) ) * x(x_num) ) ...
                  /   2.0;

  q_w(1:q_num) = q_w(1:q_num) * ( x(x_num) - x(1) ) / 2.0;
%
%  Evaluate all the Lagrange basis polynomials at all the quadrature points.
%
  l = lagrange_value ( x_num, x, q_num, q_x );
%
%  Evaluate all the Lagrange basis polynomial derivatives at all the quadrature points.
%
  lp = lagrange_derivative ( x_num, x, q_num, q_x );
%
%  Assemble the matrix and right hand side.
%
  a = zeros ( x_num, x_num );
  m = zeros ( x_num, x_num );
  b = zeros ( x_num, 1 );

  for x_i = 1 : x_num
    for q_i = 1 : q_num
      li = l(q_i,x_i);
      lpi = lp(q_i,x_i);
      for x_j = 1 : x_num
        lj = l(q_i,x_j);
        lpj = lp(q_i,x_j);
        a(x_i,x_j) = a(x_i,x_j) + q_w(q_i) * lpi * lpj;
        m(x_i,x_j) = m(x_i,x_j) + q_w(q_i) * li * lj;
      end
      b(x_i) = b(x_i) + q_w(q_i) * li * f ( q_x(q_i) );
    end
  end

  return
end


