function fixed = p09_fixed_points ( m, fixed_num )

%*****************************************************************************80
%
%% P09_FIXED_POINTS returns the fixed points in problem 09.
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
%    Input, integer FIXED_NUM, the number of fixed points.
%
%    Output, real FIXED(M,FIXED_NUM), the fixed points.
%
  center1 = [ 0.50, 0.50 ];
  center2 = [ 0.25, 0.75 ];
  center3 = [ 0.60, 0.40 ];

  r1 = 0.5;
  r2 = 0.1;
  r3 = 0.1;

  fixed[1:2,1:4] = [ ...
    center1(1) - r1, center1(2) - r1; ...
    center1(1) + r1, center1(2) - r1; ...
    center1(1) + r1, center1(2) + r1; ...
    center1(1) - r1, center1(2) + r1 ]';

  for j = 1 : 6
    angle = ( ( j - 1 ) * 2 ) * pi / 6.0;
    fixed(1,4+j) = center2(1) + r2 * cos ( angle );
    fixed(2,4+j) = center2(2) + r2 * sin ( angle );
  end

  for j = 1 : 6
    angle = ( ( j - 1 ) * 2 ) * pi / 6.0;
    fixed(1,10+j) = center3(1) + r3 * cos ( angle );
    fixed(2,10+j) = center3(2) + r3 * sin ( angle );
  end

  return
end
