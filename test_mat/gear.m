function a = gear ( ii, jj, n )

%*****************************************************************************80
%
%% GEAR returns the Gear matrix.
%
%  Formula:
%
%    if ( I = 1 and J = abs ( II ) )
%      A(I,J) = SIGN(II)
%    elseif ( I = N and J = N + 1 - abs ( JJ ) )
%      A(I,J) = SIGN(JJ)
%    elseif ( I = J+1 or I = J-1 )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%    Common values for II and JJ are II = N, JJ=-N.
%
%  Example:
%
%    II = 5, JJ = - 5, N = 5
%
%    0 1 0 0 1
%    1 0 1 0 0
%    0 1 0 1 0
%    0 0 1 0 1
%   -1 0 0 1 0
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral: int ( A ) = A.
%
%    A is border-banded.
%
%    All eigenvalues are of the form 2*COS(ALPHA), and the eigenvectors
%    are of the form
%
%      ( sin(W+ALPHA), sin(W+2*ALPHA), ..., sin(W+N*ALPHA) ).
%
%    The values of ALPHA and W are given in the reference.  A can have
%    double and triple eigenvalues.
%
%    If II = N and JJ=-N, A is singular.
%
%    A is defective.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Charles Gear,
%    A simple set of test matrices for eigenvalue programs,
%    Mathematics of Computation,
%    Volume 23, 1969, pages 119-125.
%
%  Parameters:
%
%    Input, integer II, JJ, define the two special entries.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == 1 && j == abs ( ii ) )
        a(i,j) = i4_sign ( ii );
      elseif ( i == n && j == n + 1 - abs ( jj ) )
        a(i,j) = i4_sign ( jj );
      elseif ( j == i-1 || j == i+1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end

