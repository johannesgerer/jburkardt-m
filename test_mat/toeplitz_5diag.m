function a = toeplitz_5diag ( n, d1, d2, d3, d4, d5 )

%*****************************************************************************80
%
%% TOEPLITZ_5DIAG returns a pentadiagonal Toeplitz matrix.
%
%  Formula:
%
%    if ( I - J == 2 )
%      A(I,J) = D1
%    elseif ( I - J == 1 )
%      A(I,J) = D2
%    elseif ( I - J == 0 )
%      A(I,J) = D3
%    elseif ( I - J == -1 )
%      A(I,J) = D4
%    elseif ( I - J == -2 )
%      A(I,J) = D5
%    else
%      A(I,J) = 0.0
%
%  Example:
%
%    N = 5, D1 = 1, D2 = -10, D3 = 0, D4 = 10, D5 = 1
%
%      0  10   1   .   .
%    -10   0  10   1   .
%      1 -10   0  10   1
%      .   1 -10   0  10
%      .   .   1 -10   0
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is banded, with bandwidth 5.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    The special data D1 = 1, D2 = -10, D3 = 0, D4 = 10, D5 = 1 corresponds
%    to a matrix of Rutishauser.
%
%    The matrix has eigenvalues lying approximately on the complex line
%    segment 2 * cos ( 2 * t ) + 20 * I * sin ( t ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    RM Beam, RF Warming,
%    The asymptotic spectra of banded Toeplitz and quasi-Toeplitz matrices,
%    SIAM Journal on Scientific and Statistical Computing,
%    Volume 14, Number 4, 1993, pages 971-1006.
%
%    Heinz Rutishauser,
%    On test matrices,
%    Programmation en Mathematiques Numeriques,
%    Centre National de la Recherche Scientifique,
%    1966, pages 349-365.
%
%  Parameters:
%
%    Input, integer N, the order of A.  N should be at least 3.
%
%    Input, D1, D2, D3, D4, D5, values that define the nonzero diagonals
%    of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i - j == 2 )
        a(i,j) = d1;
      elseif ( i - j == 1 )
        a(i,j) = d2;
      elseif ( i - j == 0 )
        a(i,j) = d3;
      elseif ( i - j == -1 )
        a(i,j) = d4;
      elseif ( i - j == -2 )
        a(i,j) = d5;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
