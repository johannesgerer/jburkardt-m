function h = exact_test02 ( x_num, x, t )

%*****************************************************************************80
%
%% EXACT_TEST02 evaluates the exact solution for problem 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 February 2012
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
%    Output, real H(X_NUM,1), the exact solution at X and T.
%
  k = k_test02 ( x_num, x, t );

  h(1:x_num,1) = exp ( - t ) * sin ( sqrt ( k(1:x_num,1) ) .* x(1:x_num,1) );

  return
end
