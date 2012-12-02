function x = hcc_compute_points ( n )

%*****************************************************************************80
%
%% HCC_COMPUTE_POINTS: abscissas of a Hermite-Cubic-Chebyshev-Spacing rule.
%
%  Discussion:
%
%    For the HCC rule, we assume that an interval has been divided by
%    M nodes X into Chebyshev-spaced subintervals, and that at each
%    abscissa both function and derivative information is available.
%    The piecewise cubic Hermite interpolant is constructed for this data.
%    The quadrature rule uses N = 2 * M abscissas, where each node is
%    listed twice, and the weights occur in pairs, with the first multiplying
%    the function value and the second the derivative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2011
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
  if ( mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HCC_COMPUTE_POINTS - Fatal error!\n' );
    fprintf ( 1, '  Order of rule N is not even.\n' );
    error ( 'HCC_COMPUTE_POINTS - Fatal error!' );
  end

  m = floor ( n / 2 );

  x = zeros ( n, 1 );

  if ( m == 1 )
    x(1:2) = 0.0;
    return
  end

  j = 0;
  for i = 1 : m

    if ( i == 1 )
      x_value = - 1.0;
    elseif ( 2 * i - 1 == m )
      x_value = 0.0;
    elseif ( i == m )
      x_value = 0.0;
    else
      x_value = cos ( ( m - i ) * pi / ( m - 1 ) );
    end

    j = j + 1;
    x(j)   = x_value;
    j = j + 1;
    x(j) = x_value;

  end

  return
end
