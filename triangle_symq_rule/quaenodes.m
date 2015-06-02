function [ nptsoutout, xs2, ys2, ws2 ] = quaenodes ( nptsout, xsout, ysout, ...
  wsout )

%*****************************************************************************80
%
%% QUAENODES expands nodes to the reference triangle.
%
%  Discussion:
%
%    This routine expands nodes to the reference triangle
%    assuming that the points are already in the lower-left 1/6 of the
%    triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    26 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer NPTSOUT, the number of points expanded.
%
%    Input, real XSOUT(NPTSOUT), YSOUT(NPTSOUT), WSOUT(NPTSOUT),
%    the coordinates and weights of the points to be expanded.
%
%    Output, integer NPTSOUTPUT, the number of points in the expanded set.
%
%    Output, real XS2(NPTSOUTOUT), YS2(NPTSOUTOUT), WS2(NPTSOUTOUT),
%    the coordinates and weights of the expanded set of points.
%
  ntot = 0;

  for i = 1 : nptsout

    if ( xsout(i)^2 + ysout(i)^2 < eps )

      ntot = ntot + 1;
      xs2(ntot) = xsout(i);
      ys2(ntot) = ysout(i);
      ws2(ntot) = wsout(i);

    elseif ( xsout(i)^2 < eps | ...
      abs ( ysout(i) - xsout(i) / sqrt ( 3.0 ) ) < sqrt ( eps ) )


      x0 = xsout(i);
      y0 = ysout(i);
      w0 = wsout(i) / 3.0;

      ntot = ntot + 1;
      xs2(ntot) = x0;
      ys2(ntot) = y0;
      ws2(ntot) = w0;

      ntot = ntot + 1;
      [ x1, y1 ] = quaerotate ( x0, y0 );
      xs2(ntot) = x1;
      ys2(ntot) = y1;
      ws2(ntot) = w0;

      ntot = ntot + 1;
      [ x2, y2 ] = quaerotate ( x1, y1 );
      xs2(ntot) = x2;
      ys2(ntot) = y2;
      ws2(ntot) = w0;

    else

      x0 = xsout(i);
      y0 = ysout(i);
      w0 = wsout(i) / 6.0;

      ntot = ntot + 1;
      xs2(ntot) = x0;
      ys2(ntot) = y0;
      ws2(ntot) = w0;

      ntot = ntot + 1;
      [ x1, y1 ] = quaerotate ( x0, y0 );
      xs2(ntot) = x1;
      ys2(ntot) = y1;
      ws2(ntot) = w0;

      ntot = ntot + 1;
      [ x2, y2 ] = quaerotate ( x1, y1 );
      xs2(ntot) = x2;
      ys2(ntot) = y2;
      ws2(ntot) = w0;

      ntot = ntot + 1;
      xs2(ntot) = -x0;
      ys2(ntot) = y0;
      ws2(ntot) = w0;

      ntot = ntot + 1;
      [ x1, y1 ] = quaerotate ( -x0, y0 );
      xs2(ntot) = x1;
      ys2(ntot) = y1;
      ws2(ntot) = w0;

      ntot = ntot + 1;
      [ x2, y2 ] = quaerotate ( x1, y1 );
      xs2(ntot) = x2;
      ys2(ntot) = y2;
      ws2(ntot) = w0;

    end

  end

  nptsoutout = ntot;

  return
end
