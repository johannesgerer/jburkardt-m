function [ lo, hi ] = p04_box ( m )

%*****************************************************************************80
%
%% P04_BOX returns a bounding box for problem 04.
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
%
%  Once again, some moronic feature of MATLAB means I cannot type
%    lo(1:m) = [ -r1, -r1 * sqrt ( 3.0 ) / 2.0 ];
%  because "WRONG NUMBER OF ARGUMENTS FOR SQRT".  Oh really?
%
  lo(1) = -r1;
  lo(2) = -r1 * sqrt ( 3.0 ) / 2.0;
  hi(1) = +r1;
  hi(2) = +r1 * sqrt ( 3.0 ) / 2.0;

  return
end
