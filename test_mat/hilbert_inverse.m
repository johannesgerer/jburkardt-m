function a = hilbert_inverse ( n )

%*****************************************************************************80
%
%% HILBERT_INVERSE returns the inverse of the HILBERT matrix.
%
%  Formula:
%
%    A(I,J) =  (-1)^(I+J) * (N+I-1)! * (N+J-1)! /
%           [ (I+J-1) * ((I-1)!*(J-1)!)^2 * (N-I)! * (N-J)! ]
%
%  Example:
%
%    N = 5
%
%       25    -300     1050    -1400     630
%     -300    4800   -18900    26880  -12600
%     1050  -18900    79380  -117600   56700
%    -1400   26880  -117600   179200  -88200
%      630  -12600    56700   -88200   44100
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is almost impossible to compute accurately by general routines
%    that compute the inverse.
%
%    A is the exact inverse of the Hilbert matrix; however, if the
%    Hilbert matrix is stored on a finite precision computer, and
%    hence rounded, A is actually a poor approximation
%    to the inverse of that rounded matrix.  Even though Gauss elimination
%    has difficulty with the Hilbert matrix, it can compute an approximate
%    inverse matrix whose residual is lower than that of the
%    "exact" inverse.
%
%    All entries of A are integers.
%
%    The sum of the entries of A is N^2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );
%
%  Set the (1,1) entry.
%
  a(1,1) = n * n;
%
%  Define Row 1, Column J by recursion on Row 1 Column J-1
%
  i = 1;
  for j = 2 : n
    a(i,j) = - a(i,j-1) * ( n + j - 1 ) * ( i + j - 2 ) * ( n + 1 - j ) ...
      / ( ( i + j - 1 ) * ( j - 1 ) * ( j - 1 ) );
  end
%
%  Define Row I by recursion on row I-1
%
  for i = 2 : n
    for j = 1 : n

      a(i,j) = - a(i-1,j) * ( n + i - 1 ) * ( i + j - 2 ) ...
        * ( n + 1 - i ) ...
        / ( ( i + j - 1 ) * ( i - 1 ) * ( i - 1 ) );

    end
  end

  return
end
