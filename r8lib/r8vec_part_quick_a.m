function [ a, l, r ] = r8vec_part_quick_a ( n, a )

%*****************************************************************************80
%
%% R8VEC_PART_QUICK_A reorders an R8VEC as part of a quick sort.
%
%  Discussion:
%
%    The routine reorders the entries of A.  Using A(1) as a key,
%    all entries of A that are less than or equal to the key will
%    precede the key which precedes all entries that are greater than the key.
%
%  Example:
%
%    Input:
%
%      N = 8
%
%      A = ( 6, 7, 3, 1, 6, 8, 2, 9 )
%
%    Output:
%
%      L = 3, R = 6
%
%      A = ( 3, 1, 2, 6, 6, 8, 9, 7 )
%            -------        -------
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries of A.
%
%    Input, realA(N), the array to be checked.
%
%    Output, real A(N), has been reordered as described above.
%
%    Output, integer L, R, the indices of A that define the three segments.
%    Let KEY = the input value of A(1).  Then
%    I <= L                 A(I) < KEY;
%         L < I < R         A(I) = KEY;
%                 R <= I    KEY < A(I).
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_PART_QUICK_A - Fatal error!\n' );
    fprintf ( 1, '  N < 1.\n' );
    error ( 'R8VEC_PART_QUICK_A - Fatal error!' );
  elseif ( n == 1 )
    l = 0;
    r = 2;
    return;
  end

  key = a(1);
  m = 1;
%
%  The elements of unknown size have indices between L+1 and R-1.
%
  l = 1;
  r = n + 1;

  for i = 2 : n

    if ( key < a(l+1) )
      r = r - 1;
      [ a(r), a(l+1) ] = r8_swap ( a(r), a(l+1) );
    elseif ( a(l+1) == key )
      m = m + 1;
      [ a(m), a(l+1) ] = r8_swap ( a(m), a(l+1) );
      l = l + 1;
    elseif ( a(l+1) < key )
      l = l + 1;
    end

  end
%
%  Now shift small elements to the left, and KEY elements to center.
%
  for i = 1 : l - m
    a(i) = a(i+m);
  end
%
%  Out of bounds here, occasionally.
%
  l = l - m;

  a(l+1:l+m) = key;

  return
end
