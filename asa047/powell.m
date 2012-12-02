function fx = powell ( x )

%*****************************************************************************80
%
%% POWELL evaluates the Powell quartic function.
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
%    Input, real X(4), the argument.
%
%    Output, real FX, the value of the function.
%
  fx1 = x(1) + 10.0 * x(2);
  fx2 = x(3) - x(4);
  fx3 = x(2) - 2.0 * x(3);
  fx4 = x(1) - x(4);

  fx =        fx1 * fx1 ...
     +  5.0 * fx2 * fx2 ...
     +        fx3 * fx3 * fx3 * fx3 ...
     + 10.0 * fx4 * fx4 * fx4 * fx4;

  return
end
