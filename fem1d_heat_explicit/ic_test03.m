function h = ic_test03 ( x_num, x, t )

%*****************************************************************************80
%
%% IC_TEST03 evaluates the initial condition for problem 3.
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
  i = ( x(1:x_num) < 0.0 );
  j = ( x(1:x_num) == 0.0 );
  k = ( x(1:x_num) > 0.0 );

  h(i,1) = 15.0;
  h(j,1) = 20.0;
  h(k,1) = 25.0;

  return
end
