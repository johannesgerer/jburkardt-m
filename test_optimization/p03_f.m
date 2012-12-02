function f = p03_f ( m, n, x )

%*****************************************************************************80
%
%% P03_F evaluates the objective function for problem 03.
%
%  Discussion:
%
%    This function is also known as the weighted sphere model.
%
%    The function is continuous, convex, and unimodal.
%
%     There is a typographical error in Molga and Smutnicki, so that the
%     formula for this function is given incorrectly.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marcin Molga, Czeslaw Smutnicki,
%    Test functions for optimization needs.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(M,N), the arguments.
%
%    Output, real F(N), the function evaluated at the arguments.
%
  f = zeros ( n, 1 );

  for j = 1 : n

    f(j) = 0.0;
    x_sum = 0.0;

    for i = 1 : m
      x_sum = x_sum + x(i,j);
      f(j) = f(j) + x_sum^2;
    end

  end

  return
end
