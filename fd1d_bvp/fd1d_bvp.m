function u = fd1d_bvp  ( n, a, aprime, c, f, x )

%*****************************************************************************80
%
%% FD1D_BVP solves a two point boundary value problem.
%
%  Discussion:
%
%    The program uses the finite difference method to solve a BVP
%    (boundary value problem) in one dimension.
%
%    The problem is defined on the region X(1) <= x <= X(N).
%
%    The following differential equation is imposed in the region:
%
%      - d/dx a(x) du/dx + c(x) * u(x) = f(x)
%
%    where a(x), c(x), and f(x) are given functions.  We write out
%    the equation in full as
%
%      - a(x) * u''(x) - a'(x) * u'(x) + c(x) * u(x) = f(x)
%
%    At the boundaries, the following conditions are applied:
%
%      u(X(1)) = 0.0
%      u(X(N)) = 0.0
%
%    A set of N equally spaced nodes is defined on this
%    interval, with X(1) < X(2) < ... < X(N).
%
%    We replace the function U(X) by a vector of values U(1)
%    through U(N), associated with the nodes.
%
%    The values of U(1) and U(N) are determined by the boundary conditions.
%
%    At each interior node I, we write an equation to help us determine
%    U(I).  We do this by approximating the derivatives of U(X) by
%    finite differences.  Let us write XL, XM, and XR for X(I-1), X(I) and X(I+1).
%    Similarly we have UL, UM, and UR.  Other quantities to be evaluated at
%    X(I) = XM will also be labeled with an M:
%
%      - AM * ( UL - 2 UM + UR ) / DX^2 - A'M * ( UL - UR ) / ( 2 * DX ) = FM
%
%    These N-2 linear equations for the unknown coefficients complete the
%    linear system and allow us to compute the finite difference approximation
%    to the solution of the BVP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 August 2010
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
%    Input, function APRIME ( X ), evaluates a'(x);
%
%    Input, function C ( X ), evaluates c(x);
%
%    Input, function F ( X ), evaluates f(x);
%
%    Input, real X(N), the mesh points, which may be nonuniformly spaced.
%
%    Output, real U(N), the value of the finite difference approximation
%    to the solution.
%

%
%  Make room for the matrix A and right hand side b.
%
  A = zeros ( n, n );
  rhs = zeros ( n, 1 );
%
%  The first equation is the left boundary condition, U(X(1)) = 0.0;
%
  A(1,1) = 1.0;
  rhs(1) = 0.0;
%
%  Now gather the multipliers of U(I-1) to get the matrix entry A(I,I-1),
%  and so on.
%
  for i = 2 : n - 1

    xm  = x(i);
    am  = a ( xm );
    apm = aprime ( xm );
    cm  = c ( xm );
    fm  = f ( xm );

    A(i,i-1) = - 2.0 * am / ( x(i) - x(i-1) ) / ( x(i+1) - x(i-1) ) ...
      + apm / ( x(i+1) - x(i-1) );

    A(i,i) = + 2.0 * am / ( x(i) - x(i-1) ) / ( x(i+1) - x(i) ) ...
      + cm;

    A(i,i+1) = - 2.0 * am / ( x(i+1) - x(i) ) / ( x(i+1) - x(i-1) ) ...
      - apm / ( x(i+1) - x(i-1) );

    rhs(i)   = fm;

  end
%
%  The last equation is the right boundary condition, U(X(N)) = 0.0;
%
  A(n,n) = 1.0;
  rhs(n) = 0.0;
%
%  Solve the linear system.
%
  u = A \ rhs;

  return
end
