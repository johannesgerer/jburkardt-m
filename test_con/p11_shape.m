function [ psi, dpsidx, dpsidy ] = p11_shape ( hside, xmid, xval, ymid, yval )

%*****************************************************************************80
%
%% P11_SHAPE evaluates the shape functions for problem 11.
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
%    Input, real XMID, the X coordinate of the center of the square.
%
%    Input, real XVAL, the X coordinate of the point where the shape
%    functions are to be evaluated.
%
%    Input, real YMID, the Y coordinate of the center of the square.
%
%    Input, real YVAL, the Y coordinate of the point where the shape
%    functions are to be evaluated.
%
%    Output, real PSI(4), the value of PSI (the shape functions) at
%    (XVAL,YVAL).  The shape functions are stored in the order
%    SW, SE, NW, NE.
%
%    Output, real DPSIDX(4), DPSIDY(4), the values of dPSI/dX and dPSI/dY
%    at (XVAL,YVAL).
%

%
%  Set coordinates.
%
  xleft = xmid - 0.5 * hside;
  xrite = xmid + 0.5 * hside;
  ybot = ymid - 0.5 * hside;
  ytop = ymid + 0.5 * hside;
%
%  Evaluate the shape functions.
%
  psi(1) =   ( xval - xrite ) * ( yval - ytop ) / hside / hside;
  psi(2) = - ( xval - xleft ) * ( yval - ytop ) / hside / hside;
  psi(3) = - ( xval - xrite ) * ( yval - ybot ) / hside / hside;
  psi(4) =   ( xval - xleft ) * ( yval - ybot ) / hside / hside;
%
%  Evaluate the partial derivatives.
%
  dpsidx(1) =   ( yval - ytop ) / hside / hside;
  dpsidx(2) = - ( yval - ytop ) / hside / hside;
  dpsidx(3) = - ( yval - ybot ) / hside / hside;
  dpsidx(4) =   ( yval - ybot ) / hside / hside;

  dpsidy(1) =   ( xval - xrite ) / hside / hside;
  dpsidy(2) = - ( xval - xleft ) / hside / hside;
  dpsidy(3) = - ( xval - xrite ) / hside / hside;
  dpsidy(4) =   ( xval - xleft ) / hside / hside;

  return
end
