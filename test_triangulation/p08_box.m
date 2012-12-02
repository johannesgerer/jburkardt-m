function [ lo, hi ] = p08_box ( m )

%*****************************************************************************80
%
%% P08_BOX returns a bounding box for problem 08.
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
%    Output, real ( kind = 8 ) LO(DIMENSION), HI(DIMENSION), coordinates of the
%    low and high corners of the box.
%
  s = sin ( pi / 12.0 );

  lo(1:m) = [  0.0, -s ];
  hi(1:m) = [  1.0, +s ];

  return
end
