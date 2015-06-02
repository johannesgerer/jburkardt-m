function e2 = fem2d_l2_error_serene ( nx, ny, x, y, u, exact )

%*****************************************************************************80
%
%% FEM2D_L2_ERROR_SERENE: L2 error norm of a finite element solution.
%
%  Discussion:
%
%    The finite element method has been used, over a rectangle,
%    involving a grid of NXxNY nodes, with serendipity elements used 
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
%    29 June 2014
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
%    Input, real U(*), the finite element coefficients.
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
%  Compute the matrix entries by integrating over each element.
%
  ex_num = ( nx - 1 ) / 2;
  ey_num = ( ny - 1 ) / 2;

  for ey = 1 : ey_num

    s = 2 * ey - 1;
    mm = 2 * ey;
    n = 2 * ey + 1;

    ys = y(s);
    ym = y(mm);
    yn = y(n);

    yy(1) = y(n);
    yy(2) = y(n);
    yy(3) = y(n);
    yy(4) = y(mm);
    yy(5) = y(s);
    yy(6) = y(s);
    yy(7) = y(s);
    yy(8) = y(mm);

    for ex = 1 : ex_num

      w = 2 * ex - 1;
      cc = 2 * ex;
      e = 2 * ex + 1;

      xe = x(e);
      xc = x(cc);
      xw = x(w);

      xx(1) = x(e);
      xx(2) = x(cc);
      xx(3) = x(w);
      xx(4) = x(w);
      xx(5) = x(w);
      xx(6) = x(cc);
      xx(7) = x(e);
      xx(8) = x(e);
%
%  Node indices
%
%  3  2  1  wn  cn  en
%  4     8  wm      em
%  5  6  7  ws  cs  es
%
      node(1) = ( 3 * ey     ) * ey_num + 2 * ey + 2 * ex + 1;
      node(2) = ( 3 * ey     ) * ey_num + 2 * ey + 2 * ex;
      node(3) = ( 3 * ey     ) * ey_num + 2 * ey + 2 * ex - 1;
      node(4) = ( 3 * ey - 1 ) * ey_num + 2 * ey +     ex - 1;
      node(5) = ( 3 * ey - 3 ) * ey_num + 2 * ey + 2 * ex - 3;
      node(6) = ( 3 * ey - 3 ) * ey_num + 2 * ey + 2 * ex - 2;
      node(7) = ( 3 * ey - 3 ) * ey_num + 2 * ey + 2 * ex - 1;
      node(8) = ( 3 * ey - 1 ) * ey_num + 2 * ey +     ex;

      for qx = 1 : quad_num

        xq = ( ( 1.0 - abscissa(qx) ) * x(e)   ...
             + ( 1.0 + abscissa(qx) ) * x(w) ) ...
               / 2.0;

        for qy = 1 : quad_num

          yq = ( ( 1.0 - abscissa(qy) ) * y(n)   ...
               + ( 1.0 + abscissa(qy) ) * y(s) ) ...
                 / 2.0;

          wq = weight(qx) * ( x(e) - x(w) ) / 2.0 ...
             * weight(qy) * ( y(n) - y(s) ) / 2.0;

          v = basis_serene ( xq, yq, xw, ys, xe, yn, xx, yy );

          uq = 0.0;
          for k = 1 : 8
            uq = uq + u(node(k)) * v(k);
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
