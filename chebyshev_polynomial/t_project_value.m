function v = t_project_value ( m, n, x, c )

%*****************************************************************************80
%
%% T_PROJECT_VALUE evaluates an expansion in Chebyshev polynomials T(n,x).
%
%  Discussion:
%
%    The projection is assumed to be based on the interval [-1,+1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2012
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
    b0(1:m,1) = c(j+1) + 2.0 * x(1:m) .* b1(1:m,1) - b2(1:m,1);
  end
  v(1:m,1) = 0.5 * ( c(1) + b0(1:m,1) - b2(1:m,1) );

  return
end
