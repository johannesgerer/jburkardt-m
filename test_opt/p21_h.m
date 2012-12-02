function h = p21_h ( n, x )

%*****************************************************************************80
%
%% P21_H evaluates the Hessian for problem 21.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2000
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
    for j = 1 : n
      h(i,j) = 2.0 / ( i + j - 1 );
    end
  end 

  return
end
