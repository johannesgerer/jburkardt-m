function [ nptsoutout, xs2, ys2, ws2 ] = quaenodes2 ( nptsout, xsout, ...
  ysout, wsout )

%*****************************************************************************80
%
%% QUAENODES2 expands nodes from 1/6 to 1/3 of the triangle.
%
%  Discussion:
%
%    This routine only expands to 1/3 of the triangle, assuming the points are
%    already in the lower-left 1/6 of the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    28 June 2014
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

    elseif ( xsout(i)^2 < eps )

      ntot = ntot + 1;
      xs2(ntot) = xsout(i);
      ys2(ntot) = ysout(i);
      ws2(ntot) = wsout(i);

    else

      ntot = ntot + 1;
      xs2(ntot) = -xsout(i);
      ys2(ntot) = ysout(i);
      ws2(ntot) = wsout(i) / 2.0;

      ntot = ntot + 1;
      xs2(ntot) = xsout(i);
      ys2(ntot) = ysout(i);
      ws2(ntot) = wsout(i) / 2.0;

    end

  end

  nptsoutout = ntot;

  return
end
