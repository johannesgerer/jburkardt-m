function [ undx, xdnu ] = r8col_tol_undex ( m, n, a, unique_num, tol )

%*****************************************************************************80
%
%% R8COL_TOL_UNDEX indexes tolerably unique entries of an R8COL.
%
%  Discussion:
%
%    An R8COL is an M x N array of R8 values, regarded as N columns
%    each of M R8 values.
%
%    The goal of this routine is to determine a vector UNDX,
%    which points to the unique elements of A, in sorted order,
%    and a vector XDNU, which identifies, for each entry of A, the index of
%    the unique sorted element of A.
%
%    This is all done with index vectors, so that the elements of
%    A are never moved.
%
%    The first step of the algorithm requires the indexed sorting
%    of A, which creates arrays INDX and XDNI.  (If all the entries
%    of A are unique, then these arrays are the same as UNDX and XDNU.)
%
%    We then use INDX to examine the entries of A in sorted order,
%    noting the unique entries, creating the entries of XDNU and
%    UNDX as we go.
%
%    Once this process has been completed, the object A could be
%    replaced by a compressed object XU, containing the unique entries
%    of A in sorted order, using the formula
%
%      XU(1:UNIQUE_NUM) = A(UNDX(1:UNIQUE_NUM)).
%
%    We could then, if we wished, reconstruct the entire vector A, or
%    any element of it, by index, as follows:
%
%      A(I) = XU(XDNU(I)).
%
%    We could then replace A by the combination of XU and XDNU.
%
%    Later, when we need the I-th entry of A, we can locate it as
%    the XDNU(I)-th entry of XU.
%
%    Here is an example of a vector A, the sort and inverse sort
%    index vectors, and the unique sort and inverse unique sort vectors
%    and the compressed unique sorted vector.
%
%      I    A   Indx  Xdni      XU   Undx  Xdnu
%    ----+-----+-----+-----+--------+-----+-----+
%      1 | 11.     1     1 |    11.     1     1
%      2 | 22.     3     5 |    22.     2     2
%      3 | 11.     6     2 |    33.     4     1
%      4 | 33.     9     8 |    55.     5     3
%      5 | 55.     2     9 |                  4
%      6 | 11.     7     3 |                  1
%      7 | 22.     8     6 |                  2
%      8 | 22.     4     7 |                  2
%      9 | 11.     5     4 |                  1
%
%    INDX(2) = 3 means that sorted item(2) is A(3).
%    XDNI(2) = 5 means that A(2) is sorted item(5).
%
%    UNDX(3) = 4 means that unique sorted item(3) is at A(4).
%    XDNU(8) = 2 means that A(8) is at unique sorted item(2).
%
%    XU(XDNU(I))) = A(I).
%    XU(I)        = A(UNDX(I)).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the dimension of the data values.
%
%    Input, integer N, the number of data values.
%
%    Input, real A(M,N), the data values.
%
%    Input, integer UNIQUE_NUM, the number of unique values in A.
%    This value is only required for languages in which the size of
%    UNDX must be known in advance.
%
%    Input, real TOL, a tolerance for equality.
%
%    Output, integer UNDX(UNIQUE_NUM), the UNDX vector.
%
%    Output, integer XDNU(N), the XDNU vector.
%
  undx = zeros ( unique_num, 1 );
  xdnu = zeros ( n, 1 );
%
%  Implicitly sort the array.
%
  indx = r8col_sort_heap_index_a ( m, n, a );
%
%  Consider entry I = 1.
%  It is unique, so set the number of unique items to K.
%  Set the K-th unique item to I.
%  Set the representative of item I to the K-th unique item.
%
  i = 1;
  k = 1;
  undx(k) = indx(i);
  xdnu(indx(i)) = k;
%
%  Consider entry I.
%
%  If it is unique, increase the unique count K, set the
%  K-th unique item to I, and set the representative of I to K.
%
%  If it is not unique, set the representative of item I to a
%  previously determined unique item that is close to it.
%
  for i = 2 : n

    unique = 1;

    for j = 1 : k
      diff = max ( abs ( a(1:m,indx(i)) - a(1:m,undx(j)) ) );
      if ( diff <= tol )
        unique = 0;
        xdnu(indx(i)) = j;
        break
      end
    end

    if ( unique )
      k = k + 1;
      undx(k) = indx(i);
      xdnu(indx(i)) = k;
    end

  end

  return
end
