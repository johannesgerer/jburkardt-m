function u = fem2d_bvp_serene ( nx, ny, a, c, f, x, y, show11 )

%*****************************************************************************80
%
%% FEM2D_BVP_SERENE solves boundary value problem on a rectangle.
%
%  Discussion:
%
%    The program uses the finite element method, with piecewise 
%    serendipity basis functions to solve a 2D boundary value problem 
%    over a rectangle.
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
%    The local element numbering is
%
%      3--2--1
%      |     |
%      4     8
%      |     |
%      5--6--7
%
%    The serendipity element mass matrix is a multiple of:
%
%       6.0, -6.0,  2.0, -8.0,  3.0, -8.0,  2.0, -6.0
%      -6.0, 32.0, -6.0, 20.0, -8.0, 16.0, -8.0, 20.0
%       2.0, -6.0,  6.0, -6.0,  2.0, -8.0,  3.0, -8.0
%      -8.0, 20.0, -6.0, 32.0, -6.0, 20.0, -8.0, 16.0
%       3.0, -8.0,  2.0, -6.0,  6.0, -6.0,  2.0, -8.0
%      -8.0, 16.0, -8.0, 20.0, -6.0, 32.0, -6.0, 20.0
%       2.0, -8.0,  3.0, -8.0,  2.0, -6.0,  6.0, -6.0
%      -6.0, 20.0, -8.0, 16.0, -8.0, 20.0, -6.0, 32.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2014
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
%    Input, integer SHOW11, is 1 to print out the element matrix
%    for the element in row 1, column 1.
%
%    Output, real U(MN), the finite element coefficients, which are also
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
  mn = fem2d_bvp_serene_node_num ( nx, ny );

  A = zeros ( mn, mn );
  b = zeros ( mn, 1 );
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

      if ( show11 )
        if ( ey == 1 && ex == 1 )
          ae = zeros(8,8);
          be = zeros(8,1);
        end
      end

      if ( 0 )
        fprintf ( 1, '  %2d  %2d  %2d  %2d  %2d  %2d  %2d  %2d\n', node(1:8) );
      end

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
          [ vx, vy ] = basisd_serene ( xq, yq, xw, ys, xe, yn, xx, yy );

          aq = a ( xq, yq );
          cq = c ( xq, yq );
          fq = f ( xq, yq );
%
%  Build the element matrix.
%
          if ( show11 ) 
            if ( ey == 1 && ex == 1 )
              for i = 1 : 8
                for j = 1 : 8
                  ae(i,j) = ae(i,j) + wq * ( vx(i) * aq * vx(j) ...
                                           + vy(i) * aq * vy(j) ...
                                           + v(i)  * cq * v(j) );
                end
                be(i) = be(i) + wq * ( v(i) * fq );
              end       
            end
          end

          for i = 1 : 8
            ii = node(i);
            for j = 1 : 8
              jj = node(j);
              A(ii,jj) = A(ii,jj) + wq * ( vx(i) * aq * vx(j) ...
                                         + vy(i) * aq * vy(j) ...
                                         + v(i)  * cq * v(j) );
            end
            b(ii) = b(ii) + wq * ( v(i) * fq );
          end

        end
      end 
%
%  Print a sample element matrix.
%
      if ( show11 ) 
        if ( ey == 1 && ex == 1 )
          scale = 0.5 * ae(1,3);
          fprintf ( 1, '\n' );
          fprintf ( 1, '  The Wathen elementary mass matrix:\n' );
          fprintf ( 1, '\n' );
          ae / scale
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

    if ( mod ( y, 2 ) == 1 )
      xhi = nx;
    else
      xhi = 1 + ( nx - 1 ) / 2;
    end

    for x = 1 : 2 : xhi
      k = k + 1;
      if ( x == 1 | x == xhi | y == 1 | y == ny )
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

  return
end

