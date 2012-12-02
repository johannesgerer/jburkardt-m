function h = p42_h ( n, x )

%*****************************************************************************80
%
%% P42_H evaluates the Hessian for problem 42.
%
%  Discussion:
%
%    I haven't written this yet.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2002
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
  h(1:n,1:n) = zeros ( n, n );

  return
end
