function u = fem1d_bvp_quadratic ( n, a, c, f, x )

%*****************************************************************************80
%
%% FEM1D_BVP_QUADRATIC solves a two point boundary value problem.
%
%  Discussion:
%
%    The finite element method is used, with a mesh of piecewise quadratic
%    elements.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of nodes.
%    N must be an odd number, and at least 3.
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
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM1D_BVP_QUADRATIC - Fatal error!\n' );
    fprintf ( 1, '  Number of nodes N must be at least 3.\n' );
    error ( 'FEM1D_BVP_QUADRATIC - Fatal error!' );
  end

  if ( mod ( n, 2 ) ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM1D_BVP_QUADRATIC - Fatal error!\n' );
    fprintf ( 1, '  Number of nodes N must be odd.\n' );
    error ( 'FEM1D_BVP_QUADRATIC - Fatal error!' );
  end
%
%  Quadrature definitions.
%
  quad_num = 3;
  abscissa(1) = -0.774596669241483377035853079956;
  abscissa(2) = 0.000000000000000000000000000000;
  abscissa(3) = 0.774596669241483377035853079956;
  weight(1) = 0.555555555555555555555555555556;
  weight(2) = 0.888888888888888888888888888889;
  weight(3) = 0.555555555555555555555555555556;
%
%  Make room for the matrix A and right hand side b.
%
  A = zeros ( n, n );
  b = zeros ( n, 1 );
%
%  Integrate over element E.
%
  e_num = ( n - 1 ) / 2;

  for e = 1 : e_num
%
%  Element E uses nodes
%    L = 2 * E - 1
%    M = 2 * E
%    R = 2 * E + 1
%
    l = 2 * e - 1;
    m = 2 * e;
    r = 2 * e + 1;

    xl = x(l);
    xm = x(m);
    xr = x(r);

    for q = 1 : quad_num

      xq = ( ( 1.0 - abscissa(q) ) * xl   ...
           + ( 1.0 + abscissa(q) ) * xr ) ...
           / 2.0;

      wq = weight(q) * ( xr - xl ) / 2.0;

      axq = a ( xq );
      cxq = c ( xq );
      fxq = f ( xq );

      vl = ( ( xq - xm ) / ( xl - xm ) ) ...
         * ( ( xq - xr ) / ( xl - xr ) );

      vm = ( ( xq - xl ) / ( xm - xl ) ) ...
         * ( ( xq - xr ) / ( xm - xr ) );

      vr = ( ( xq - xl ) / ( xr - xl ) ) ...
         * ( ( xq - xm ) / ( xr - xm ) );

      vlp = (         1.0 / ( xl - xm ) ) ...
          * ( ( xq - xr ) / ( xl - xr ) ) ...
          + ( ( xq - xm ) / ( xl - xm ) ) ...
          * (         1.0 / ( xl - xr ) );

      vmp = (         1.0 / ( xm - xl ) ) ...
          * ( ( xq - xr ) / ( xm - xr ) ) ...
          + ( ( xq - xl ) / ( xm - xl ) ) ...
          * (         1.0 / ( xm - xr ) );

      vrp = (         1.0 / ( xr - xl ) ) ...
          * ( ( xq - xm ) / ( xr - xm ) ) ...
          + ( ( xq - xl ) / ( xr - xl ) ) ...
          * (         1.0 / ( xr - xm ) );

      A(l,l) = A(l,l) + wq * ( vlp * axq * vlp + vl * cxq * vl );
      A(l,m) = A(l,m) + wq * ( vlp * axq * vmp + vl * cxq * vm );
      A(l,r) = A(l,r) + wq * ( vlp * axq * vrp + vl * cxq * vr );
      b(l)   = b(l)   + wq * ( vl * fxq );

      A(m,l) = A(m,l) + wq * ( vmp * axq * vlp + vm * cxq * vl );
      A(m,m) = A(m,m) + wq * ( vmp * axq * vmp + vm * cxq * vm );
      A(m,r) = A(m,r) + wq * ( vmp * axq * vrp + vm * cxq * vr );
      b(m) =   b(m)   + wq * ( vm * fxq );

      A(r,l) = A(r,l) + wq * ( vrp * axq * vlp + vr * cxq * vl );
      A(r,m) = A(r,m) + wq * ( vrp * axq * vmp + vr * cxq * vm );
      A(r,r) = A(r,r) + wq * ( vrp * axq * vrp + vr * cxq * vr );
      b(r) =   b(r)   + wq * ( vr * fxq );

    end

  end
%
%  Equation 1 is the left boundary condition, U(0.0) = 0.0;
%
  A(1,1:n) = 0.0;
  A(1,1) = 1.0;
  b(1) = 0.0;
%
%  Equation N is the right boundary condition, U(1.0) = 0.0;
%
  A(n,1:n) = 0.0;
  A(n,n) = 1.0;
  b(n) = 0.0;
%
%  Solve the linear system.
%
  u = A \ b;

  return
end
