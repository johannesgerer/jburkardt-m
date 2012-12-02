function f = rosenbrock ( x )

%*****************************************************************************80
%
%% ROSENBROCK computes the Rosenbrock function.
%
%  Discussion:
%
%    There is a global minimum at X* = (1,1), F(X*) = 0.
%
%    The starting point X = [ -1.2, 1.0 ] is suggested.
%
%    The contours are sharply twisted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Howard Rosenbrock,
%    An Automatic Method for Finding the Greatest or Least Value of a Function,
%    Computer Journal,
%    Volume 3, 1960, pages 175-184.
%
%  Parameters:
%
%    Input, real X(2), the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  if ( length ( x ) ~= 2 )
    error  (  'Error: Rosenbrock function expects a two dimensional input.\n' );
  end

  f =         ( 1.0 - x(1) )^2 + ...
      100.0 * ( x(2) - x(1) * x(1) )^2;

  return
end
