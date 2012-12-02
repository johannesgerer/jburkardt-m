function a = cheby_diff1 ( n )

%*****************************************************************************80
%
%% CHEBY_DIFF1 returns the Chebyshev Differentiation matrix.
%
%  Example:
%
%    N = 6
%
%    8.5000 -10.4721   2.8944  -1.5279   1.1056  -0.5000
%    2.6180  -1.1708  -2.0000   0.8944  -0.6810   0.2764
%   -0.7236   2.0000  -0.1708   1.6180   0.8944  -0.3820
%    0.3820  -0.8944   1.6180   0.1708  -2.0000   0.7236
%   -0.2764   0.6180  -0.8944   2.0000   1.1708  -2.6180
%    0.5000  -1.1056   1.5279  -2.8944  10.4721  -8.5000
%
%  Properties:
%
%    A is antisymmetric.
%
%    If N is odd, then det ( A ) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Lloyd Trefethen,
%    Spectral Methods in MATLAB,
%    SIAM, 2000, page 54.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  if ( n <= 0 )
    a = [];
    return
  end

  if ( n == 1 )
    a(1,1) = 1.0;
    return
  end

  c(1) = 2.0;
  c(2:n-1) = 1.0;
  c(n) = 2.0;
%
%  Get the Chebyshev points.
%
  for i = 0 : n
    x(i+1) = cos ( pi * i / ( n - 1 ) );
  end

  for i = 1 : n
    for j = 1 : n

      if ( i ~= j )
        a(i,j) = (-1.0)^(i+j) * c(i) / ( c(j) * ( x(i-1+1) - x(j-1+1) ) );
      elseif ( i == 1 )
        a(i,i) = ( 2 * ( n - 1 )^2 + 1 ) / 6.0;
      elseif ( i == n )
        a(i,i) = - ( 2 * ( n - 1 )^2 + 1 ) / 6.0;
      else
        a(i,i) = - 0.5 * x(i-1+1) / ( 1.0 - x(i-1+1)^2 ); 
      end

    end
  end

  return
end
