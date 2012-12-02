function g = p20_g ( n, x )

%*****************************************************************************80
%
%% P20_G evaluates the gradient for problem 20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real G(N), the gradient of the objective function.
%
  g = zeros ( n, 1 );

  for i = 1 : n

    if ( i == 1 )
      g(i) = x(i);
    else
      g(i) = 2.0 * x(i);
    end

    if ( 1 < i )
      g(i) = g(i) - x(i-1);
    end

    if ( i < n )
      g(i) = g(i) - x(i+1);
    end

  end

  g(1) = g(1) - 2.0;

  return
end
