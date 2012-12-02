function fixed = p07_fixed_points ( m, fixed_num )

%*****************************************************************************80
%
%% P07_FIXED_POINTS returns the fixed points in problem 07.
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
  temp = 5.0 * pi / 2.0;

  fixed = [ ...
   -temp, 0.0; ...
    temp, 0.0 ]';

  return
end
