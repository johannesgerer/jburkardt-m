function g = p09_g ( n, x )

%*****************************************************************************80
%
%% P09_G evaluates the gradient for problem 9.
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

  ap = 0.00001;

  t1 = -1.0;
  for j = 1 : n
    t1 = t1 + ( n - j + 1 ) * x(j)^2;
  end

  d2 = 1.0;
  th = 4.0 * t1;
  s2 = 0.0;
  for j = 1 : n
    g(j) = ( n - j + 1 ) * x(j) * th;
    s1 = exp ( x(j) / 10.0 );
    if ( 1 < j )
      s3 = s1 + s2 - d2 * ( exp ( 0.1 ) + 1.0 );
      g(j) = g(j) + ap * s1 * ( s3 + s1 - 1.0 / exp ( 0.1 ) ) / 5.0;
      g(j-1) = g(j-1) + ap * s2 * s3 / 5.0;
    end
    s2 = s1;
    d2 = d2 * exp ( 0.1 );
  end

  g(1) = g(1) + 2.0 * ( x(1) - 0.2 );

  return
end
