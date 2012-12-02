function l2_error = compute_l2_error ( n, x, u, exact )

%*****************************************************************************80
%
%% COMPUTE_L2_ERROR estimates the L2 error norm of a finite element solution.
%
%  Discussion:
%
%    We assume the finite element method has been used, over an interval [A,B]
%    involving N nodes, with piecewise linear elements used for the basis.
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
%    17 February 2012
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
%    Output, real L2_ERROR, the estimated L2 norm of the error.
%
  l2_error = 0.0;
%
%  Quadrature definitions.
%
  quad_num = 2;
  abscissa(1) = -0.577350269189625764509148780502;
  abscissa(2) = +0.577350269189625764509148780502;
  weight(1) = 1.0;
  weight(2) = 1.0;
%
%  Integrate over each interval.
%
  for i = 1 : n - 1

    xl = x(i);
    xr = x(i+1);
    ul = u(i);
    ur = u(i+1);

    for q = 1 : quad_num

      xq = ( ( 1.0 - abscissa(q) ) * xl   ...
           + ( 1.0 + abscissa(q) ) * xr ) ...
           /   2.0;

      wq = weight(q) * ( xr - xl ) / 2.0;
%
%  Use the fact that U is a linear combination of piecewise linears.
%
      uq = ( ( xr - xq      ) * ul ...
           + (      xq - xl ) * ur ) ...
           / ( xr      - xl );

      eq = exact ( xq );

      l2_error = l2_error + wq * ( uq - eq )^2;

    end
  end

  l2_error = sqrt ( l2_error );

  return
end
