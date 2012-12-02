function seminorm_error = compute_seminorm_error ( n, x, u, exact_ux )

%*****************************************************************************80
%
%% COMPUTE_SEMINORM_ERROR estimates the seminorm error of a finite element solution.
%
%  Discussion:
%
%    We assume the finite element method has been used, over an interval [A,B]
%    involving N nodes, with piecewise linear elements used for the basis.
%    The coefficients U(1:N) have been computed, and a formula for the
%    exact derivative is known.
%
%    This function estimates the seminorm of the error:
%
%      SEMINORM = Integral ( A <= X <= B ) ( dU(X)/dx - EXACT_UX(X) )^2 dX
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
%    Input, function EQ = EXACT_UX ( X ), returns the value of the exact
%    derivative at the point X.
%
%    Output, real SEMINORM_ERROR, the estimated seminorm of the error.
%
  seminorm_error = 0.0;
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
%  The piecewise linear derivative is a constant in the interval.
%
      uxq = ( ur - ul ) / ( xr - xl );

      exq = exact_ux ( xq );

      seminorm_error = seminorm_error + wq * ( uxq - exq )^2;

    end
  end

  seminorm_error = sqrt ( seminorm_error );

  return
end
