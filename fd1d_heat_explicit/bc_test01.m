function h = bc_test01 ( x_num, x, t, h )

%*****************************************************************************80
%
%% BC_TEST01 evaluates the boundary conditions for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 January 2012
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
%    Input, real H(X_NUM,1), the current heat values.
%
%    Output, real H(X_NUM,1), the current heat values, after boundary
%    conditions have been imposed.
%
  h(1,1)     = 90.0;
  h(x_num,1) = 70.0;

  return
end
