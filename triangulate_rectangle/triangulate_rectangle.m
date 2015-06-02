function [ xy, elem ] = triangulate_rectangle ( xl, xr, xn, yb, yt, yn, base )

%*****************************************************************************80
%
%% TRIANGULATE_RECTANGLE makes a triangular grid of a rectangle.
%
%  Discussion:
%
%    The rectangle is presumed to lie between (XL,YB) and (XR,YT).
%
%    We subdivide the rectangle into XN regions in the X direction,
%    and YN regions in the Y direction, and then split each quadrilateral,
%    creating 2 * XN * YN triangular elements.
%
%    The locations of the NN=(XN+1)*(YN+1) nodes are stored in the 2 by NN
%    real array XY.
%
%    The triples of node indices that make up each triangle are stored int
%    the 3 by NE integer array ELEM.  Here, NE = 2 * XN * YN, and the
%    nodes are stored in counterclockwise order.  The node indices will
%    begin at 0 if the input quantity BASE is set to 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XL, XR, the left and right X limits.
%
%    Input, integer XN, the number of elements along the X direction.
%
%    Input, real YB, YT, the bottom and top Y limits.
%
%    Input, integer YN, the number of elements along the Y direction.
%
%    Input, integer BASE, the indexing base:
%    0, the first node has index 0.
%    1, the first node has index 1.
%
  if ( nargin < 7 )
    base = 1;
  end
%
%  Generate 1D data.
%
  x1d = linspace ( xl, xr, xn + 1 );
  y1d = linspace ( yb, yt, yn + 1 );
%
%  Create (X,Y) table.
%  This can be done faster, using meshgrid, but then you lose control
%  of ordering and arranging.
%
  xyn = ( xn + 1 ) * ( yn + 1 );
  xy = zeros ( 2, xyn );

  k = 0;
  for j = 1 : yn + 1
    for i = 1 : xn + 1
      k = k + 1;
      xy(1,k) = x1d(i);
      xy(2,k) = y1d(j);
    end
  end
%
%  Create connectivity.
%
  en = 2 * xn * yn;
  elem = zeros ( 3, en );
  e = 0;

  for j = 1 : yn
    for i = 1 : xn
      sw = ( j - 1 ) * ( xn + 1 ) + i;
      se = ( j - 1 ) * ( xn + 1 ) + i + 1;
      ne = ( j     ) * ( xn + 1 ) + i + 1;
      nw = ( j     ) * ( xn + 1 ) + i;
      e = e + 1;
      elem(1,e) = sw;
      elem(2,e) = se;
      elem(3,e) = nw;
      e = e + 1;
      elem(1,e) = ne;
      elem(2,e) = nw;
      elem(3,e) = se;
    end
  end
%
%  Shift base if requested.
%
  if ( base == 0 )
    elem = elem - 1;
  end

  return
end

