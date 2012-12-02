function a = wilk20 ( alpha )

%*****************************************************************************80
%
%% WILK20 returns the WILK20 matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = I
%    elseif ( I = J-1 )
%      A(I,J) = 20
%    elseif ( I = N, J = 1 )
%      A(I,J) = ALPHA
%    else
%      A(I,J) = 0
%
%  Example:
%
%    1 20  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%    .  2 20  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%    .  .  3 20  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%    .  .  .  4 20  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%    .  .  .  .  5 20  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%    .  .  .  .  .  6 20  .  .  .  .  .  .  .  .  .  .  .  .  .
%    .  .  .  .  .  .  7 20  .  .  .  .  .  .  .  .  .  .  .  .
%    .  .  .  .  .  .  .  8 20  .  .  .  .  .  .  .  .  .  .  .
%    .  .  .  .  .  .  .  .  9 20  .  .  .  .  .  .  .  .  .  .
%    .  .  .  .  .  .  .  .  . 10 20  .  .  .  .  .  .  .  .  .
%    .  .  .  .  .  .  .  .  .  . 11 20  .  .  .  .  .  .  .  .
%    .  .  .  .  .  .  .  .  .  .  . 12 20  .  .  .  .  .  .  .
%    .  .  .  .  .  .  .  .  .  .  .  . 13 20  .  .  .  .  .  .
%    .  .  .  .  .  .  .  .  .  .  .  .  . 14 20  .  .  .  .  .
%    .  .  .  .  .  .  .  .  .  .  .  .  .  . 15 20  .  .  .  .
%    .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 16 20  .  .  .
%    .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 17 20  .  .
%    .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 18 20  .
%    .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 19 20
%  ALPHA.  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 20
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    If ALPHA = 0, then
%
%      LAMBDA(I) = i
%
%    and the characteristic equation is
%
%      product ( 1 <= I <= 20 ) ( I - LAMBDA ) = 0
%
%    and the condition number of eigenvalue I is
%
%      COND(LAMBDA(I)) = (20-I)% * (I-1)% / 20**19.
%
%    If ALPHA is nonzero, the characteristic equation is
%
%      product ( 1 <= I <= 20 ) ( I - LAMBDA ) = 20**19 * ALPHA.
%
%    If ALPHA = 1.0D-10, there are 6 real eigenvalues, and 14 complex
%    eigenvalues with considerable imaginary parts.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 5.23,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 104, 
%    LC: QA263.G68.
%
%    Joan Westlake,
%    A Handbook of Numerical Matrix Inversion and Solution of 
%    Linear Equations,
%    John Wiley, 1968,
%    ISBN13: 978-0471936756,
%    LC: QA263.W47.
%
%    James Wilkinson,
%    Rounding Errors in Algebraic Processes,
%    Prentice Hall, 1963,
%    page 138.
%
%  Parameters:
%
%    Input, real ALPHA, the perturbation.
%
%    Output, real A(20,20), the matrix.
%
  n = 20;

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = i;
      elseif ( j == i + 1 )
        a(i,j) = n;
      else
        a(i,j) = 0.0;
      end

    end
  end

  a(n,1) = alpha;

  return
end
