function g = p06_g ( n, x )

%*****************************************************************************80
%
%% P06_G evaluates the gradient for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
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

  f1 = 0.0;
  for i = 1 : n
    f1 = f1 + i * ( x(i) - 1.0 );
  end

  for i = 1 : n
    df1dxi = i;
    df2dxi = 2.0 * ( x(i) - 1.0 );
    g(i) = ( 2.0 * f1 + 4.0 * f1^3 ) * df1dxi + df2dxi;
  end

  return
end
