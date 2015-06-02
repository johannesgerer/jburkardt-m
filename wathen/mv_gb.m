function b = mv_gb ( m, n, ml, mu, a, x )

%*****************************************************************************80
%
%% MV_GB multiplies a banded matrix times a vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%
%    Input, real A(2*ML+MU+1,N), the banded matrix.
%
%    Input, real X(N), the vector to be multiplied.
%
%    Output, real B(M), the product A*X.
%
  b = zeros ( m, 1 );

  for i = 1 : n
    jlo = max ( 1, i - ml );
    jhi = min ( n, i + mu );
    for j = jlo : jhi
      b(i) = b(i) + a(i-j+ml+mu+1,j) * x(j);
    end
  end

  return
end
