function e2 = fem2d_l2_error_quadratic ( nx, ny, x, y, u, exact )

%*****************************************************************************80
%
%% FEM2D_L2_ERROR_QUADRATIC: L2 error norm of a finite element solution.
%
%  Discussion:
%
%    The finite element method has been used, over a rectangle,
%    involving a grid of NXxNY nodes, with piecewise quadratic elements used 
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
%    23 June 2014
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

  ex_num = ( nx - 1 ) / 2;
  ey_num = ( ny - 1 ) / 2;

  for ex = 1 : ex_num

    w = 2 * ex - 1;
    cc = 2 * ex;
    e = 2 * ex + 1;

    xx(1) = x(w);
    xx(2) = x(cc);
    xx(3) = x(e);

    for ey = 1 : ey_num

      s = 2 * ey - 1;
      mm = 2 * ey;
      n = 2 * ey + 1;

      yy(1) = y(s);
      yy(2) = y(mm);
      yy(3) = y(n);
%
%  Node indices
%
%  7  8  9   wn cn en
%  4  5  6   wm cm em
%  1  2  3   ws cs es
%
      node(1) = ( 2 * ey - 2 ) * nx + ( ex - 1 ) * 2 + 1;
      node(2) = ( 2 * ey - 2 ) * nx + ( ex - 1 ) * 2 + 2;
      node(3) = ( 2 * ey - 2 ) * nx + ( ex - 1 ) * 2 + 3;
      node(4) = ( 2 * ey - 1 ) * nx + ( ex - 1 ) * 2 + 1;
      node(5) = ( 2 * ey - 1 ) * nx + ( ex - 1 ) * 2 + 2;
      node(6) = ( 2 * ey - 1 ) * nx + ( ex - 1 ) * 2 + 3;
      node(7) = ( 2 * ey     ) * nx + ( ex - 1 ) * 2 + 1;
      node(8) = ( 2 * ey     ) * nx + ( ex - 1 ) * 2 + 2;
      node(9) = ( 2 * ey     ) * nx + ( ex - 1 ) * 2 + 3;

      for qx = 1 : quad_num

        xq = ( ( 1.0 - abscissa(qx) ) * xx(1)   ...
             + ( 1.0 + abscissa(qx) ) * xx(3) ) ...
             / 2.0;

        for qy = 1 : quad_num

          yq = ( ( 1.0 - abscissa(qy) ) * yy(1)   ...
               + ( 1.0 + abscissa(qy) ) * yy(3) ) ...
               / 2.0;

          wq = weight(qx) * ( xx(3) - xx(1) ) / 2.0 ...
             * weight(qy) * ( yy(3) - yy(1) ) / 2.0;

          uq = 0.0;

          v = ones ( 9, 1 );
          k = 0;

          for jl = 1 : 3
            for il = 1 : 3

              k = k + 1;

              for il2 = 1 : 3
                if ( il2 ~= il )
                  v(k) = v(k) * ( xq - xx(il2) ) / ( xx(il) - xx(il2) );
                end
              end

              for jl2 = 1 : 3
                if ( jl2 ~= jl )
                  v(k) = v(k) * ( yq - yy(jl2) ) / ( yy(jl) - yy(jl2) );
                end
              end

              uq = uq + u(node(k)) * v(k);

            end
          end

          eq = exact ( xq, yq );
          e2 = e2 + wq * ( uq - eq )^2;
 
        end
      end 
    end
  end

  e2 = sqrt ( e2 );

  return
end
