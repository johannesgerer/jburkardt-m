function h = bc_test03 ( x_num, x, t, h )

%*****************************************************************************80
%
%% BC_TEST03 evaluates the boundary conditions for problem 3.
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
%    Input, real H(X_NUM,1), the current heat values.
%
%    Output, real H(X_NUM,1), the current heat values, after boundary
%    conditions have been imposed.
%
  h(1,1)  = 15.0;
  h(x_num,1) = 25.0;

  return
end
