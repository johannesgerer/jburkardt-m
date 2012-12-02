function f = f01_f0 ( n, x, y )

%*****************************************************************************80
%
%% F01_F0 returns the value of function 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), Y(N,1), the evalution points.
%
%    Output, real F(N,1), the function values.
%
  f(1:n,1) = ...
      0.75 * exp ( - ( ( 9.0 * x(1:n,1) - 2.0 ).^2            ...
                     + ( 9.0 * y(1:n,1) - 2.0 ).^2 ) / 4.0 )  ...
    + 0.75 * exp ( - ( ( 9.0 * x(1:n,1) + 1.0 ).^2 ) / 49.0   ...
                     - ( 9.0 * y(1:n,1) + 1.0 ) / 10.0 )      ...
    + 0.5  * exp ( - ( ( 9.0 * x(1:n,1) - 7.0 ).^2            ...
                     + ( 9.0 * y(1:n,1) - 3.0 ).^2 ) / 4.0 )  ...
    - 0.2  * exp ( - (   9.0 * x(1:n,1) - 4.0 ).^2            ...
                     - ( 9.0 * y(1:n,1) - 7.0 ).^2 );

  return
end
