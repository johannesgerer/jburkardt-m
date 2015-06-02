function u = fem2d_bvp_linear ( nx, ny, a, c, f, x, y )

%*****************************************************************************80
%
%% FEM2D_BVP_LINEAR solves boundary value problem on a rectangle.
%
%  Discussion:
%
%    The program uses the finite element method, with piecewise linear basis
%    functions to solve a 2D boundary value problem over a rectangle
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
%    NY nodes in Y.
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
%    Input, integer NX, NY, the number of X and Y grid values.
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
          vswx = (    -1.0 ) / ( xe - xw ) * ( yn - yq ) / ( yn - ys ); 
          vswy = ( xe - xq ) / ( xe - xw ) * (    -1.0 ) / ( yn - ys ); 

          vse  = ( xq - xw ) / ( xe - xw ) * ( yn - yq ) / ( yn - ys ); 
          vsex = ( 1.0     ) / ( xe - xw ) * ( yn - yq ) / ( yn - ys ); 
          vsey = ( xq - xw ) / ( xe - xw ) * (    -1.0 ) / ( yn - ys ); 

          vnw  = ( xe - xq ) / ( xe - xw ) * ( yq - ys ) / ( yn - ys ); 
          vnwx = (    -1.0 ) / ( xe - xw ) * ( yq - ys ) / ( yn - ys ); 
          vnwy = ( xe - xq ) / ( xe - xw ) * ( 1.0     ) / ( yn - ys ); 

          vne  = ( xq - xw ) / ( xe - xw ) * ( yq - ys ) / ( yn - ys ); 
          vnex = ( 1.0     ) / ( xe - xw ) * ( yq - ys ) / ( yn - ys ); 
          vney = ( xq - xw ) / ( xe - xw ) * ( 1.0     ) / ( yn - ys ); 

          aq = a ( xq, yq );
          cq = c ( xq, yq );
          fq = f ( xq, yq );

          A(sw,sw) = A(sw,sw) + wq * ( vswx * aq * vswx ...
                                     + vswy * aq * vswy ...
                                     + vsw  * cq * vsw );
          A(sw,se) = A(sw,se) + wq * ( vswx * aq * vsex ...
                                     + vswy * aq * vsey ...
                                     + vsw  * cq * vse );
          A(sw,nw) = A(sw,nw) + wq * ( vswx * aq * vnwx ...
                                     + vswy * aq * vnwy ...
                                     + vsw  * cq * vnw );
          A(sw,ne) = A(sw,ne) + wq * ( vswx * aq * vnex ...
                                     + vswy * aq * vney ...
                                     + vsw  * cq * vne );
          b(sw) =    b(sw)    + wq * ( vsw * fq );

          A(se,sw) = A(se,sw) + wq * ( vsex * aq * vswx ...
                                     + vsey * aq * vswy ...
                                     + vse  * cq * vsw );
          A(se,se) = A(se,se) + wq * ( vsex * aq * vsex ...
                                     + vsey * aq * vsey ...
                                     + vse  * cq * vse );
          A(se,nw) = A(se,nw) + wq * ( vsex * aq * vnwx ...
                                     + vsey * aq * vnwy ...
                                     + vse  * cq * vnw );
          A(se,ne) = A(se,ne) + wq * ( vsex * aq * vnex ...
                                     + vsey * aq * vney ...
                                     + vse  * cq * vne );
          b(se) =    b(se)    + wq * ( vse * fq );

          A(nw,sw) = A(nw,sw) + wq * ( vnwx * aq * vswx ...
                                     + vnwy * aq * vswy ...
                                     + vnw  * cq * vsw );
          A(nw,se) = A(nw,se) + wq * ( vnwx * aq * vsex ...
                                     + vnwy * aq * vsey ...
                                     + vnw  * cq * vse );
          A(nw,nw) = A(nw,nw) + wq * ( vnwx * aq * vnwx ...
                                     + vnwy * aq * vnwy ...
                                     + vnw  * cq * vnw );
          A(nw,ne) = A(nw,ne) + wq * ( vnwx * aq * vnex ...
                                     + vnwy * aq * vney ...
                                     + vnw  * cq * vne );
          b(nw) =    b(nw)    + wq * ( vnw * fq );

          A(ne,sw) = A(ne,sw) + wq * ( vnex * aq * vswx ...
                                     + vney * aq * vswy ...
                                     + vne  * cq * vsw );
          A(ne,se) = A(ne,se) + wq * ( vnex * aq * vsex ...
                                     + vney * aq * vsey ...
                                     + vne  * cq * vse );
          A(ne,nw) = A(ne,nw) + wq * ( vnex * aq * vnwx ...
                                     + vney * aq * vnwy ...
                                     + vne  * cq * vnw );
          A(ne,ne) = A(ne,ne) + wq * ( vnex * aq * vnex ...
                                     + vney * aq * vney ...
                                     + vne  * cq * vne );
          b(ne) =    b(ne)    + wq * ( vne * fq );

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
