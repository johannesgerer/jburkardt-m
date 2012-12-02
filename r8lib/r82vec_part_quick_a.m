function [ a, l, r ] = r82vec_part_quick_a ( n, a )

%*****************************************************************************80
%
%% R82VEC_PART_QUICK_A reorders an R82VEC as part of a quick sort.
%
%  Discussion:
%
%    The routine reorders the entries of A.  Using A(1:2,1) as a
%    key, all entries of A that are less than or equal to the key will
%    precede the key, which precedes all entries that are greater than the key.
%
%  Example:
%
%    Input:
%
%      N = 8
%
%      A = ( (2,4), (8,8), (6,2), (0,2), (10,6), (10,0), (0,6), (4,8) )
%
%    Output:
%
%      L = 2, R = 4
%
%      A = ( (0,2), (0,6), (2,4), (8,8), (6,2), (10,6), (10,0), (4,8) )
%             -----------          ----------------------------------
%             LEFT          KEY    RIGHT
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries of A.
%
%    Input, real A(2,N), the array to be checked.
%
%    Output, real A(2,N), has been reordered as described above.
%
%    Output, integer L, R, the indices of A that define the three segments.
%    Let KEY = the input value of A(1:2,1).  Then
%    I <= L                 A(1:2,I) < KEY;
%         L < I < R         A(1:2,I) = KEY;
%                 R <= I    KEY < A(1:2,I).
%
  ndim = 2;

  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R82VEC_PART_QUICK_A - Fatal error!\n' );
    fprintf ( 1, '  N < 1.\n' );
    error ( 'R82VEC_PART_QUICK_A - Fatal error!' );
  elseif ( n == 1 )
    l = 0;
    r = 2;
    return
  end

  key(1:ndim,1) = a(1:ndim,1);
  m = 1;
%
%  The elements of unknown size have indices between L+1 and R-1.
%
  l = 1;
  r = n + 1;

  for i = 2 : n

    if ( r8vec_gt ( ndim, a(1:ndim,l+1), key(1:ndim) ) )

      r = r - 1;
      temp          = a(1:ndim,r);
      a(1:ndim,r)   = a(1:ndim,l+1);
      a(1:ndim,l+1) = temp;

    elseif ( r8vec_eq ( ndim, a(1:ndim,l+1), key(1:ndim) ) )

      m = m + 1;
      temp          = a(1:ndim,m);
      a(1:ndim,m)   = a(1:ndim,l+1);
      a(1:ndim,l+1) = temp;
      l = l + 1;

    elseif ( r8vec_lt ( ndim, a(1:ndim,l+1), key(1:ndim) ) )

      l = l + 1;

    end

  end
%
%  Now shift small elements to the left, and KEY elements to center.
%
  for i = 1 : l - m
    a(1:ndim,i) = a(1:ndim,i+m);
  end

  l = l - m;

  for i = 1 : ndim
    a(i,l+1:l+m) = key(i);
  end

  return
end
