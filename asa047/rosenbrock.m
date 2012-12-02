function fx = rosenbrock ( x )

%*****************************************************************************80
%
%% ROSENBROCK evaluates the Rosenbrock parabolic value function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    R ONeill,
%    Algorithm AS 47:
%    Function Minimization Using a Simplex Procedure,
%    Applied Statistics,
%    Volume 20, Number 3, 1971, pages 338-345.
%
%  Parameters:
%
%    Input, real X(2), the argument.
%
%    Output, real FX, the value of the function.
%
  fx1 = x(2) - x(1) * x(1);
  fx2 = 1.0 - x(1);

  fx = 100.0 * fx1 * fx1 ...
     +         fx2 * fx2;

  return
end
