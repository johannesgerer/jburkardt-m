function d = fd02 ( p )

%*****************************************************************************80
%
%% FD02 is a signed distance function for problem 2.
%
%  Discussion:
%
%    The formula used here is not quite correct.  In particular, it is wrong
%    for points exterior to the cylinder whose nearest point on the cylinder 
%    is on one of the circular rims.
%
%    For DISTMESH_3D's purposes, though, this computation is accurate enough.
%
%  Modified:
%
%    15 September 2005
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
  d = - min ( min ( -0.0+p(:,3), 4.0-p(:,3) ), ...
              1.0 - sqrt ( sum ( p(:,1:2).^2, 2 ) ) );

  return
end
