function v = t_project_value_ab ( m, n, x, c, a, b )

%*****************************************************************************80
%
%% T_PROJECT_VALUE_AB evaluates an expansion in Chebyshev polynomials T(n,x).
%
%  Discussion:
%
%    The projection is assumed to be based on the interval [A,B].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest order polynomial to compute.
%
%    Input, real X(M,1), the evaluation points.
%
%    Input, real C(N+1,1), the expansion coefficients.
%
%    Input, real A, B, the interval of definition.
%
%    Output, real V(M,1), the value of the Chebyshev function.
%

%
%  Blasted X and C must be column vectors.
%
  c = c(:);
  x = x(:);

  b1 = zeros(m,1);
  b0 = zeros(m,1);

  for j = n : -1 : 0
    b2(1:m,1) = b1(1:m,1);
    b1(1:m,1) = b0(1:m,1);
    b0(1:m,1) = c(j+1) + 2.0 / ( b - a ) * ( 2.0 * x(1:m) - a - b ) .* b1(1:m,1) - b2(1:m,1);
  end

  v(1:m,1) = 0.5 * ( c(1) + b0(1:m,1) - b2(1:m,1) );

  return
end
