function a = parter ( m, n )

%*****************************************************************************80
%
%% PARTER returns the Parter matrix.
%
%  Formula:
%
%    A(I,J) = 1 / ( i - j + 0.5 )
%
%  Example:
%
%    N = 5
%
%     2   -2  -2/3 -2/5 -2/7
%    2/3   2   -2  -2/3 -2/5
%    2/5  2/3   2   -2  -2/3
%    2/7  2/5  2/3   2   -2
%    2/9  2/7  2/5  2/3   2
%
%  Properties:
%
%    The diagonal entries are all 2, the first superdiagonals all -2.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is generally not symmetric: A' ~= A.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is a special case of the Cauchy matrix.
%
%    Most of the singular values are very close to Pi.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Seymour Parter,
%    On the distribution of the singular values of Toeplitz matrices,
%    Linear Algebra and Applications,
%    Volume 80, August 1986, pages 115-130.
%
%    Evgeny Tyrtyshnikov,
%    Cauchy-Toeplitz matrices and some applications,
%    Linear Algebra and Applications,
%    Volume 149, 15 April 1991, pages 1-18.
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n
      a(i,j) = 1.0 / ( ( i - j ) + 0.5 );
    end
  end

  return
end
