function u = fem1d_bvp_linear ( n, a, c, f, x )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR solves a two point boundary value problem.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/fem1d_bvp_linear/fem1d_bvp_linear.m
%
%  Discussion:
%
%    The program uses the finite element method, with piecewise linear basis
%    functions to solve a boundary value problem in one dimension.
%
%    The problem is defined on the region 0 <= x <= 1.
%
%    The following differential equation is imposed between 0 and 1:
%
%      - d/dx a(x) du/dx + c(x) * u(x) = f(x)
%
%    where a(x), c(x), and f(x) are given functions.
%
%    At the boundaries, the following conditions are applied:
%
%      u(0.0) = 0.0
%      u(1.0) = 0.0
%
%    A set of N equally spaced nodes is defined on this
%    interval, with 0 = X(1) < X(2) < ... < X(N) = 1.0.
%
%    At each node I, we associate a piecewise linear basis function V(I,X),
%    which is 0 at all nodes except node I.  This implies that V(I,X) is
%    everywhere 0 except that
%
%    for X(I-1) <= X <= X(I):
%
%      V(I,X) = ( X - X(I-1) ) / ( X(I) - X(I-1) ) 
%
%    for X(I) <= X <= X(I+1):
%
%      V(I,X) = ( X(I+1) - X ) / ( X(I+1) - X(I) )
%
%    We now assume that the solution U(X) can be written as a linear
%    sum of these basis functions:
%
%      U(X) = sum ( 1 <= J <= N ) U(J) * V(J,X)
%
%    where U(X) on the left is the function of X, but on the right,
%    is meant to indicate the coefficients of the basis functions.
%
%    To determine the coefficient U(J), we multiply the original
%    differential equation by the basis function V(J,X), and use
%    integration by parts, to arrive at the I-th finite element equation:
%
%        Integral A(X) * U'(X) * V'(I,X) + C(X) * U(X) * V(I,X) dx 
%      = Integral F(X) * V(I,X) dx
%
%    We note that the functions U(X) and U'(X) can be replaced by
%    the finite element form involving the linear sum of basis functions,
%    but we also note that the resulting integrand will only be nonzero
%    for terms where J = I - 1, I, or I + 1.
%
%    By writing this equation for basis functions I = 2 through N - 1,
%    and using the boundary conditions, we have N linear equations
%    for the N unknown coefficients U(1) through U(N), which can
%    be easily solved.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of nodes.
%
%    Input, function A ( X ), evaluates a(x);
%
%    Input, function C ( X ), evaluates c(x);
%
%    Input, function F ( X ), evaluates f(x);
%
%    Input, real X(N), the mesh points.
%
%    Output, real U(N), the finite element coefficients, which are also
%    the value of the computed solution at the mesh points.
%

%
%  Define a 2 point Gauss-Legendre quadrature rule on the interval [-1,+1]:
%
  quad_num = 2;
  abscissa(1) = -0.577350269189625764509148780502;
  abscissa(2) = +0.577350269189625764509148780502;
  weight(1) = 1.0;
  weight(2) = 1.0;
%
%  Make room for the matrix A and right hand side b.
%
  A = zeros ( n, n );
  b = zeros ( n, 1 );
%
%  We assemble the finite element matrix by looking at each element,
%  that is, each interval [ X(L), X(R) ].
%
%  There are only two nonzero piecewise linear basis functions in this
%  element, and we can call them VL and VR.  So the only integrals we
%  need to compute involve products of:
%
%    VL * VL   VR * VL    F * VL
%    VR * VL   VR * VR    F * VR
%
%  and
%
%    VL' * VL'   VR' * VL'
%    VR' * VL'   VR' * VR'
%
  e_num = n - 1;

  for e = 1 : e_num

    l = e;
    r = e + 1;

    xl = x(l);
    xr = x(r);

    for q = 1 : quad_num

      xq = ( ( 1.0 - abscissa(q) ) * xl   ...
           + ( 1.0 + abscissa(q) ) * xr ) ...
           / 2.0;

      wq = weight(q) * ( xr - xl ) / 2.0;

      vl = ( xr - xq ) / ( xr - xl ); 
      vlp =     - 1.0  / ( xr - xl );

      vr = ( xq - xl ) / ( xr - xl );
      vrp = +1.0       / ( xr - xl );

      axq = a ( xq );
      cxq = c ( xq );
      fxq = f ( xq );

      A(l,l) = A(l,l) + wq * ( vlp * axq * vlp + vl * cxq * vl );
      A(l,r) = A(l,r) + wq * ( vlp * axq * vrp + vl * cxq * vr );
      b(l)   = b(l)   + wq * ( vl * fxq );

      A(r,l) = A(r,l) + wq * ( vrp * axq * vlp + vr * cxq * vl );
      A(r,r) = A(r,r) + wq * ( vrp * axq * vrp + vr * cxq * vr );
      b(r)   = b(r)   + wq * ( vr * fxq );

    end

  end
%
%  Equation 1 is the left boundary condition, U(X=0.0) = 0.0;
%
  A(1,1:n) = 0.0;
  A(1,1) = 1.0;
  b(1) = 0.0;
%
%  Equation N is the right boundary condition, U(X=1.0) = 0.0;
%
  A(n,1:n) = 0.0;
  A(n,n) = 1.0;
  b(n) = 0.0;
%
%  If it is useful for the system matrix to be symmetric, we
%  can eliminate U(1) from all equations but #1, and U(N) from all
%  equations but #N.
%
  b(2:n) = b(2:n) - A(2:n,1) * b(1);
  A(2:n,1) = 0.0;

  b(1:n-1) = b(1:n-1) - A(1:n-1,n) * b(n);
  A(1:n-1,n) = 0.0;
%
%  Solve the linear system for the finite element coefficients U.
%
  u = A \ b;

  return
end
