function [ ur, vr, pr ] = resid_stokes3 ( n, x, y )

%*****************************************************************************80
%
%% RESID_STOKES3 returns residuals of the exact Stokes solution #3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Howard Elman, Alison Ramage, David Silvester,
%    Finite Elements and Fast Iterative Solvers with
%    Applications in Incompressible Fluid Dynamics,
%    Oxford, 2005,
%    ISBN: 978-0198528678,
%    LC: QA911.E39.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), Y(N), the coordinates of the points.
%
%    Output, real UR(N), VR(N), PR(N), the residuals in the U,
%    V and P equations.
%
  ur = zeros ( n, 1 );
  vr = zeros ( n, 1 );
  pr = zeros ( n, 1 );
%
%  Get the right hand sides.
%
  [ f, g, h ] = rhs_stokes3 ( n, x, y );
%
%  Form the functions and derivatives.
%
  for i = 1 : n

    u =   20.0 * x(i) * y(i) .^ 3;
    ux = 20.0 * y(i) .^ 3;
    uxx = 0.0;
    uy = 60.0 * x(i) * y(i) .^ 2;
    uyy = 120.0 * x(i) * y(i);

    v = 5.0 * ( x(i) .^ 4 - y(i) .^ 4 );
    vx = 20.0 * x(i) .^ 3;
    vxx = 60.0 * x(i) .^ 2;
    vy = - 20.0 * y(i) .^ 3;
    vyy = - 60.0 * y(i) .^ 2;

    p =   60.0 * x(i) .^ 2 * y(i) - 20.0 * y(i) .^ 3 + 10.0;
    px = 120.0 * x(i) * y(i);
    py =  60.0 * x(i) .^ 2 - 60.0 * y(i) .^ 2;

    ur(i) = px - ( uxx + uyy ) - f(i);
    vr(i) = py - ( vxx + vyy ) - g(i);
    pr(i) = ux + vy - h(i);

  end

  return
end
