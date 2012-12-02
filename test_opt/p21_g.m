function g = p21_g ( n, x )

%*****************************************************************************80
%
%% P21_G evaluates the gradient for problem 21.
%
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
%    Output, real G(N), the gradient of the objective function.
%
  g = zeros ( n, 1 );

  for i = 1 : n

    g(i) = 0.0;
    for j = 1 : n
      g(i) = g(i) + 2.0 * x(j) / ( i + j - 1 );
    end

  end

  return
end
