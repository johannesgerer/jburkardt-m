function [ length, sub ] = i4vec_ascend_sub ( n, a )

%*****************************************************************************80
%
%% I4VEC_ASCEND_SUB computes the longest ascending subsequence of an I4VEC.
%
%  Discussion:
%
%    The subsequence is required to be strictly increasing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the permutation.
%
%    Input, integer A(N), the vector to be examined.
%
%    Output, integer LENGTH, the length of the longest increasing subsequence.
%
%    Output, integer SUB(N), contains in entries 1 through LENGTH
%    a longest increasing subsequence of A.
%
  top(1:n) = 0;
  top_prev(1:n) = 0;
  sub(1:n) = 0;

  if ( n <= 0 )
    length = 0;
    return
  end

  length = 0;

  for i = 1 : n

    k = 0;

    for j = 1 : length
      if ( a(i) <= a(top(j)) )
        k = j;
        break
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

  j = top(length);
  sub(length) = a(j);

  for i = length-1 : -1 : 1
    j = top_prev(j);
    sub(i) = a(j);
  end

  return
end
