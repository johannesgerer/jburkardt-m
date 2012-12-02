function [ unique_num, auniq, acount ] = r8vec_sorted_unique_hist ( n, a, tol )

%*****************************************************************************80
%
%% R8VEC_SORTED_UNIQUE_HIST computes a histogram of the unique elements of a sorted R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, real A(N), the array to examine.  The elements of A
%    should have been sorted.
%
%    Input, real TOL, a nonnegative tolerance for equality.
%    Set it to 0.0 for the strictest test.
%
%    Output, integer UNIQUE_NUM, the number of unique elements of A.
%
%    Output, real AUNIQ(UNIQUE_NUM), the unique elements of A.
%
%    Output, integer ACOUNT(UNIQUE_NUM), the number of times each element
%    of AUNIQ occurs in A.
%

%
%  Start taking statistics.
%
  unique_num = 0;

  for i = 1 : n

    if ( i == 1 )

      unique_num = 1;
      auniq(unique_num) = a(1);
      acount(unique_num) = 1;

    elseif ( abs ( a(i) - auniq(unique_num) ) <= tol )

      acount(unique_num) = acount(unique_num) + 1;

    else

      unique_num = unique_num + 1;
      auniq(unique_num) = a(i);
      acount(unique_num) = 1;

    end

  end

  return
end
