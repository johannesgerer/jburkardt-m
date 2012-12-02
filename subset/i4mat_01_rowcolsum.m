function [ a, ierror ] = i4mat_01_rowcolsum ( m, n, r, c )

%*****************************************************************************80
%
%% I4MAT_01_ROWCOLSUM creates a 0/1 matrix with given row and column sums.
%
%  Discussion:
%
%    Given an M vector R and N vector C, there may exist one or more
%    M by N matrices with entries that are 0 or 1, whose row sums are R
%    and column sums are C.
%
%    For convenience, this routine requires that the entries of R and C
%    be given in nonincreasing order.
%
%    There are several requirements on R and C.  The simple requirements
%    are that the entries of R and C must be nonnegative, that the entries
%    of R must each be no greater than N, and those of C no greater than M,
%    and that the sum of the entries of R must equal the sum of the entries 
%    of C.
%
%    The final technical requirement is that if we form R*, the conjugate
%    partition of R, then C is majorized by R*, that is, that every partial
%    sum from 1 to K of the entries of C is no bigger than the sum of the same
%    entries of R*, for every K from 1 to N.
%
%    Given these conditions on R and C, there is at least one 0/1 matrix
%    with the given row and column sums.
%
%    The conjugate partition of R is constructed as follows:
%      R*(1) is the number of entries of R that are 1 or greater.
%      R*(2) is the number of entries of R that are 2 or greater.
%      ...
%      R*(N) is the number of entries of R that are N (can't be greater).
%
%  Example:
%
%    M = N = 5
%    R = ( 3, 2, 2, 1, 1 )
%    C = ( 2, 2, 2, 2, 1 )
%
%    A =
%      1 0 1 0 1
%      1 0 0 1 0
%      0 1 0 1 0
%      0 1 0 0 0
%      0 0 1 0 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    J H van Lint and R M Wilson,
%    A Course in Combinatorics,
%    Oxford, 1992, pages 148-156.
%
%    James Sandeson,
%    Testing Ecological Patterns,
%    American Scientist,
%    Volume 88, July-August 2000, pages 332-339.
%
%    Ian Saunders,
%    Algorithm AS 205,
%    Enumeration of R x C Tables with Repeated Row Totals,
%    Applied Statistics,
%    Volume 33, Number 3, pages 340-352, 1984.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, integer R(M), C(N), the row and column sums desired for the array.
%    Both vectors must be arranged in descending order.
%    The elements of R must be between 0 and N.
%    The elements of C must be between 0 and M.
%
%    Output, integer A(M,N), the M by N matrix with the given row and
%    column sums.
%    Each entry of A is 0 or 1.
%
%    Output, integer IERROR, an error flag.
%    0, no error was encountered, and the array was computed.
%    1, R and C do not have the same total.
%    2, R is not monotone decreasing, or has illegal entries.
%    3, C is not monotone decreasing, or has illegal entries.
%    4, R and C are not a possible set of row and column sums.
%
  a(1:m,1:n) = 0;
%
%  Check conditions.
%
  ierror = 0;

  if ( sum ( r(1:m) ) ~= sum ( c(1:n) ) )
    ierror = 1;
    return
  end

  if ( ~i4vec_descends ( m, r ) )
    ierror = 2;
    return
  end

  if ( n < r(1) | r(m) < 0 )
    ierror = 2;
    return
  end

  if ( ~i4vec_descends ( n, c ) )
    ierror = 3;
    return
  end

  if ( m < c(1) | c(n) < 0 )
    ierror = 3;
    return
  end
%
%  Compute the conjugate of R.
%
  r_conj(1:n) = 0;

  for i = 1 : m
    for j = 1 : r(i)
      r_conj(j) = r_conj(j) + 1;
    end
  end
%
%  C must be majorized by R_CONJ.
%
  r_sum = 0;
  c_sum = 0;
  for i = 1 : n
    r_sum = r_sum + r_conj(i);
    c_sum = c_sum + c(i);
    if ( r_sum < c_sum )
      ierror = 4;
      return
    end
  end
%
%  We need a temporary copy of R that we can decrement.
%
  r2(1:m) = r(1:m);

  for j = n : -1 : 1

    i = i4vec_maxloc_last ( m, r2 );

    for k = 1 : c(j)
%
%  By adding 1 rather than setting A(I,J) to 1, we were able to spot
%  an error where the index was "sticking".
%
      a(i,j) = a(i,j) + 1;

      r2(i) = r2(i) - 1;
%
%  There's a special case you have to watch out for.
%  If I was 1, and when you decrement R2(1), I is going to be 1 again,
%  and you're staying in the same column, that's not good.
%
      if ( 1 < i )
        i = i - 1;
      else
        i = i4vec_maxloc_last ( m, r2 );
        if ( i == 1 & k < c(j) )
          i = 1 + i4vec_maxloc_last ( m-1, r2(2:m) );
        end
      end

    end

  end

  return
end

