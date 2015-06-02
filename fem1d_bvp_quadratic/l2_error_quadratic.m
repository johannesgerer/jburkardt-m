function e2 = l2_error_quadratic ( n, x, u, exact )

%*****************************************************************************80
%
%% COMPUTE_L2_ERROR estimates the L2 error norm of a finite element solution.
%
%  Discussion:
%
%    We assume the finite element method has been used, over an interval [A,B]
%    involving N nodes, with piecewise quadratic elements used for the basis.
%    The coefficients U(1:N) have been computed, and a formula for the
%    exact solution is known.
%
%    This function estimates the L2 norm of the error:
%
%      L2_NORM = Integral ( A <= X <= B ) ( U(X) - EXACT(X) )^2 dX
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
%
%    Input, real X(N), the mesh points.
%
%    Input, real U(N), the finite element coefficients.
%
%    Input, function EQ = EXACT ( X ), returns the value of the exact
%    solution at the point X.
%
%    Output, real E2, the estimated L2 norm of the error.
%
  e2 = 0.0;
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
           /   2.0;

      wq = weight(q) * ( xr - xl ) / 2.0;

      vl = ( ( xq - xm ) / ( xl - xm ) ) ...
         * ( ( xq - xr ) / ( xl - xr ) );

      vm = ( ( xq - xl ) / ( xm - xl ) ) ...
         * ( ( xq - xr ) / ( xm - xr ) );

      vr = ( ( xq - xl ) / ( xr - xl ) ) ...
         * ( ( xq - xm ) / ( xr - xm ) );

      uq = u(l) * vl + u(m) * vm + u(r) * vr;
      eq = exact ( xq );

      e2 = e2 + wq * ( uq - eq )^2;

    end

  end

  e2 = sqrt ( e2 );

  return
end
