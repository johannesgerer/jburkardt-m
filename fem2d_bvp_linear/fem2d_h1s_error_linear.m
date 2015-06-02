function h1s = fem2d_h1s_error_linear ( nx, ny, x, y, u, exact_ux, exact_uy )

%*****************************************************************************80
%
%% FEM2D_H1S_ERROR_LINEAR: seminorm error of a finite element solution.
%
%  Discussion:
%
%    We assume the finite element method has been used, over a product region
%    involving a grid of NX*NY nodes, with piecewise linear elements used 
%    for the basis.
%
%    The finite element solution U(x,y) has been computed, and formulas for the
%    exact derivatives Vx(x,y) and Vy(x,y) are known.
%
%    This function estimates the H1 seminorm of the error:
%
%      H1S = sqrt ( integral ( x, y )   ( Ux(x,y) - Vx(x,y) )^2 
%                                     + ( Uy(x,y) - Vy(x,y) )^2 dx dy )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NX, NY, the number of nodes.
%
%    Input, real X(NX), Y(NY), the grid coordinates.
%
%    Input, real U(NX,NY), the finite element coefficients.
%
%    Input, function EQX = EXACT_UX(X,Y), function EQY = EXACT_UY(X,Y)
%    returns the exact derivatives with respect to X and Y.
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
%  Make room for the matrix A and right hand side b.
%
  mn = nx * ny;
  A = zeros ( mn, mn );
  b = zeros ( mn, 1 );

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

          vswx = (    -1.0 ) / ( xe - xw ) * ( yn - yq ) / ( yn - ys ); 
          vswy = ( xe - xq ) / ( xe - xw ) * (    -1.0 ) / ( yn - ys ); 

          vsex = ( 1.0     ) / ( xe - xw ) * ( yn - yq ) / ( yn - ys ); 
          vsey = ( xq - xw ) / ( xe - xw ) * (    -1.0 ) / ( yn - ys ); 

          vnwx = (    -1.0 ) / ( xe - xw ) * ( yq - ys ) / ( yn - ys ); 
          vnwy = ( xe - xq ) / ( xe - xw ) * ( 1.0     ) / ( yn - ys ); 

          vnex = ( 1.0     ) / ( xe - xw ) * ( yq - ys ) / ( yn - ys ); 
          vney = ( xq - xw ) / ( xe - xw ) * ( 1.0     ) / ( yn - ys ); 
%
%  Note that the south-west component of U is stored in U(W,S), not U(S,W)!
%
          uxq = u(w,s) * vswx + u(e,s) * vsex + u(w,n) * vnwx + u(e,n) * vnex;
          uyq = u(w,s) * vswy + u(e,s) * vsey + u(w,n) * vnwy + u(e,n) * vney;

          exq = exact_ux ( xq, yq );
          eyq = exact_uy ( xq, yq );

          h1s = h1s + wq * ( ( uxq - exq )^2 + ( uyq - eyq )^2 );

        end
      end 
    end
  end

  h1s = sqrt ( h1s );

  return
end
