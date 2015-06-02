function u = fem2d_bvp_quadratic ( nx, ny, a, c, f, x, y )

%*****************************************************************************80
%
%% FEM2D_BVP_QUADRATIC solves boundary value problem on a rectangle.
%
%  Discussion:
%
%    The program uses the finite element method, with piecewise quadratic basis
%    functions to solve a 2D boundary value problem over a rectangle.
%
%    The following differential equation is imposed inside the region:
%
%      - d/dx a(x,y) du/dx - d/dy a(x,y) du/dy + c(x,y) * u(x,y) = f(x,y)
%
%    where a(x,y), c(x,y), and f(x,y) are given functions.
%
%    On the boundary, the solution is constrained to have the value 0.
%
%    The finite element method will use a regular grid of NX nodes in X, and 
%    NY nodes in Y.  Both NX and NY must be odd.
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
%    Input, integer NX, NY, the number of X and Y grid values.
%    NX and NY must be odd and at least 3.
%
%    Input, function A(X,Y), evaluates a(x,y);
%
%    Input, function C(X,Y), evaluates c(x,y);
%
%    Input, function F(X,Y), evaluates f(x,y);
%
%    Input, real X(NX), Y(NY), the mesh points.
%
%    Output, real U(NX,NY), the finite element coefficients, which are also
%    the value of the computed solution at the mesh points.
%

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
%
%  Compute the matrix entries by integrating over each element.
%
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
%
%  Need to AUTOMATE THIS PROCEDURE.
%
%         v(1) =  ( xq - x(2) ) / ( x(1) - x(2) ) ...
%               * ( xq - x(3) ) / ( x(1) - x(3) ) ...
%               * ( yq - y(2) ) / ( y(1) - y(2) ) ...
%               * ( yq - y(3) ) / ( y(1) - y(3) );

%         vx(1) =           1.0 / ( x(1) - x(2) )  ...
%               * ( xq - x(3) ) / ( x(1) - x(3) ) ...
%               * ( yq - y(2) ) / ( y(1) - y(2) ) ...
%               * ( yq - y(3) ) / ( y(1) - y(3) ) ...
%               + ( xq - x(2) ) / ( x(1) - x(2) ) ...
%               *           1.0 / ( x(1) - x(3) ) ...
%               * ( yq - y(2) ) / ( y(1) - y(2) ) ...
%               * ( yq - y(3) ) / ( y(1) - y(3) );

%         vy(1) = ( xq - x(2) ) / ( x(1) - x(2) ) ...
%               * ( xq - x(3) ) / ( x(1) - x(3) ) ...
%               *          1.0  / ( y(1) - y(2) ) ...
%               * ( yq - y(3) ) / ( y(1) - y(3) ) ...
%               + ( xq - x(2) ) / ( x(1) - x(2) ) ...
%               * ( xq - x(3) ) / ( x(1) - x(3) ) ...
%               * ( yq - y(2) ) / ( y(1) - y(2) ) ...
%               *           1.0 / ( y(1) - y(3) );

          v = ones ( 9, 1 );
          vx = zeros ( 9, 1 );
          vy = zeros ( 9, 1 );

          k = 0;

          for jl = 1 : 3
            for il = 1 : 3

              k = k + 1;

              for il2 = 1 : 3
                if ( il2 ~= il )
                  v(k) = v(k) * ( xq - xx(il2) ) / ( xx(il) - xx(il2) );
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
                  v(k) = v(k) * ( yq - yy(jl2) ) / ( yy(jl) - yy(jl2) );
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

            end
          end

          aq = a ( xq, yq );
          cq = c ( xq, yq );
          fq = f ( xq, yq );

          for i = 1 : 9
            ii = node(i);
            for j = 1 : 9
              jj = node(j);
              A(ii,jj) = A(ii,jj) + wq * ( vx(i) * aq * vx(j) ...
                                         + vy(i) * aq * vy(j) ...
                                         + v(i)  * cq * v(j) );
            end
            b(ii) = b(ii) + wq * ( v(i) * fq );
          end
 
        end
      end 
    end
  end
%
%  Where a node is on the boundary, 
%  replace the finite element equation by a boundary condition.
%
  k = 0;
  for y = 1 : ny
    for x = 1 : nx
      k = k + 1;
      if ( x == 1 | x == nx | y == 1 | y == ny )
        A(k,1:mn) = 0.0;
        A(1:mn,k) = 0.0;
        A(k,k) = 1.0;
        b(k) = 0.0;
      end
    end
  end

  if ( 0 )
    spy ( A );
    pause
  end
%
%  Solve the linear system.
%
  u = A \ b;
%
%  Make the vector U into a matrix.
%  Hope that of the various possible reorderings, you and MATLAB agree.
%
%    U(matrix)   U(vector)
%   ----------  ----------
%    U11 U12  =>  U11
%    U21 U22      U21
%                 U12
%                 U22
%
  u = reshape ( u, nx, ny );

  return
end
