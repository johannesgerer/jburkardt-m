function x = ncoh_compute_points ( n )

%*****************************************************************************80
%
%% NCOH_COMPUTE_POINTS computes points for a Newton-Cotes "open half" quadrature rule.
%
%  Discussion:
%
%    The input value N is used to define N equal subintervals of [-1,+1].
%    The I-th abscissa is the center of the I-th subinterval.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Output, real X(N), the abscissas.
%
  x = zeros ( n, 1 );

  x_min = -1.0;
  x_max =  1.0;

  for i = 1 : n
    x(i) = ( ( 2 * n - 2 * i + 1 ) * x_min   ...
           + (         2 * i - 1 ) * x_max ) ...
           / ( 2 * n             );
  end

  return
end
