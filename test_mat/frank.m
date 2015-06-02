function a = frank ( n )

%*****************************************************************************80
%
%% FRANK returns the FRANK matrix.
%
%  Formula:
%
%    if ( I <= J )
%      A(I,J) = N+1-J
%    elseif ( J = I-1 )
%      A(I,J) = N-J
%    else
%      A(I,J) = 0.0
%
%  Example:
%
%    N = 5
%
%    5 4 3 2 1
%    4 4 3 2 1
%    . 3 3 2 1
%    . . 2 2 1
%    . . . 1 1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is upper Hessenberg.
%
%    A is integral: int ( A ) = A.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    The eigenvalues of A are related to the zeros of the Hermite
%    polynomials.
%
%    The eigenvalues of A are real and positive, and occur in reciprocal
%    pairs, LAMBDA and 1/LAMBDA.
%
%    For N = 12, the eigenvalues of A range from 32.2 to 0.031, with
%    the smaller eigenvalues having a condition number of 10^7,
%    meaning that a change in the matrix of order 10^(-7) can
%    result in a change in the eigenvalue of order 1.  The actual
%    eigenvalues are:
%
%      0.031028060644010
%      0.049507429185278
%      0.081227659240405
%      0.143646519769220
%      0.284749720558478
%      0.6435053190048555
%      1.55398870913210790
%      3.511855948580757194
%      6.961533085567122113
%     12.311077408868526120
%     20.198988645877079428
%     32.228891501572160750
%
%    If N is odd, 1 is an eigenvalue of A.
%
%    The (N/2) smaller eigenvalues of A are ill-conditioned.
%
%    For large N, the computation of the determinant of A
%    comes out very far from its correct value of 1.
%
%    Simple linear systems:
%      x = (0,0,0,...,1),   A*x = (1,1,1,...,1)
%      x = (1,1,1,...,1),   A*x = n * ( (n+1)/2, (n+3)/2, (n+3)/2, ..., (n+3)/2)
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
%    Patricia Eberlein,
%    A note on the matrices denoted by $B n$,
%    SIAM Journal on Applied Mathematics,
%    Volume 20, 1971, pages 87-92.
%
%    Werner Frank,
%    Computing eigenvalues of complex matrices by determinant
%    evaluation, and by methods of Danilewski and Wielandt,
%    Journal of the Society for Industrial and Applied Mathematics,
%    Volume 6, 1958, pages 378-392.
%
%    Gene Golub, James Wilkinson,
%    Ill-conditioned eigensystems and the computation of the Jordan
%    canonical form,
%    SIAM Review,
%    Volume 18, Number 4, 1976, pages 578-619.
%
%    Robert Gregory, David Karney,
%    Example 5.14,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 92,
%    LC: QA263.G68.
%
%    H Rutishauser,
%    On test matrices,
%    Programmation en Mathematiques
%    Numeriques, Editions Centre Nat. Recherche Sci., Paris, 165,
%    1966, pages 349-365.  Section 9.
%
%    J M Varah,
%    A generalization of the Frank matrix,
%    SIAM Journal on Scientific and Statistical Computing,
%    Volume 7, Number 3, August 1986, pages 835-839.
%
%    Joan Westlake,
%    Test Matrix A37,
%    A Handbook of Numerical Matrix Inversion and Solution of Linear Equations,
%    John Wiley, 1968.
%
%    James Wilkinson,
%    Error analysis of floating-point computation,
%    Numerische Mathematik,
%    Volume 2, 1960, pages 319-340.
%
%    James Wilkinson,
%    The Algebraic Eigenvalue Problem,
%    Oxford University Press, 1965, pages 92-93.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i <= j )
        a(i,j) = ( n + 1 - j );
      elseif ( j == i - 1 )
        a(i,j) = ( n - j );
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
