function x = ncc_compute_points ( n )

%*****************************************************************************80
%
%% NCC_COMPUTE_POINTS: points of a Newton-Cotes Closed quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2009
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

  if ( n == 1 )

    x(1) = ( x_max + x_min ) / 2.0;

  else

    for i = 1 : n
      x(i) = ( ( n - i     ) * x_min   ...
             + (     i - 1 ) * x_max ) ...
             / ( n     - 1 );
    end

  end

  return
end
