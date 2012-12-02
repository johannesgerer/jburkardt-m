function f = extended_rosenbrock ( x )

%*****************************************************************************80
%
%% EXTENDED_ROSENBROCK computes the extended Rosenbrock function.
%
%  Discussion:
%
%    The number of dimensions is arbitrary, except that it must be even.
%
%    There is a global minimum at X* = (1,1,...), F(X*) = 0.
%
%    The contours are sharply twisted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2012
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
%    Input, real X(N), the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  [ n, dim ] = size ( x );

  if ( mod(dim,2) ~= 0 )
    error ( 'Extended Rosenbrock function expects an even-dimensional input.\n' );
  end

  r = zeros ( dim, 1 );

  for i = 1 : 2 : dim - 1
    r(i) = 1.0 - x(i);
    r(i+1) = 10.0 * ( x(i+1) - x(i)^2 );
  end

  f = r' * r;

  return
end
