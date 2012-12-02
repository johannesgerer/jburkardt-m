function [ undx, xdnu ] = i4vec_undex ( x_num, x_val, x_unique_num )

%*****************************************************************************80
%
%% I4VEC_UNDEX returns unique sorted indexes for an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of I4 values.
%
%    The goal of this routine is to determine a vector UNDX,
%    which points, to the unique elements of X, in sorted order,
%    and a vector XDNU, which identifies, for each entry of X, the index of
%    the unique sorted element of X.
%
%    This is all done with index vectors, so that the elements of
%    X are never moved.
%
%    The first step of the algorithm requires the indexed sorting
%    of X, which creates arrays INDX and XDNI.  (If all the entries
%    of X are unique, then these arrays are the same as UNDX and XDNU.)
%
%    We then use INDX to examine the entries of X in sorted order,
%    noting the unique entries, creating the entries of XDNU and
%    UNDX as we go.
%
%    Once this process has been completed, the vector X could be
%    replaced by a compressed vector XU, containing the unique entries
%    of X in sorted order, using the formula
%
%      XU(1:X_UNIQUE_NUM) = X(UNDX(1:X_UNIQUE_NUM)).
%
%    We could then, if we wished, reconstruct the entire vector X, or
%    any element of it, by index, as follows:
%
%      X(I) = XU(XDNU(I)).
%
%    We could then replace X by the combination of XU and XDNU.
%
%    Later, when we need the I-th entry of X, we can locate it as
%    the XDNU(I)-th entry of XU.
%
%    Here is an example of a vector X, the sort and inverse sort
%    index vectors, and the unique sort and inverse unique sort vectors
%    and the compressed unique sorted vector.
%
%      I    X  Indx  Xdni      XU  Undx  Xdnu
%    ----+----+-----+-----+-------+-----+-----+
%      1 | 11     1     1 |    11     1     1
%      2 | 22     3     5 |    22     2     2
%      3 | 11     6     2 |    33     4     1
%      4 | 33     9     8 |    55     5     3
%      5 | 55     2     9 |                 4
%      6 | 11     7     3 |                 1
%      7 | 22     8     6 |                 2
%      8 | 22     4     7 |                 2
%      9 | 11     5     4 |                 1
%
%    INDX(2) = 3 means that sorted item(2) is X(3).
%    XDNI(2) = 5 means that X(2) is sorted item(5).
%
%    UNDX(3) = 4 means that unique sorted item(3) is at X(4).
%    XDNU(8) = 2 means that X(8) is at unique sorted item(2).
%
%    XU(XDNU(I))) = X(I).
%    XU(I)        = X(UNDX(I)).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of data values.
%
%    Input, integer X_VAL(X_NUM), the data values.
%
%    Input, integer X_UNIQUE_NUM, the number of unique values in X_VAL.
%    This value is only required for languages in which the size of
%    UNDX must be known in advance.
%
%    Output, integer UNDX(X_UNIQUE_NUM), the UNDX vector.
%
%    Output, integer XDNU(X_NUM), the XDNU vector.
%

%
%  Implicitly sort the array.
%
  indx = i4vec_sort_heap_index_a ( x_num, x_val );
%
%  Walk through the implicitly sorted array X.
%
  i = 1;

  j = 1;
  undx(j) = indx(i);

  xdnu(indx(i)) = j;

  for i = 2 : x_num

    if ( x_val(indx(i)) ~= x_val(undx(j)) )
      j = j + 1;
      undx(j) = indx(i);
    end

    xdnu(indx(i)) = j;

  end

  return
end
