function h1s = h1s_error_quadratic ( n, x, u, exact_ux )

%*****************************************************************************80
%
%% COMPUTE_SEMINORM_ERROR: seminorm error of a finite element solution.
%
%  Discussion:
%
%    We assume the finite element method has been used, over an interval [A,B]
%    involving N nodes, with piecewise quadratic elements used for the basis.
%    The finite element solution U(x) has been computed, and a formula for the
%    exact derivative V'(x) is known.
%
%    This function estimates the H1 seminorm of the error:
%
%      H1S = sqrt ( integral ( A <= x <= B ) ( U'(x) - V'(x) )^2 dx
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
%    Input, function EQ = EXACT_UX ( X ), returns the value of the exact
%    derivative at the point X.
%
%    Output, real H1S, the estimated seminorm of the error.
%
  h1s = 0.0;
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

      uxq = u(l) * vlp + u(m) * vmp + u(r) * vrp;

      exq = exact_ux ( xq );

      h1s = h1s + wq * ( uxq - exq )^2;

    end
  end

  h1s = sqrt ( h1s );

  return
end
