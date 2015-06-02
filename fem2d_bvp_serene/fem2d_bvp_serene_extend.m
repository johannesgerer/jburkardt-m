function uu = fem2d_bvp_serene_extend ( nx, ny, x, y, u )

%*****************************************************************************80
%
%% FEM2D_BVP_SERENE_EXTEND extends the solution to a grid.
%
%  Discussion:
%
%    The serendipity grid has "holes".  This procedure takes a solution
%    on the serendipity grid and uses finite element interpolation to
%    evaluate the solution at the "holes".
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
%    Input, real X(NX), Y(NY), the mesh points.
%
%    Input, real U(*), the solution, associated with the nodes of the
%    serendipity grid.
%
%    Output, real UU(NX,NY), the solution, associated with the nodes of
%    the NX by NY grid, with missing values filled in by interpolation.
%
  uu = zeros(nx,ny);

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

      xq = x(cc);
      yq = y(mm);

      v = basis_serene ( xq, yq, xw, ys, xe, yn, xx, yy );

      uq = 0.0;
      for k = 1 : 8
        uq = uq + u(node(k)) * v(k);
      end
%
%  Doing things this way means that many values get set twice or even four times.
%  The simplest alternative would mean that some values get set NEVER.
%
      uu(e,n)   = u(node(1));
      uu(cc,n)  = u(node(2));
      uu(w,n)   = u(node(3));
      uu(w,mm)  = u(node(4));
      uu(w,s)   = u(node(5));
      uu(cc,s)  = u(node(6));
      uu(e,s)   = u(node(7));
      uu(e,mm)  = u(node(8));
      uu(cc,mm) = uq;

    end
  end

  return
end
