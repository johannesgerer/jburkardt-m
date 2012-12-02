function [ a, l, r ] = r8row_part_quick_a ( m, n, a )

%*****************************************************************************80
%
%% R8ROW_PART_QUICK_A reorders the columns of an R8ROW.
%
%  Discussion:
%
%    An R8ROW is an M by N array of R8's, regarded as an array of M rows,
%    each of length N.
%
%    The routine reorders the rows of A.  Using A(1,1:N) as a
%    key, all entries of A that are less than or equal to the key will
%    precede the key, which precedes all entries that are greater than the key.
%
%  Example:
%
%    Input:
%
%      M = 8, N = 2
%      A = ( 2 4
%            8 8
%            6 2
%            0 2
%           10 6
%           10 0
%            0 6
%            5 8 )
%
%    Output:
%
%      L = 2, R = 4
%
%      A = ( 0 2    LEFT
%            0 6
%            ----
%            2 4    KEY
%            ----
%            8 8    RIGHT
%            6 2
%           10 6
%           10 0
%            5 8 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the row dimension of A.
%
%    Input, integer N, the column dimension of A.
%
%    Input, real A(M,N).  On input, the array to be checked.
%
%    Output, real A(M,N), the reordered array.
%
%    Output, integer L, R, the indices of A that define the three
%    segments.  Let KEY = the input value of A(1:M,1).  Then
%    I <= L                 A(I,1:N) < KEY;
%         L < I < R         A(I,1:N) = KEY;
%                 R <= I    KEY < A(I,1:N).
%
  if ( m < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8ROWL_PART_QUICK_A - Fatal error!\n' );
    fprintf ( 1, '  M < 1.\n' );
    return
  end

  if ( m == 1 )
    l = 0;
    r = 2;
    return
  end

  key(1:n) = a(1,1:n);
  k = 1;
%
%  The elements of unknown size have indices between L+1 and R-1.
%
  l = 1;
  r = m + 1;

  for i = 2 : m

    if ( r8vec_gt ( n, a(l+1,1:n), key(1:n) ) )
      r = r - 1;
      vec = a(r,1:n);
      a(r,1:n) = a(l+1,1:n);
      a(l+1,1:n) = vec;
    elseif ( r8vec_eq ( n, a(l+1,1:n), key(1:n) ) )
      k = k + 1;
      vec = a(k,1:n);
      a(k,1:n) = a(l+1,1:n);
      a(l+1,1:n) = vec;
      l = l + 1;
    elseif ( r8vec_lt ( n, a(l+1,1:n), key(1:n) ) )
      l = l + 1;
    end

  end
%
%  Shift small elements to the left.
%
  for j = 1 : l - k
    a(j,1:n) = a(j+k,1:n);
  end
%
%  Shift KEY elements to center.
%
  for j = l - k + 1 : l
    a(j,1:n) = key(1:n);
  end
%
%  Update L.
%
  l = l - k;

  return
end
