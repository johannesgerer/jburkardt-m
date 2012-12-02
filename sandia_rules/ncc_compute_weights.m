function w = ncc_compute_weights ( n )

%*****************************************************************************80
%
%% NCC_COMPUTE_WEIGHTS: weights of a Newton-Cotes Closed quadrature rule.
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
%    Output, real W(N), the weights.
%
  w = zeros ( n, 1 );
  x = zeros ( n, 1 );

  x_min = -1.0;
  x_max =  1.0;

  if ( n == 1 )

    w(1) = x_max - x_min;

  else

    for i = 1 : n
      x(i) = ( ( n - i     ) * x_min   ...
             + (     i - 1 ) * x_max ) ...
             / ( n     - 1 );
    end

    w = nc_compute ( n, x_min, x_max, x );

  end

  return
end
