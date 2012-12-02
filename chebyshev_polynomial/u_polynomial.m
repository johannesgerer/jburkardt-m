function v = u_polynomial ( m, n, x )

%*****************************************************************************80
%
%% U_POLYNOMIAL evaluates Chebyshev polynomials U(n,x).
%
%  Differential equation:
%
%    (1-X*X) Y'' - 3 X Y' + N (N+2) Y = 0
%
%  First terms:
%
%    U(0,X) =   1
%    U(1,X) =   2 X
%    U(2,X) =   4 X^2 -   1
%    U(3,X) =   8 X^3 -   4 X
%    U(4,X) =  16 X^4 -  12 X^2 +  1
%    U(5,X) =  32 X^5 -  32 X^3 +  6 X
%    U(6,X) =  64 X^6 -  80 X^4 + 24 X^2 - 1
%    U(7,X) = 128 X^7 - 192 X^5 + 80 X^3 - 8X
%
%  Recursion:
%
%    U(0,X) = 1,
%    U(1,X) = 2 * X,
%    U(N,X) = 2 * X * U(N-1,X) - U(N-2,X)
%
%  Norm:
%
%    Integral ( -1 <= X <= 1 ) ( 1 - X^2 ) * U(N,X)^2 dX = PI/2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest polynomial to compute.
%
%    Input, real X(M,1), the evaluation points.
%
%    Output, real V(1:M,1:N+1), the values of the N+1 Chebyshev polynomials.
%
  if ( n < 0 )
    v = [];
    return
  end

  v = zeros(m,n+1);

  v(1:m,1) = 1.0;

  if ( n < 1 )
    return
  end

  x = x(:);

  v(1:m,2) = 2.0 * x(1:m);

  for j = 2 : n
    v(1:m,j+1) = 2.0 * x(1:m) .* v(1:m,j) - v(1:m,j-1);
  end

  return
end
