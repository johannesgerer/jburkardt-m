function a = forsythe ( alpha, beta, n )

%*****************************************************************************80
%
%% FORSYTHE returns the Forsythe matrix.
%
%  Discussion:
%
%    The Forsythe matrix represents a Jordan canonical matrix, perturbed
%    by a rank one update.
%
%  Formula:
%
%    If ( I = J )
%      A(I,J) = BETA
%    else if ( J = I+1 )
%      A(I,J) = 1
%    else if ( I = N and J = 1 ) then
%      A(I,J) = ALPHA
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 2, BETA = 3, N = 5
%
%    3 1 0 0 0
%    0 3 1 0 0
%    0 0 3 1 0
%    0 0 0 3 1
%    2 0 0 0 3
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    The characteristic equation of A is
%
%      ( BETA - LAMBDA )**N - (-1)**N*ALPHA = 0
%
%    The eigenvalues of A are
%
%      LAMBDA(I) = BETA
%        + abs ( ALPHA )**1/N * exp ( 2 * I * PI * sqrt ( - 1 ) / N )
%
%    Gregory and Karney consider the special case where BETA is 0,
%    and ALPHA is a "small" value.  In that case, the characteristic
%    equation is LAMBDA**N - ALPHA = 0, and the eigenvalues are the
%    N-th root of ALPHA times the N roots of unity.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 5.22,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 103, 
%    LC: QA263.G68.
%
%  Parameters:
%
%    Input, real ALPHA, BETA, define the matrix.  A typical 
%    value of ALPHA is the square root of the machine precision; a typical
%    value of BETA is 0.0.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( j == i )
        a(i,j) = beta;
      elseif ( j == i + 1 )
        a(i,j) = 1.0;
      elseif ( i == n & j == 1 )
        a(i,j) = alpha;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end

