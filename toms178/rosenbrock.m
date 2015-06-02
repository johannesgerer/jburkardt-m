function value = rosenbrock ( x, n )

%*****************************************************************************80
%
%% ROSENBROCK evaluates the Rosenbrock function.
%
%  Discussion:
%
%    The Hooke and Jeeves algorithm works reasonably well on
%    Rosenbrock's test function, depending on the value of RHO chosen.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(N), the argument of the function.
%
%    Input, integer N, the spatial dimension.
%
%    Output, real VALUE, the value of the function.
%
  value = 100.0 * ( x(2) - x(1) * x(1) )^2 ...
             +    ( 1.0 - x(1) )^2;

  return
end
