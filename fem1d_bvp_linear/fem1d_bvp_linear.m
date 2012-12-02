function u = fem1d_bvp_linear ( n, a, c, f, x )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR solves a two point boundary value problem.
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
%    20 August 2010
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
%  Quadrature definitions.
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
%  Equation 1 is the left boundary condition, U(0.0) = 0.0;
%
  A(1,1) = 1.0;
  b(1) = 0.0;
%
%  Equation I involves the basis function at node I.
%  This basis function is nonzero from X(I-1) to X(I+1).
%  Equation I looks like this:
%
%    Integral A(X) U'(X) V'(I,X) 
%           + C(X) * U(X) V(I,X) dx 
%  = Integral F(X) V(I,X) dx
%
%  Then, we realize that U(X) = sum ( 1 <= J <= N ) U(J) * V(J,X), 
%  (U(X) means the function; U(J) is the coefficient of V(J,X) ).
%
%  The only V functions that are nonzero when V(I,X) is nonzero are
%  V(I-1,X) and V(I+1,X). 
%
%  Let's use the shorthand 
%
%    VL(X) = V(I-1,X)
%    VM(X) = V(I,X)
%    VR(X) = V(I+1,X)
%
%  So our equation becomes
%
%    Integral A(X) [ VL'(X) U(I-1) + VM'(X) U(I) + VR'(X) U(I+1) ] * VM'(X)
%           + C(X) [ VL(X)  U(I-1) + VM(X)  U(I) + VR(X)  U(I+1) ] * VM(X) dx
%  = Integral F(X) VM(X) dx.
%
%  
%
%  This is actually a set of N-2 linear equations for the N coefficients U.
%
%  Now gather the multipliers of U(I-1) to get the matrix entry A(I,I-1), and so on.
%
  for i = 2 : n - 1
%
%  Get the left, right and middle coordinates.
%
    xl = x(i-1);
    xm = x(i);
    xr = x(i+1);
%
%  Make temporary variables for A(I,I-1), A(I,I), A(I,I+1) and B(I).
%
    al = 0.0;
    am = 0.0;
    ar = 0.0;
    bm = 0.0;
%
%  We approximate the integrals by using a weighted sum of
%  the integrand values at quadrature points.
%
    for q = 1 : quad_num
%
%  Integrate over the LEFT interval, between XL and XM, where:
%
%  VL(X) = ( XM - X       ) / ( XM - XL )
%  VM(X) = (      X  - XL ) / ( XM - XL )
%  VR(X) = 0
%
%  VL'(X) =             - 1 / ( XM - XL )
%  VM'(X) =             + 1 / ( XM - XL ) 
%  VR'(X) = 0
%
      xq = ( ( 1.0 - abscissa(q) ) * xl   ...
           + ( 1.0 + abscissa(q) ) * xm ) ...
           / 2.0;

      wq = weight(q) * ( xm - xl ) / 2.0;

      vl = ( xm - xq ) / ( xm - xl ); 
      vlp =     - 1.0  / ( xm - xl );

      vm = ( xq - xl ) / ( xm - xl );
      vmp = +1.0       / ( xm - xl );

      vr =  0.0;
      vrp = 0.0;

      axq = a ( xq );
      cxq = c ( xq );
      fxq = f ( xq );

      al = al + wq * ( axq * vlp * vmp + cxq * vl * vm );
      am = am + wq * ( axq * vmp * vmp + cxq * vm * vm );
      ar = ar + wq * ( axq * vrp * vmp + cxq * vr * vm );
      bm = bm + wq * ( fxq * vm );
%
%  Integrate over the RIGHT interval, between XM and XR, where:
%
%  VL(X) = 0
%  VM(X) = ( XR - X       ) / ( XR - XM )
%  VR(X) = (      X  - XM ) / ( XR - XM )
%
%  VL'(X) = 0
%  VM'(X) =             - 1 / ( XR - XM )
%  VR'(X) =             + 1 / ( XR - XM ) 
%
      xq = ( ( 1.0 - abscissa(q) ) * xm   ...
           + ( 1.0 + abscissa(q) ) * xr ) ...
           / 2.0;

      wq = weight(q) * ( xr - xm ) / 2.0;

      vl = 0.0;
      vlp = 0.0;

      vm = ( xr - xq ) / ( xr - xm );
      vmp =     - 1.0  / ( xr - xm );

      vr = ( xq - xm ) / ( xr - xm );
      vrp =  1.0       / ( xr - xm );

      axq = a ( xq );
      cxq = c ( xq );
      fxq = f ( xq );

      al = al + wq * ( axq * vlp * vmp + cxq * vl * vm );
      am = am + wq * ( axq * vmp * vmp + cxq * vm * vm );
      ar = ar + wq * ( axq * vrp * vmp + cxq * vr * vm );
      bm = bm + wq * ( fxq * vm );

    end

    A(i,i-1) = al;
    A(i,i)   = am;
    A(i,i+1) = ar;
    b(i)     = bm;

  end
%
%  Equation N is the right boundary condition, U(1.0) = 0.0;
%
  A(n,n) = 1.0;
  b(n) = 0.0;
%
%  Solve the linear system.
%
  u = A \ b;

  return
end
