function [ a, b ] = rat_sum_formula ( n )

%*****************************************************************************80
%
%% RAT_SUM_FORMULA computes the formulas for sums of powers of integers.
%
%  Example:
%
%    N = 6
%
%        1    2    3    4    5    6    7
%    -----------------------------------
%    0 | 1    0    0    0    0    0    0
%      |
%    1 | 1    1    0    0    0    0    0
%      | 2    2
%      |
%    2 | 1    1    1    0    0    0    0
%      | 3    2    6
%      |
%    3 | 1    1    1    0    0    0    0
%      | 4    2    4
%      | 
%    4 | 1    1    1    0   -1    0    0
%      | 5    2    3        30
%      |
%    5 | 1    1    5    0   -1    0    0
%      | 6    2   12        12
%      |
%    6 | 1    1    1    0   -1    0    1
%      | 7    2    2         6        42
%
%    The interpretation of row 2, for instance, is:
%
%      sum ( 1 <= I <= N ) I**2 = 1/3 N**3 + 1/2 N**2 + 1/6 N
%
%    This suggests that a more sensible way to display the table
%    is to reverse the order of the entries in the row, so that
%    the entry in column J is the coeficient of N**J, which is
%    not the case now.
%
%    Normally, the arrays are dimensioned A(0:N,1:N+1), B(0:N,1:N+1),
%    but since MATLAB does not allow 0-based indices, the data is
%    indexed as A(1:N+1,1:N+1) and B(1:N+1,1:N+1), and the user must
%    make the appropriate adjustments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Owens,
%    Sums of Powers of Integers,
%    Mathematics Magazine,
%    Volume 65, Number 1, February 1992, pages 38-40.
%
%  Parameters:
%
%    Input, integer N, the number of rows of coefficients to compute.
%
%    Output, integer A(N+1,N+1), B(N+1,N+1), the numerator and denominator
%    of the coefficients.  
%
  a(1,1) = 1;
  b(1,1) = 1;
  a(1,2:n+1) = 0;
  b(1,2:n+1) = 1;

  for i = 1 : n

    asum = 0;
    bsum = 0;
%
%  Subdiagonal entries are multiples of entries above them.
%
    for j = 1 : i

      [ a(i+1,j), b(i+1,j) ] = rat_mul ( a(i,j), b(i,j), i, i+2-j );
      [ asum, bsum ] = rat_add ( asum, bsum, a(i+1,j), b(i+1,j) );

    end
%
%  Diagonal entry is 1 - sum of previous entries in row.
%
    asum = -asum;
    [ a(i+1,i+1), b(i+1,i+1) ] = rat_add ( 1, 1, asum, bsum );
%
%  Superdiagonal entries are zero.
%
    a(i+1,i+2:n+1) = 0;
    b(i+1,i+2:n+1) = 1;

  end

  return
end
