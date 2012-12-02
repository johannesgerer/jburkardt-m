function f = p08_f ( x )

%*****************************************************************************80
%
%% P08_F evaluates the objective function for problem 8.
%
%  Discussion:
%
%    This function looks positive, but has a pole at x = pi,
%    near which f -> negative infinity, and has two zeroes nearby.
%    None of this will show up computationally.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arnold Krommer, Christoph Ueberhuber,
%    Numerical Integration on Advanced Systems,
%    Springer, 1994, pages 185-186.
%
%  Parameters:
%
%    Input, real X, the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  if ( x == pi )
    f = - 10000.0;
  else
    f = 3.0 * x .* x + 1.0 + ( log ( ( x - pi ) .* ( x - pi ) ) ) / pi^4;
  end

  return
end
