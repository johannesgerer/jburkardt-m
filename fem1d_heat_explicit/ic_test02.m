function h = ic_test02 ( x_num, x, t )

%*****************************************************************************80
%
%% IC_TEST02 evaluates the initial condition for problem 2.
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
%    Input, real T, the initial time.
%
%    Output, real H(X_NUM,1), the heat values at the initial time.
%
  h(1:x_num,1) = exact_test02 ( x_num, x, t );

  return
end
