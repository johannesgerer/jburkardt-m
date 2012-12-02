function [ length, sub ] = perm_ascend ( n, a )

%*****************************************************************************80
%
%% PERM_ASCEND computes the longest ascending subsequence of permutation.
%
%  Discussion:
%
%    Although this routine is intended to be applied to a permutation,
%    it will work just as well for an arbitrary vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the permutation.
%
%    Input, integer A(N), the permutation to be examined.
%
%    Output, integer LENGTH, the length of the longest increasing subsequence.
%
%    Output, integer SUB(LENGTH), contains a longest increasing subsequence of A.
%
  top(1:n) = 0;
  top_prev(1:n) = 0;

  length = 0;
  sub = [];

  if ( n <= 0 )
    return
  end

  for i = 1 : n

    k = 0;

    for j = 1 : length
      if ( a(i) <= a(top(j)) )
        k = j;
        break;
      end
    end

    if ( k == 0 )
      length = length + 1;
      k = length;
    end

    top(k) = i;

    if ( 1 < k )
      top_prev(i) = top(k-1);
    else
      top_prev(i) = 0;
    end

  end

  sub(1:length) = 0;

  j = top(length);
  sub(length) = a(j);

  for i = length-1 : -1 : 1
    j = top_prev(j);
    sub(i) = a(j);
  end

  return
end

