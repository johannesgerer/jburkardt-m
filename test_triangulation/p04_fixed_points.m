function fixed = p04_fixed_points ( m, fixed_num )

%*****************************************************************************80
%
%% P04_FIXED_POINTS returns the fixed points in problem 04.
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
  r1 = 1.0;
  r2 = 0.5;

  j = 0;

  for i = 0 : 5
    angle = ( 2 * ( i - 1 ) ) * pi / 6.0;
    j = j + 1;
    fixed(1,j) = r1 * cos ( angle );
    fixed(2,j) = r1 * sin ( angle );
  end

  for i = 6 : -1 : 1
    angle = ( 2 * i - 1 ) * pi / 6.0
    j = j + 1;
    fixed(1,j) = r2 * cos ( angle );
    fixed(2,j) = r2 * sin ( angle );
  end

  return
end
