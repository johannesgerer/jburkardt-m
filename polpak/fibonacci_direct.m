function f = fibonacci_direct ( n )

%*****************************************************************************80
%
%% FIBONACCI_DIRECT computes the N-th Fibonacci number directly.
%
%  Formula:
%
%      F(N) = ( PHIP^N - PHIM^N ) / sqrt(5)
%
%    where 
%
%      PHIP = ( 1 + sqrt(5) ) / 2, 
%      PHIM = ( 1 - sqrt(5) ) / 2.
%
%  Example:
%
%     N   F
%    --  --
%     0   0
%     1   1
%     2   1
%     3   2
%     4   3
%     5   5
%     6   8
%     7  13
%     8  21
%     9  34
%    10  55
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the index of the Fibonacci number to compute.
%    N should be nonnegative.
%
%    Output, integer F, the value of the N-th Fibonacci number.
%
  sqrt5 = sqrt ( 5.0 );
  phim = ( 1.0 - sqrt5 ) / 2.0;
  phip = ( 1.0 + sqrt5 ) / 2.0;

  if ( n < 0 )
    f = 0;
  else
    f = round ( ( phip^n - phim^n ) / sqrt ( 5.0 ) );
  end
 
  return
end
