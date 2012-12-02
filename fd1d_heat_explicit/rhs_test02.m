function value = rhs_test02 ( x_num, x, t )

%*****************************************************************************80
%
%% RHS_TEST02 evaluates the right hand side for problem 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real X(X_NUM,1), the node coordinates.
%
%    Input, real T, the current time.
%
%    Output, real VALUE(X_NUM,1), the source term.
%
  value(1:x_num,1) = 0.0;

  return
end
