function fixed = p08_fixed_points ( m, fixed_num )

%*****************************************************************************80
%
%% P08_FIXED_POINTS returns the fixed points in problem 08.
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
%    Output, real FIXED(M,FIXED_NUM), the coordinates 
%    of the fixed points.
%
  a = ( sqrt ( 119.0 ) - 9.0 ) / 20.0;
  c = cos ( pi / 12.0 );
  s = sin ( pi / 12.0 );

  fixed(1:2,1:6) = [ ...
    0.0,      0.0;   ...
    c,       -s;     ...
    0.9 + a, -a;     ...
    0.9,      0.0;   ...
    0.9 + a,  a;     ...
    c,        s   ]';

  return
end
