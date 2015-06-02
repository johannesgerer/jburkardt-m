function c = h_polynomial_coefficients ( n )

%*****************************************************************************80
%
%% H_POLYNOMIAL_COEFFICIENTS: coefficients of H(i,x).
%
%  Discussion:
%
%    H(i,x) is the physicist's Hermite polynomial of degree I.
%
%  First terms:
%
%    N/K     0     1      2      3       4     5      6    7      8    9   10
%
%     0      1
%     1      0     2
%     2     -2     0      4
%     3      0   -12      0      8
%     4     12     0    -48      0      16
%     5      0   120      0   -160       0    32
%     6   -120     0    720      0    -480     0     64
%     7      0 -1680      0   3360       0 -1344      0   128
%     8   1680     0 -13440      0   13440     0  -3584     0    256
%     9      0 30240      0 -80640       0 48384      0 -9216      0 512
%    10 -30240     0 302400      0 -403200     0 161280     0 -23040   0 1024 
%
%  Recursion:
%
%    H(0,X) = 1,
%    H(1,X) = 2*X,
%    H(N,X) = 2*X * H(N-1,X) - 2*(N-1) * H(N-2,X)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2012
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
%    Output, real C(1:N+1,1:N+1), the coefficients of the Hermite
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
    c(i+1,1)     =  -2.0 * ( i - 1 ) * c(i-1,1);
    c(i+1,2:i-1) =   2.0             * c(i  ,1:i-2)...
                    -2.0 * ( i - 1 ) * c(i-1,2:i-1);
    c(i+1,  i  ) =   2.0             * c(i  ,  i-1);
    c(i+1,  i+1) =   2.0             * c(i  ,  i  );
  end

  return
end
