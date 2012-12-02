function f = p06_f ( m, n, x )

%*****************************************************************************80
%
%% P06_F evaluates the objective function for problem 06.
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
%    Hans-Paul Schwefel,
%    Numerical optimization of computer models,
%    Wiley, 1981,
%    ISBN13: 978-0471099888,
%    LC: QA402.5.S3813.
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
    f(j) = - sum ( x(1:m,j) .* sin ( sqrt ( abs ( x(1:m,j) ) ) ) );
  end

  return
end
