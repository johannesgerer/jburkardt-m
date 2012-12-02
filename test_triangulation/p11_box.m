function [ lo, hi ] = p11_box ( m )

%*****************************************************************************80
%
%% P11_BOX returns a bounding box for problem 11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Output, real LO(M), HI(M), the low and high corners of the box.
%
  lo(1:m) = [  0.0,  0.0 ];
  hi(1:m) = [ +1.0, +1.0 ];

  return
end
