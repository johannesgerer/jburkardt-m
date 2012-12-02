function [ m, i_list, f_list ] = zeckendorf ( n )

%*****************************************************************************80
%
%% ZECKENDORF produces the Zeckendorf decomposition of a positive integer.
%
%  Discussion:
%
%    Zeckendorf proved that every positive integer can be represented
%    uniquely as the sum of non-consecutive Fibonacci numbers.
%
%    N = sum ( 1 <= I <= M ) F_LIST(I)
%
%  Example:
%
%     N    Decomposition
%
%    50    34 + 13 + 3
%    51    34 + 13 + 3 + 1
%    52    34 + 13 + 5
%    53    34 + 13 + 5 + 1
%    54    34 + 13 + 5 + 2
%    55    55
%    56    55 + 1
%    57    55 + 2
%    58    55 + 3
%    59    55 + 3 + 1
%    60    55 + 5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the positive integer to be decomposed.
%
%    Output, integer M, the number of parts in the decomposition.
%
%    Output, integer I_LIST(M), the index of the Fibonacci numbers.
%
%    Output, integer F_LIST(M), the value of the Fibonacci numbers.
%
  m = 0;
  i_list = zeros ( m, 1 );
  f_list = zeros ( m, 1 );
%
%  Extract a sequence of Fibonacci numbers.
%
  while ( 0 < n ) 
    [ f, i ] = fibonacci_floor ( n );
    m = m + 1;
    i_list(m) = i;
    n = n - f;
  end
%
%  Replace any pair of consecutive indices ( I, I-1 ) by I+1.
%
  for i = m : -1 : 2

    if ( i_list(i-1) == i_list(i) + 1 )
      i_list(i-1) = i_list(i-1) + 1;
      i_list(i:m-1) = i_list(i+1:m);
      i_list(m) = 0;
      m = m - 1;
    end

  end
%
%  Fill in the actual values of the Fibonacci numbers.
%
  for i = 1 : m
    f_list(i) = fibonacci_direct ( i_list(i) );
  end

  return
end
