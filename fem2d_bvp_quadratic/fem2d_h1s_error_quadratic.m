function h1s = fem2d_h1s_error_quadratic ( nx, ny, x, y, u, exact_ux, exact_uy )

%*****************************************************************************80
%
%% FEM2D_H1S_ERROR_QUADRATIC: seminorm error of a finite element solution.
%
%  Discussion:
%
%    We assume the finite element method has been used, over a product region
%    involving a grid of NX*NY nodes, with piecewise quadratic elements used 
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
%    23 June 2014
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

          uxq = 0.0;
          uyq = 0.0;

          vx = zeros ( 9, 1 );
          vy = zeros ( 9, 1 );

          k = 0;

          for jl = 1 : 3
            for il = 1 : 3

              k = k + 1;

              for il2 = 1 : 3
                if ( il2 ~= il )
                  t = 1.0 / ( xx(il) - xx(il2 ) );
                  for il3 = 1 : 3
                    if ( il3 ~= il & il3 ~= il2 )
                      t = t * ( xq - xx(il3) ) / ( xx(il) - xx(il3) );
                    end
                  end
                  for jl2 = 1 : 3
                    if ( jl2 ~= jl )
                      t = t * ( yq - yy(jl2) ) / ( yy(jl) - yy(jl2) );
                    end
                  end
                  vx(k) = vx(k) + t;
                end
              end

              for jl2 = 1 : 3
                if ( jl2 ~= jl )
                  t = 1.0 / ( yy(jl) - yy(jl2 ) );
                  for il2 = 1 : 3
                    if ( il2 ~= il )
                      t = t * ( xq - xx(il2) ) / ( xx(il) - xx(il2) );
                    end
                  end
                  for jl3 = 1 : 3
                    if ( jl3 ~= jl & jl3 ~= jl2 )
                      t = t * ( yq - yy(jl3) ) / ( yy(jl) - yy(jl3) );
                    end
                  end
                  vy(k) = vy(k) + t;
                end
              end

              uxq = uxq + u(node(k)) * vx(k);
              uyq = uyq + u(node(k)) * vy(k);

            end
          end

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
