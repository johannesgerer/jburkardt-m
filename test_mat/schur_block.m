function a = schur_block ( n, x, y )

%*****************************************************************************80
%
%% SCHUR_BLOCK returns the Schur block matrix.
%
%  Formula:
%
%    if ( i == j )
%      a(i,j) = x( (i+1)/2 )
%    else ( mod ( i, 2 ) == 1 & j == i + 1 )
%      a(i,j) = y( (i+1)/2 )
%    else ( mod ( i, 2 ) == 0 & j == i - 1 )
%      a(i,j) = -y( (i+1)/2 )
%    else
%      a(i,j) = 0.0
%
%  Example:
%
%    N = 5, X = ( 1, 2, 3 ), Y = ( 4, 5 )
%
%    1  4    0    0    0
%   -4  1    0    0    0
%    0  0    2    5    0
%    0  0   -5    2    0
%    0  0    0    0    3
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is block diagonal, with the blocks being 2 by 2 or 1 by 1 in size.
%
%    A is in real Schur form.
%
%    The eigenvalues of A are X(I) +/- sqrt ( - 1 ) * Y(I)
%
%    A is tridiagonal.
%
%    A is banded, with bandwidth 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Francoise Chatelin,
%    Section 4.2.7,
%    Eigenvalues of Matrices,
%    John Wiley, 1993.
%
%    Francoise Chatelin, Valerie Fraysse,
%    Qualitative computing: Elements of a theory for finite precision
%    computation, Lecture notes,
%    CERFACS, Toulouse, France and THOMSON-CSF, Orsay, France, June 1993.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X( (N+1)/2 ), specifies the diagonal elements
%    of A.
%
%    Input, real Y( N/2 ), specifies the off-diagonal elements 
%    of the Schur blocks.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = x( floor ( (i+1)/2 ) );
      elseif ( mod ( i, 2 ) == 1 & j == i + 1 )
        a(i,j) = y( floor ( (i+1)/2 ) );
      elseif ( mod ( i, 2 ) == 0 & j == i - 1 )
        a(i,j) = - y( floor ( (i+1)/2 ) );
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
