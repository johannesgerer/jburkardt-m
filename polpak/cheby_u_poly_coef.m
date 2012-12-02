function c = cheby_u_poly_coef ( n )

%*****************************************************************************80
%
%% CHEBY_U_POLY_COEF evaluates coefficients of Chebyshev polynomials U(n,x).
%
%  First terms:
%
%    N/K     0     1      2      3       4     5      6    7      8    9   10
%
%     0      1
%     1      0     2
%     2     -1     0      4
%     3      0    -4      0      8
%     4      1     0    -12      0      16
%     5      0     6      0    -32       0    32
%     6     -1     0     24      0     -80     0     64
%     7      0    -8      0     80       0  -192      0   128
%
%  Recursion:
%
%    U(0)(X) = 1,
%    U(1)(X) = 2*X,
%    U(N)(X) = 2 * X * U(N-1)(X) - U(N-2)(X)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%  Parameters:
%
%    Input, integer N, the highest order polynomial to compute.
%    Note that polynomials 0 through N will be computed.
%
%    Output, real C(1:N+1,1:N+1), the coefficients of the Chebyshev U
%    polynomials.
%
  if ( n < 0 )
    c = [];
    return
  end

  c(1:n+1,1:n+1) = 0.0;

  c(1,1) = 1.0;

  if ( n == 0 )
    return
  end

  c(2,2) = 2.0;
 
  for i = 2 : n
    c(i+1,1)     =                  - c(i-1,1);
    c(i+1,2:i-1) = 2.0 * c(i,1:i-2) - c(i-1,2:i-1);
    c(i+1,  i  ) = 2.0 * c(i,  i-1);
    c(i+1,  i+1) = 2.0 * c(i,  i  );
  end

  return
end
