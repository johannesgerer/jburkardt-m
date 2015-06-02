function x = dvand ( n, alpha, b )

%*****************************************************************************80
%
%% DVAND solves a Vandermonde system A' * x = b.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ake Bjorck, Victor Pereyra,
%    Solution of Vandermonde Systems of Equations,
%    Mathematics of Computation,
%    Volume 24, Number 112, October 1970, pages 893-903.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real ALPHA(N), the parameters that define the matrix.
%    The values should be distinct.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution of the linear system.
%
  x(1:n) = b(1:n);

  for k = 1 : n - 1
    for j = n : -1 : k + 1
      x(j) = ( x(j) - x(j-1) ) / ( alpha(j) - alpha(j-k) );
    end
  end

  for k = n - 1 : -1 : 1
    for j = k : n - 1
      x(j) = x(j) - alpha(k) * x(j+1);
    end
  end

  return
end
