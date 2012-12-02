function g = p11_g ( n, x )

%*****************************************************************************80
%
%% P11_G evaluates the gradient for problem 11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2000
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

  for i = 1 : 20

    c = i / 5.0;

    f1 = x(1) + c * x(2) - exp ( c );
    f2 = x(3) + sin ( c ) * x(4) - cos ( c );

    df1dx1 = 1.0;
    df1dx2 = c;
    df2dx3 = 1.0;
    df2dx4 = sin ( c );

    g(1) = g(1) + 4.0 * ( f1^3 * df1dx1 + f1 * f2 * f2 * df1dx1 );
    g(2) = g(2) + 4.0 * ( f1^3 * df1dx2 + f1 * f2 * f2 * df1dx2 );
    g(3) = g(3) + 4.0 * ( f1 * f1 * f2 * df2dx3 + f2^3 * df2dx3 );
    g(4) = g(4) + 4.0 * ( f1 * f1 * f2 * df2dx4 + f2^3 * df2dx4 );

  end

  return
end
