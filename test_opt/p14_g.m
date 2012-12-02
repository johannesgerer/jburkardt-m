function g = p14_g ( n, x )

%*****************************************************************************80
%
%% P14_G evaluates the gradient for problem 14.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2000
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

  for j = 1 : n

    if ( mod ( j, 2 ) == 1 )
      g(j) = - 2.0 * ( 1.0 - x(j) );
    else
      g(j) = 200.0 * ( x(j) - x(j-1) * x(j-1) );
      g(j-1) = g(j-1) - 400.0 * x(j-1) * ( x(j) - x(j-1) * x(j-1) );
    end

  end

  return
end
