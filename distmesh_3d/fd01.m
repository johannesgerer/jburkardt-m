function d = fd01 ( p )

%*****************************************************************************80
%
%% FD01 is a signed distance function for problem 1.
%
%  Discussion:
%
%    The formula used here is not quite correct.  In particular, it is wrong
%    for points exterior to the cube whose nearest point on the cube is at a corner.
%
%    For DISTMESH_3D's purposes, though, this computation is accurate enough.
%
%  Modified:
%
%    12 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P(N,3), one or more points.
%
%    Output, real D(N), the signed distance of each point to the boundary of the region.
%
  d = - min ( min ( min ( min ( min ( -0.0+p(:,3), 1.0-p(:,3) ), ...
                                     -0.0+p(:,2) ), ...
                                      1.0-p(:,2) ), ...
                                     -0.0+p(:,1) ), ...
                                      3.0-p(:,1) );

  return
end
