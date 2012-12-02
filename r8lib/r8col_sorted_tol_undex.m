function [ undx, xdnu ] = r8vec_sorted_tol_undex ( m, n, a, unique_num, tol )

%*****************************************************************************80
%
%% R8COL_SORTED_TOL_UNDEX indexes tolerably unique entries of a sorted R8COL.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%    The goal of this routine is to determine a vector UNDX,
%    which points, to the unique elements of A, in sorted order,
%    and a vector XDNU, which identifies, for each entry of A, the index of
%    the unique sorted element of A.
%
%    This is all done with index vectors, so that the elements of
%    A are never moved.
%
%    Assuming A is already sorted, we examine the entries of A in order,
%    noting the unique entries, creating the entries of XDNU and
%    UNDX as we go.
%
%    Once this process has been completed, the vector A could be
%    replaced by a compressed vector XU, containing the unique entries
%    of A in sorted order, using the formula
%
%      XU(1:X_UNIQUE_NUM) = A(UNDX(1:X_UNIQUE_NUM)).
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
%    Here is an example of a vector A, the unique sort and 
%    inverse unique sort vectors and the compressed unique sorted vector.
%
%      I      A      XU  Undx  Xdnu
%    ----+------+------+-----+-----+
%      1 | 11.0 |  11.0    1     1
%      2 | 11.0 |  22.0    5     1
%      3 | 11.0 |  33.0    8     1
%      4 | 11.0 |  55.0    9     1
%      5 | 22.0 |                2
%      6 | 22.0 |                2
%      7 | 22.0 |                2
%      8 | 33.0 |                3
%      9 | 55.0 |                4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 July 2010
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
%  Consider entry I = 1.
%  It is unique, so set the number of unique items to K.
%  Set the K-th unique item to I.
%  Set the representative of item I to the K-th unique item.
%
  i = 1;
  k = 1;
  undx(k) = i;
  xdnu(i) = k;
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
      i2 = undx(j);
      diff = max ( abs ( a(1:m,i) - a(1:m,i2) ) );
      if ( diff <= tol )
        unique = 0;
        xdnu(i) = j;
        break
      end
    end

    if ( unique )
      k = k + 1;
      undx(k) = i;
      xdnu(i) = k;
    end

  end

  return
end
