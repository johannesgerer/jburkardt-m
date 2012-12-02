function row = comb_row ( ido, n )

%*****************************************************************************80
%
%% COMB_ROW computes row N of Pascal's triangle.
%
%  Discussion:
%
%    Row N contains the combinatorial coefficients
%
%      C(N,0), C(N,1), C(N,2), ... C(N,N)
%
%  Discussion:
%
%    The sum of the elements of row N is equal to 2**N.
%
%  Formula:
%
%    C(N,K) = N! / ( K! * (N-K)! )
%
%  First terms:
%
%     N K:0  1   2   3   4   5   6   7  8  9 10
%
%     0   1
%     1   1  1
%     2   1  2   1
%     3   1  3   3   1
%     4   1  4   6   4   1
%     5   1  5  10  10   5   1
%     6   1  6  15  20  15   6   1
%     7   1  7  21  35  35  21   7   1
%     8   1  8  28  56  70  56  28   8  1
%     9   1  9  36  84 126 126  84  36  9  1
%    10   1 10  45 120 210 252 210 120 45 10  1
%
%  Recursion:
%
%    C(N,K) = C(N-1,K-1)+C(N-1,K)
%
%  Special values:
%
%    C(N,0) = C(N,N) = 1
%    C(N,1) = C(N,N-1) = N
%    C(N,N-2) = sum ( 1 <= I <= N ) N
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IDO, indicates whether this is a call for
%    the 'next' row of the triangle.
%
%    0 means this is a startup call.  Row N is desired, but
%    presumably this is a first call, or row N-1 was not computed
%    on the previous call.
%
%    1 means this is not the first call, and row N-1 was computed
%    on the previous call.  In this case, much work can be saved
%    by using the information from the previous values of IROW
%    to build the next values.
%
%    Input, integer N, the row of the triangle desired.  The triangle
%    begins with row 0.
%
%    Output, integer ROW(N+1), the row of coefficients.
%    ROW(I) = C(N,I-1).
%
  persistent myrow;
  
  if ( n < 0 )
    myrow = [];
    row = myrow;
    return
  end

  if ( ido == 1 )

    for i = n : -1 : 2
      myrow(i) = myrow(i) + myrow(i-1);
    end

    myrow(n+1) = 1;

  else

    myrow(1) = 1;
    myrow(2:n+1) = 0;

    for j = 1 : n
      for i = j+1 : -1 : 2
        myrow(i) = myrow(i) + myrow(i-1);
      end
    end

  end

  row = myrow;
  
  return
end
