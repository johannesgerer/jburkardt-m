function [ x_num, x, fx, t_num, t ] = cull_pure_triangles ( x_num, x, ...
  fx, t_num, t )

%*****************************************************************************80
%
%% CULL_PURE_TRIANGLES drops signed triangles (all vertices same sign).
%
%  Discussion:
%
%    Given a triangulation T, an array of node coordinates X, and the value of 
%    a function F at every node, remove those "pure" triangles for which 
%    F has the same sign at all three vertices.
%
%    Having removed the pure triangles, now remove all nodes X which belong 
%    only to pure triangles, and remove the corresponding entries of F.
%
%    Adjust X, F and T to reflect the removal of the unwanted information.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real X(2,X_NUM), the node coordinates.
%
%    Input, real FX(X_NUM), the function values.
%
%    Input, integer T_NUM, the number of triangles.
%
%    Input, integer T(3,T_NUM), the node indices forming each triangle.
%
%    Output, integer X_NUM, the updated number of nodes.
%
%    Output, real X(2,X_NUM), the updated node coordinates.
%
%    Output, real FX(X_NUM), the updated function values.
%
%    Output, integer T_NUM, the updated number of triangles.
%
%    Output, integer T(3,T_NUM), the updated node indices forming each triangle.
%

%
%  ANY checks on columns, so we have to transpose FX(T) so that we get
%  the answer we need.
%
%  Keep only those triangles with at least one nonnegative node.
%
  keep = any ( 0.0 <= fx(t) );
  t = t(:,keep);
%
%  Keep only those triangles with at least one nonpositive node.
%
  keep = any ( fx(t) <= 0.0 );
  t = t(:,keep);
%
%  Count them.
%
  t_num = size ( t, 2 );
%
%  Determine the nodes what are needed by the new T, implicitly renumber
%  them, and modify T to refer to the new labels.
%
  i = unique ( t );
  j = length ( i );
  ip(i) = 1:j;
  t = ip ( t );
%
%  Only keep those nodes needed by T.
%
  x = x(:,i);
  x_num = size ( x, 2 );
%
%  Only keep function values that are needed.
%
  fx = fx(i);

  return
end
