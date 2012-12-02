function [ wgauss, xgauss, ygauss ] = p11_gauss ( hside, xmid, ymid )

%*****************************************************************************80
%
%% P11_GAUSS returns the Gauss quadrature abscissas and weights.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real HSIDE, the length of a side of the square.
%
%    Input, real XMID, YMID, the coordinates of the center of the square.
%
%    Output, real WGAUSS(4), the weights of the Gauss points.
%    The weights are normalized for a square of unit area.
%
%    Output, real XGAUSS(4), YGAUSS(4), the coordinates of the
%    Gauss points.
%
  alfa = 1.0 / ( 2.0 * sqrt ( 3.0 ) );

  wgauss(1:4) = 0.25;

  xgauss(1) = xmid - alfa * hside;
  xgauss(2) = xmid + alfa * hside;
  xgauss(3) = xmid - alfa * hside;
  xgauss(4) = xmid + alfa * hside;

  ygauss(1) = ymid - alfa * hside;
  ygauss(2) = ymid - alfa * hside;
  ygauss(3) = ymid + alfa * hside;
  ygauss(4) = ymid + alfa * hside;

  return
end
