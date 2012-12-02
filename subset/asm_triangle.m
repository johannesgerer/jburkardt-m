function a = asm_triangle ( n )

%*****************************************************************************80
%
%% ASM_TRIANGLE returns a row of the alternating sign matrix triangle.
%
%  Discussion:
%
%    The first seven rows of the triangle are as follows:
%
%          1      2      3      4      5      6     7
%
%    0     1
%    1     1      1
%    2     2      3      2
%    3     7     14     14      7
%    4    42    105    135    105     42
%    5   429   1287   2002   2002   1287    429
%    6  7436  26026  47320  56784  47320  26026  7436
%
%    For a given N, the value of A(J) represents entry A(I,J) of
%    the triangular matrix, and gives the number of alternating sign matrices
%    of order N in which the (unique) 1 in row 1 occurs in column J.
%
%    Thus, of alternating sign matrices of order 3, there are
%    2 with a leading 1 in column 1:
%
%      1 0 0  1 0 0
%      0 1 0  0 0 1
%      0 0 1  0 1 0
%
%    3 with a leading 1 in column 2, and
%
%      0 1 0  0 1 0  0 1 0
%      1 0 0  0 0 1  1-1 1
%      0 0 1  1 0 0  0 1 0
%
%    2 with a leading 1 in column 3:
%
%      0 0 1  0 0 1
%      1 0 0  0 1 0
%      0 1 0  1 0 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the desired row.
%
%    Output, integer A(N+1), the entries of the row.
%
  if ( n+1 <= 0 )
    a = [];
    return
  end
%
%  Row 1
%
  a(1) = 1;

  if ( n+1 == 1 )
    return
  end
%
%  Row 2
%
  nn = 2;
  b(1) = 2;
  c(1) = nn;

  a(1) = sum ( a(1:nn-1) );
  for i = 2 : nn
    a(i) = a(i-1) * c(i-1) / b(i-1);
  end

  if ( n+1 == 2 )
    return
  end
%
%  Row 3 and on.
%
  for nn = 3 : n+1

    b(nn-1) = nn;
    for i = nn-2 : -1 : 2
      b(i) = b(i) + b(i-1);
    end
    b(1) = 2;

    c(nn-1) = 2;
    for i = nn-2 : -1 : 2
      c(i) = c(i) + c(i-1);
    end
    c(1) = nn;

    a(1) = sum ( a(1:nn-1) );
    for i = 2 : nn
      a(i) = a(i-1) * c(i-1) / b(i-1);
    end

  end

  return
end
