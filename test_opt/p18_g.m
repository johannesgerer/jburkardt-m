function g = p18_g ( n, x )

%*****************************************************************************80
%
%% P18_G evaluates the gradient for problem 18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 March 2000
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
%
%  Compute FVEC.
%
  fvec = p18_fvec ( n, x );
%
%  Compute G.
%
  for j = 1 : n
    g(j) = 0.0;
    t1 = 1.0;
    t2 = 2.0 * x(j) - 1.0;
    t = 2.0 * t2;
    s1 = 0.0;
    s2 = 2.0;
    for i = 1 : n
      g(j) = g(j) + fvec(i) * s2;
      th = 4.0 * t2 + t * s2 - s1;
      s1 = s2;
      s2 = th;
      th = t * t2 - t1;
      t1 = t2;
      t2 = th;
    end
  end

  g(1:n) = 2.0 * g(1:n) / n;

  return
end
