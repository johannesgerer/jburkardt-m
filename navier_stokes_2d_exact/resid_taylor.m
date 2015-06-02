function [ ur, vr, pr ] = resid_taylor ( nu, rho, n, x, y, t )

%*****************************************************************************80
%
%% RESID_TAYLOR returns residuals of the Taylor exact Navier Stokes solution.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_2d_exact/resid_taylor.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Geoffrey Taylor,
%    On the decay of vortices in a viscous fluid,
%    Philosophical Magazine,
%    Volume 46, 1923, pages 671-674.
%
%    Geoffrey Taylor, A E Green,
%    Mechanism for the production of small eddies from large ones,
%    Proceedings of the Royal Society of London, 
%    Series A, Volume 158, 1937, pages 499-521.
%
%  Parameters:
%
%    Input, real NU, the kinematic viscosity.
%
%    Input, real RHO, the density.
%
%    Input, integer N, the number of points at which the solution is to
%    be evaluated.
%
%    Input, real X(N), Y(N), the coordinates of the points.
%
%    Input, real T or T(N), the time coordinate or coordinates.
%
%    Output, real UR(N), VR(N), PR(N), the residuals in the U, V and P equations.
%

%
%  Get the right hand sides.
%
  [ f, g, h ] = rhs_taylor ( nu, rho, n, x, y, t );
%
%  Make some temporaries.
%
  cx = cos ( pi * x );
  cy = cos ( pi * y );

  sx = sin ( pi * x );
  sy = sin ( pi * y );

  e2t = exp ( - 2.0 * pi * pi * nu * t );

  c2x = cos ( 2.0 * pi * x );
  c2y = cos ( 2.0 * pi * y );

  s2x = sin ( 2.0 * pi * x );
  s2y = sin ( 2.0 * pi * y );

  e4t = exp ( - 4.0 * pi * pi * nu * t );
%
%  Form the functions and derivatives for the left hand side.
%
  u    =  -                      cx .* sy .* e2t;
  dudx =                    pi * sx .* sy .* e2t;
  dudxx =              pi * pi * cx .* sy .* e2t;
  dudy =  -                 pi * cx .* cy .* e2t;
  dudyy =              pi * pi * cx .* sy .* e2t;
  dudt =  + 2.0 * nu * pi * pi * cx .* sy .* e2t;

  v    =                         sx .* cy .* e2t;
  dvdx =                    pi * cx .* cy .* e2t;
  dvdxx = -            pi * pi * sx .* cy .* e2t;
  dvdy =  -                 pi * sx .* sy .* e2t;
  dvdyy = -            pi * pi * sx .* cy .* e2t;
  dvdt =  - 2.0 * nu * pi * pi * sx .* cy .* e2t;

  p =     - 0.25 * rho *    ( c2x + c2y ) .* e4t;
  dpdx =  + 0.5  * rho * pi * s2x         .* e4t;
  dpdy =  + 0.5  * rho * pi       * s2y   .* e4t;
%
%  Evaluate the residuals.
%
  ur = dudt + u .* dudx + v .* dudy + ( 1.0 / rho ) * dpdx ...
     - nu * ( dudxx + dudyy ) - f;

  vr = dvdt + u .* dvdx + v .* dvdy + ( 1.0 / rho ) * dpdy ...
     - nu * ( dvdxx + dvdyy ) - g;

  pr = dudx + dvdy - h;

  return
end

