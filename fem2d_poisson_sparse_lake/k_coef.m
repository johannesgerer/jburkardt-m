function node_k = k_coef ( node_num, node_xy )

%*****************************************************************************80
%
%% K_COEF evaluates the coefficient K(X,Y) of U in the Poisson equation.
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
%    15 July 2010
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
%    Output, real NODE_K(NODE_NUM,1),
%    the value of the coefficient of U.
%
  node_k(1:node_num,1) = 1.0;

  return
end
