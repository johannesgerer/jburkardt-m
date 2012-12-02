function [ x_num, x, fx, t_num, t ] = cull_negative_triangles ( x_num, x, ...
  fx, t_num, t )

%*****************************************************************************80
%
%% CULL_NEGATIVE_TRIANGLES drops negative triangles from a triangulation.
%
%  Discussion:
%
%    Given a triangulation T, an array of node coordinates X, and the value of 
%    a function F at every node, remove those triangles for which F is negative 
%    at all three vertices.
%
%    Remove any nodes X which belong only to "negative" triangles, and remove
%    the corresponding entries of F.
%
%    Adjust X, F and T to reflect the removal of the unwanted information.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real X(X_NUM,2), the node coordinates.
%
%    Input, real FX(X_NUM), the function values.
%
%    Input, integer T_NUM, the number of triangles.
%
%    Input, integer T(T_NUM,3), the node indices forming each triangle.
%
%    Output, integer X_NUM, the updated number of nodes.
%
%    Output, real X(X_NUM,2), the updated node coordinates.
%
%    Output, real FX(X_NUM), the updated function values.
%
%    Output, integer T_NUM, the updated number of triangles.
%
%    Output, integer T(T_NUM,3), the updated node indices forming each triangle.
%

%
%  ANY checks on columns, so we have to transpose FX(T) so that we get
%  the answer we need.
%
  keep = any ( 0 <= fx(t)' );
%
%  Select only those triangles with at least one nonnegative node.
% 
  t = t(keep',:);
  t_num = length ( t );
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
  x = x(i,:);
  x_num = length ( x );
%
%  Only keep function values that are needed.
%
  fx = fx(i);

  return
end
