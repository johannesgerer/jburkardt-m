function [ undx, xdnu ] = r8vec_sorted_undex ( x_num, x_val, x_unique_num, tol )

%*****************************************************************************80
%
%% R8VEC_SORTED_UNDEX returns unique sorted indexes for a sorted R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%    The goal of this routine is to determine a vector UNDX,
%    which points, to the unique elements of X, in sorted order,
%    and a vector XDNU, which identifies, for each entry of X, the index of
%    the unique sorted element of X.
%
%    This is all done with index vectors, so that the elements of
%    X are never moved.
%
%    Assuming X is already sorted, we examine the entries of X in order,
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
%    Here is an example of a vector X, the unique sort and 
%    inverse unique sort vectors and the compressed unique sorted vector.
%
%      I      X      XU  Undx  Xdnu
%    ----+------+------+-----+-----+
%      1 : 11.0 :  11.0    1     1
%      2 : 11.0 :  22.0    5     1
%      3 : 11.0 :  33.0    8     1
%      4 : 11.0 :  55.0    9     1
%      5 : 22.0 :                2
%      6 : 22.0 :                2
%      7 : 22.0 :                2
%      8 : 33.0 :                3
%      9 : 55.0 :        
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
%    Input, real X_VAL(X_NUM), the data values.
%
%    Input, integer X_UNIQUE_NUM, the number of unique values in X_VAL.
%    This value is only required for languages in which the size of
%    UNDX must be known in advance.
%
%    Input, real TOL, a tolerance for equality.
%
%    Output, integer UNDX(X_UNIQUE_NUM), the UNDX vector.
%
%    Output, integer XDNU(X_NUM), the XDNU vector.
%

%
%  Walk through the sorted array X.
%
  i = 1;

  j = 1;
  undx(j) = i;

  xdnu(i) = j;

  for i = 2 : x_num

    if ( tol < abs ( x_val(i) - x_val(undx(j)) ) )
      j = j + 1;
      undx(j) = i;
    end

    xdnu(i) = j;

  end

  return
end
