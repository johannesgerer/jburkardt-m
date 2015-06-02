function k_value = k_test03 ( x_num, x, t )

%*****************************************************************************80
%
%% K_TEST03 evaluates the conductivity for problem 3.
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
%    Input, integer X_NUM, the number of evaluation points.
%
%    Input, real X(X_NUM,1), the evaluation points.
%
%    Input, real T, the evaluation time.
%
%    Output, real K_VALUE(X_NUM,1), the value of K(X,T).
%
  k_value(1:x_num,1) = 2.0;

  return
end
