function g = p07_g ( n, x )

%*****************************************************************************80
%
%% P07_G evaluates the gradient for problem 7.
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
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real G(N), the gradient of the objective function.
%
  g = zeros ( n, 1 );

  for i = 1 : 29

    d1 = i / 29.0;
    s1 = 0.0;
    d2 = 1.0;
    for j = 2 : n
      s1 = s1 + ( j - 1 ) * d2 * x(j);
      d2 = d2 * i / 29.0;
    end

    s2 = 0.0;
    d2 = 1.0;
    for j = 1 : n
      s2 = s2 + d2 * x(j);
      d2 = d2 * i / 29.0;
    end

    t = s1 - s2 * s2 - 1.0;
    s3 = 2.0 * s2 * i / 29.0;
    d2 = 2.0 / d1;

    for j = 1 : n
      g(j) = g(j) + d2 * ( ( j - 1 ) - s3 ) * t;
      d2 = d2 * i / 29.0;
    end

  end

  t1 = x(2) - x(1) * x(1) - 1.0;

  g(1) = g(1) + 2.0 * x(1) - 4.0 * x(1) * t1;
  g(2) = g(2) + 2.0 * t1;

  return
end
