function v = basis_serene ( xq, yq, xw, ys, xe, yn, xx, yy )

%*****************************************************************************80
%
%% BASIS_SERENE evaluates the serendipity basis functions.
%
%  Discussion:
%
%    This procedure assumes that a serendipity element has been defined,
%    whose sides are parallel to coordinate axes.
%
%    The local element numbering is
%
%      YN  3--2--1
%       |  |     |
%       |  4     8
%       |  |     |
%      YS  5--6--7
%       |
%       +--XW---XE--
%
%    We note that each basis function can be written as the product of
%    three linear terms, which never result in an x^2y^2 term.
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
%    Input, real XQ, YQ, the evaluation point.
%
%    Input, real XW, YS, the coordinates of the lower left corner.
%
%    Input, real XE, YN, the coordinates of the upper right corner.
%
%    Input, real XX(8), YY(8), the coordinates of the 8 nodes.
%
%    Output, real V(8), the value of the basis functions at (XQ,YQ).
%
  v = zeros(8,1);

  v(1) = not1 ( xq, xw, xx(1) ) ...
       * not1 ( yq, ys, yy(1) ) ...
       * not2 ( xq, yq, xx(8), yy(8), xx(2), yy(2), xx(1), yy(1) );

  v(2) = not1 ( xq, xw, xx(2) ) ...
       * not1 ( xq, xe, xx(2) ) ...
       * not1 ( yq, ys, yy(2) );

  v(3) = not1 ( xq, xe, xx(3) ) ...
       * not1 ( yq, ys, yy(3) ) ...
       * not2 ( xq, yq, xx(2), yy(2), xx(4), yy(4), xx(3), yy(3) );

  v(4) = not1 ( xq, xe, xx(4) ) ...
       * not1 ( yq, yn, yy(4) ) ...
       * not1 ( yq, ys, yy(4) );

  v(5) = not1 ( xq, xe, xx(5) ) ...
       * not1 ( yq, yn, yy(5) ) ...
       * not2 ( xq, yq, xx(4), yy(4), xx(6), yy(6), xx(5), yy(5) );

  v(6) = not1 ( xq, xe, xx(6) ) ...
       * not1 ( xq, xw, xx(6) ) ...
       * not1 ( yq, yn, yy(6) );

  v(7) = not1 ( xq, xw, xx(7) ) ...
       * not1 ( yq, yn, yy(7) ) ...
       * not2 ( xq, yq, xx(6), yy(6), xx(8), yy(8), xx(7), yy(7) );

  v(8) = not1 ( yq, ys, yy(8) ) ...
       * not1 ( yq, yn, yy(8) ) ...
       * not1 ( xq, xw, xx(8) );

  return
end
