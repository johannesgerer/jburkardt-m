function x = nco_compute_points ( n )

%*****************************************************************************80
%
%% NCO_COMPUTE_POINTS: points for a Newton-Cotes Open quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Output, real X(N), the abscissas.
%
  x_min = -1.0;
  x_max =  1.0;

  x = zeros ( n, 1 );

  for i = 1 : n
    x(i) = ( ( n - i + 1 ) * x_min   ...
           + (     i     ) * x_max ) ...
           / ( n     + 1 );
  end

  return
end
