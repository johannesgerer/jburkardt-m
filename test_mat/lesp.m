function a = lesp ( m, n )

%*****************************************************************************80
%
%% LESP returns the LESP matrix.
%
%  Formula:
%
%    if ( I - J == 1 )
%      A(I,J) = 1 / I
%    else if ( I - J == 0 )
%      A(I,J) = - ( 2*I+3 )
%    else if ( I - J == 1 )
%      A(I,J) = J
%    else
%      A(I,J) = 0.0
%
%  Example:
%
%    M = 5, N = 5
%
%     -5    2    .    .     .
%     1/2  -7    3    .     .
%      .   1/3  -9    4     .
%      .    .   1/4 -11     5
%      .    .    .   1/5  -13
%
%
%  Properties:
%
%    The matrix is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is generally not symmetric: A' /= A.
%
%    The eigenvalues are real, and smoothly distributed in [-2*N-3.5, -4.5].
%
%    The eigenvalues are sensitive.
%
%    The matrix is similar to the symmetric tridiagonal matrix with
%    the same diagonal entries and with off-diagonal entries 1,
%    via a similarity transformation using the diagonal matrix
%    D = diagonal ( 1!, 2!, ..., N! ).
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Wim Lenferink, MN Spijker,
%    On the use of stability regions in the numerical analysis of initial
%    value problems,
%    Mathematics of Computation,
%    Volume 57, 1991, pages 221-237.
%
%    Lloyd Trefethen,
%    Pseudospectra of matrices,
%    in Numerical Analysis 1991,
%    Proceedings of the 14th Dundee Conference,
%    D F Griffiths and G A Watson, editors,
%    Pitman Research Notes in Mathematics, volume 260,
%    Longman Scientific and Technical, Essex, UK, 1992, pages 234-266.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n

      if ( i - j == 1 )
        a(i,j) = 1.0 / i;
      elseif ( i - j == 0 )
        a(i,j) = - ( 2 * i + 3 );
      elseif ( i - j == -1 )
        a(i,j) = j;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
