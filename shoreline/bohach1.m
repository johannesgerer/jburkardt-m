function fx = bohach1 ( n, x )

%*****************************************************************************80
%
%% BOHACH1 evaluates the Bohachevsky function #1.
%
%  Discussion:
%
%    The minimizer is
%
%      X* = [ 0.0, 0.0 ]
%      F(X*) = 0.0
%
%    Suggested starting point:
%
%      X init = [ 0.5, 1.0 ];
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Zbigniew Michalewicz,
%    Genetic Algorithms + Data Structures = Evolution Programs,
%    Third Edition,
%    Springer Verlag, 1996,
%    ISBN: 3-540-60676-9,
%    LC: QA76.618.M53.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N,2), the argument of the function.
%
%    Output, real FX(N), the value of the function at X.
%
  fx = zeros ( n, 1 );

  fx =    - x(:,1).^2 - 0.3 * cos ( 3.0 * pi * x(:,1) ) ...
    - 2.0 * x(:,2).^2 - 0.4 * cos ( 4.0 * pi * x(:,2) ) ...
    - 0.7 ...
    + 0.8 * ones ( n, 1 );

  return
end
