function h = p22_h ( n, x )

%*****************************************************************************80
%
%% P22_H evaluates the Hessian for problem 22.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 December 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  for i = 1 : n
    h(i,i) = 2.0;
  end

  return
end
