function e2 = fem2d_l2_error_linear ( nx, ny, x, y, u, exact )

%*****************************************************************************80
%
%% FEM2D_L2_ERROR_LINEAR estimates the L2 error norm of a finite element solution.
%
%  Discussion:
%
%    The finite element method has been used, over a rectangle,
%    involving a grid of NXxNY nodes, with piecewise linear elements used 
%    for the basis.
%
%    The finite element coefficients have been computed, and a formula for the
%    exact solution is known.
%
%    This function estimates E2, the L2 norm of the error:
%
%      E2 = Integral ( X, Y ) ( U(X,Y) - EXACT(X,Y) )^2 dX dY
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NX, NY, the number of nodes in the X and Y directions.
%
%    Input, real X(NX), Y(NY), the grid coordinates.
%
%    Input, real U(NX,NY), the finite element coefficients.
%
%    Input, function EQ = EXACT(X,Y), returns the value of the exact
%    solution at the point (X,Y).
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
%  Integrate over each interval.
%
  for ex = 1 : nx - 1

    w = ex;
    e = ex + 1;

    xw = x(w);
    xe = x(e);

    for ey = 1 : ny - 1

      s = ey;
      n = ey + 1;

      ys = y(s);
      yn = y(n);

      sw = ( ey - 1 ) * nx + ex;
      se = ( ey - 1 ) * nx + ex + 1;
      nw =   ey       * nx + ex;
      ne =   ey       * nx + ex + 1;

      for qx = 1 : quad_num

        xq = ( ( 1.0 - abscissa(qx) ) * xw   ...
             + ( 1.0 + abscissa(qx) ) * xe ) ...
             / 2.0;

        for qy = 1 : quad_num

          yq = ( ( 1.0 - abscissa(qy) ) * ys   ...
               + ( 1.0 + abscissa(qy) ) * yn ) ...
               / 2.0;

          wq = weight(qx) * ( xe - xw ) / 2.0 ...
             * weight(qy) * ( yn - ys ) / 2.0;

          vsw  = ( xe - xq ) / ( xe - xw ) * ( yn - yq ) / ( yn - ys ); 
          vse  = ( xq - xw ) / ( xe - xw ) * ( yn - yq ) / ( yn - ys ); 
          vnw  = ( xe - xq ) / ( xe - xw ) * ( yq - ys ) / ( yn - ys ); 
          vne  = ( xq - xw ) / ( xe - xw ) * ( yq - ys ) / ( yn - ys ); 
%
%  Note that the south-west component of U is stored in U(W,S), not U(S,W)!
%
          uq = u(w,s) * vsw + u(e,s) * vse + u(w,n) * vnw + u(e,n) * vne;
          eq = exact ( xq, yq );

          e2 = e2 + wq * ( uq - eq )^2;

        end
      end 
    end
  end

  e2 = sqrt ( e2 );

  return
end
