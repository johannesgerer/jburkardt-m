function node_h = h_coef ( node_num, node_xy )

%*****************************************************************************80
%
%% H_COEF evaluates the coefficient H(X,Y) of DEL U in the Poisson equation.
%
%  Discussion:
%
%    The equation is
%
%      - Del H(X,Y) DEL U + K(X,Y) * U = RHS(X,Y)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM),
%    the coordinates of the points.
%
%    Output, real NODE_H(NODE_NUM,1),
%    the value of the coefficient of DEL U.
%
  node_h(1:node_num,1) = 1.0;

  return
end
