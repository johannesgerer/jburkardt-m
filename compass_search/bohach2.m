function f = bohach2 ( m, x )

%*****************************************************************************80
%
%% BOHACH2 evaluates the Bohachevsky function #2.
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
%      X = [ 0.6, 1.3 ];
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2012
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
%    Input, integer M, the number of variables.
%
%    Input, real X(M), the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  f =       x(1) * x(1) ... 
    + 2.0 * x(2) * x(2) ...
    - 0.3 * cos ( 3.0 * pi * x(1) ) * cos ( 4.0 * pi * x(2) ) ...
    + 0.3;

  return
end
