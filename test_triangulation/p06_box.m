function [ lo, hi ] = p06_box ( m )

%*****************************************************************************80
%
%% P06_BOX returns a bounding box for problem 06.
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
  r1 = 1.0;
  r2 = 0.5;

  lo(1:m) = [ -r1, -r1 ];
  hi(1:m) = [ +r1, +r1 ];

  return
end
