function value = quad_fun ( n )

%*****************************************************************************80
%
%% QUAD_FUN demonstrates MATLAB's PARFOR command for parallel programming.
%
%  Discussion:
%
%    This function estimates an integral using the composite trapezoidal rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points to use.
%
%    Output, real VALUE, the estimate for the integral.
%
  a = 0.0;
  b = 1.0;

  value = 0.0;
  h = ( b - a ) / ( n - 1 );

  parfor i = 1 : n

    x = ( ( n - i ) * a + ( i - 1 ) * b ) / ( n - 1 );

    fx = f ( x );

    if ( i == 1 )
      value = value + 0.5 * fx * h
    elseif ( i < n )
      value = value +       fx * h;
    elseif ( i == n )
      value = value + 0.5 * fx * h;
    end

  end

  return
end
function value = f ( x )

%*****************************************************************************80
%
%% F is the function to be integrated.
%
%  Discussion:
%
%    The integral of F(X) from 0 to 1 is exactly PI.
%
%  Modified:
%
%    17 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the values where the integrand is to be evaluated.
%
%    Output, real VALUE, the integrand values.
%
  value = 4.0 ./ ( 1 + x.^2 );

  return
end
