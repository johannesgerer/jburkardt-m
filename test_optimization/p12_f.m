function f = p12_f ( m, n, x )

%*****************************************************************************80
%
%% P12_F evaluates the objective function for problem 12.
%
%  Discussion:
%
%    In dimension I, the function is a piecewise linear function with
%    local minima at 0 and 1.0, and a global minimum at ALPHA(I) = I/(M+1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marcin Molga, Czeslaw Smutnicki,
%    Test functions for optimization needs.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(M,N), the arguments.
%
%    Output, real F(N), the function evaluated at the arguments.
%
  f = zeros ( n, 1 );

  beta = 2.0;
%
%  I'm just choosing ALPHA in [0,1] arbitrarily.
%
  for i = 1 : m
    alpha(i) = i / ( m + 1 );
  end

  for j = 1 : n

    f(j) = 0.0;

    for i = 1 : m

      if ( x(i,j) <= 0.0 )
        g = x(i,j);
      elseif ( x(i,j) <= 0.8 * alpha(i) )
        g = 0.8 - x(i,j) / alpha(i);
      elseif ( x(i,j) <= alpha(i) )
        g = 5.0 * x(i,j) / alpha(i) - 4.0;
      elseif ( x(i,j) <= ( 1.0 + 4.0 * alpha(i) ) / 5.0 )
        g = 1.0 + 5.0 * ( x(i,j) - alpha(i) ) / ( alpha(i) - 1.0 );
      elseif ( x(i,j) <= 1.0 )
        g = 0.8 + ( x(i,j) - 1.0 ) / ( 1.0 - alpha(i) );
      else
        g = x(i,j) - 1.0;
      end

      f(j) = f(j) + g;

    end

    f(j) = f(j) / m;
    f(j) = - ( f(j)^beta );

  end

  return
end
