function h1s = h1s_error_linear ( n, x, u, exact_ux )

%*****************************************************************************80
%
%% H1S_ERROR_LINEAR: seminorm error of a finite element solution.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/fem1d_bvp_linear/h1s_error_linear.m
%
%  Discussion:
%
%    We assume the finite element method has been used, over an interval [A,B]
%    involving N nodes, with piecewise linear elements used for the basis.
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
%    Output, real H1S, the estimated seminorm of the error.
%
  h1s = 0.0;
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

      h1s = h1s + wq * ( uxq - exq )^2;

    end
  end

  h1s = sqrt ( h1s );

  return
end
