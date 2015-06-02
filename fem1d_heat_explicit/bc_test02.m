function h = bc_test02 ( x_num, x, t, h )

%*****************************************************************************80
%
%% BC_TEST02 evaluates the boundary conditions for problem 2.
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
  h(1,1)     = exact_test02 ( 1, x(1),     t );
  h(x_num,1) = exact_test02 ( 1, x(x_num), t );

  return
end
