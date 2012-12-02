function fx = helical ( x )

%*****************************************************************************80
%
%% HELICAL evaluates the Fletcher-Powell helical valley function.
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
%    Input, real X(3), the argument.
%
%    Output, real FX, the value of the function.
%
  if ( 0.0 < x(1) )
    theta = atan2 ( x(2), x(1) ) / 2.0 / pi;
  elseif ( x(1) < 0.0 )
    theta = 0.5 + atan2 ( x(2), x(1) ) / 2.0 / pi;
  elseif ( x(1) == 0.0 )
    theta = 0.25;
  end

  fx1 = x(3) - 10.0 * theta;
  fx2 = sqrt ( x(1) * x(1) + x(2) * x(2) );
  fx3 = x(3);

  fx = 100.0 * fx1 * fx1 ...
     +         fx2 * fx2 ...
     +         fx3 * fx3;

  return
end
