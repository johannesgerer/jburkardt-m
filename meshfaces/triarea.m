function A = triarea(p,t)

%*****************************************************************************80
%
% TRIAREA: Area of triangles assuming counter-clockwise (CCW) node ordering.
%
%  P  : Nx2 array of XY node co-ordinates
%  T  : Mx3 array of triangles as indices into P
%  A  : Mx1 array of triangle areas
%
%  Author:
%
%    Darren Engwirda
%
  d12 = p(t(:,2),:)-p(t(:,1),:);
  d13 = p(t(:,3),:)-p(t(:,1),:);
  A = 0.5 * (d12(:,1).*d13(:,2)-d12(:,2).*d13(:,1));

  return
end
