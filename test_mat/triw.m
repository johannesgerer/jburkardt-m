function a = triw ( alpha, k, n )

%*****************************************************************************80
%
%% TRIW returns the TRIW matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = 1
%    elseif ( I < J and J <= K + I )
%      A(I,J) = ALPHA
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 3, K = 2, N = 5
%
%    1 3 3 0 0
%    0 1 3 3 0
%    0 0 1 3 3
%    0 0 0 1 3
%    0 0 0 0 1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is nonsingular.
%
%    A is upper triangular.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    Adding -2^(2-N) to the (N,1) element makes the matrix singular.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, James Wilkinson,
%    Ill-conditioned eigensystems and the computation of the Jordan
%    canonical form,
%    SIAM Review,
%    Volume 18, Number 4, 1976, pages 578-619.
%
%    W Kahan,
%    Numerical linear algebra,
%    Canadian Mathematical Bulletin,
%    Volume 9, 1966, pages 757-801.
%
%    AM Ostrowski,
%    On the spectrum of a one-parametric family of matrices,
%    Journal fuer Reine und Angewandte Mathematik,
%    Volume 193, Number (3/4), 1954, pages 143-160.
%
%    James Wilkinson,
%    Singular-value decomposition - basic aspects,
%    in Numerical Software - Needs and Availability,
%    edited by DAH Jacobs,
%    Academic Press, London, 1978, pages 109-135.
%
%  Parameters:
%
%    Input, real ALPHA, the superdiagonal value. 
%    A typical value is -1.
%
%    Input, integer K, the number of nonzero superdiagonals.  
%    A typical value is N-1.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = 1.0;
      elseif ( i < j & j - i <= k )
        a(i,j) = alpha;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
