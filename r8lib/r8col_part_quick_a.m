function [ a, l, r ] = r8col_part_quick_a ( m, n, a )

%*****************************************************************************80
%
%% R8COL_PART_QUICK_A reorders the columns of an R8COL.
%
%  Discussion:
%
%    The routine reorders the columns of A.  Using A(1:M,1) as a
%    key, all entries of A that are less than or equal to the key will
%    precede the key, which precedes all entries that are greater than
%    the key.
%
%  Example:
%
%    Input:
%
%      M = 2, N = 8
%      A = ( 2  8  6  0 10 10  0  5
%            4  8  2  2  6  0  6  8 )
%
%    Output:
%
%      L = 2, R = 4
%
%      A = (  0  0  2  8  6 10 10  4
%             2  6  4  8  2  6  0  8 )
%             ----     -------------
%             LEFT KEY     RIGHT
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the row dimension of A, and the length of a column.
%
%    Input, integer N, the column dimension of A.
%
%    Input, real A(M,N).  On input, the array to be checked.
%
%    Output, real A(M,N), the reordered array.
%
%    Output, integer L, R, the indices of A that define the three
%    segments.  Let KEY = the input value of A(1:M,1).  Then
%    I <= L                 A(1:M,I) < KEY;
%         L < I < R         A(1:M,I) = KEY;
%                 R <= I    KEY < A(1:M,I).
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8COL_PART_QUICK_A - Fatal error!\n' );
    fprintf ( 1, '  N < 1.\n' );
    return
  end

  if ( n == 1 )
    l = 0;
    r = 2;
    return
  end

  key(1:m) = a(1:m,1);
  k = 1;
%
%  The elements of unknown size have indices between L+1 and R-1.
%
  l = 1;
  r = n + 1;

  for i = 2 : n

    if ( r8vec_gt ( m, a(1:m,l+1), key(1:m)' ) )
      r = r - 1;
      vec = a(1:m,r);
      a(1:m,r) = a(1:m,l+1);
      a(1:m,l+1) = vec;
    elseif ( r8vec_eq ( m, a(1:m,l+1), key(1:m)' ) )
      k = k + 1;
      vec = a(1:m,k);
      a(1:m,k) = a(1:m,l+1);
      a(1:m,l+1) = vec;
      l = l + 1;
    elseif ( r8vec_lt ( m, a(1:m,l+1), key(1:m)' ) )
      l = l + 1;
    end

  end
%
%  Shift small elements to the left.
%
  for j = 1 : l - k
    a(1:m,j) = a(1:m,j+k);
  end
%
%  Shift KEY elements to center.
%
  for j = l-k+1 : l
    a(1:m,j) = key(1:m)';
  end
%
%  Update L.
%
  l = l - k;

  return
end
