function gdif = p00_gdif ( problem, n, x )

%*****************************************************************************80
%
%% P00_GDIF approximates the gradient via finite differences.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the point where the gradient
%    is to be approximated.
%
%    Output, real GDIF(N), the approximated gradient vector.
%
  tol = eps^0.33;

  for i = 1 : n

    if ( 0.0 <= x(i) )
      dx = eps * ( x(i) + 1.0 );
    else
      dx = eps * ( x(i) - 1.0 );
    end

    xi = x(i);
    x(i) = xi + dx;
    fplus = p00_f ( problem, n, x );

    x(i) = xi - dx;
    fminus = p00_f ( problem, n, x );

    gdif(i) = ( fplus - fminus ) / ( 2.0 * dx );

    x(i) = xi;

  end

  return
end
