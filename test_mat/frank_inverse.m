function a = frank_inverse ( n )

%*****************************************************************************80
%
%% FRANK_INVERSE returns the inverse of the Frank matrix.
%
%  Formula:
%
%    if ( I = J-1 )
%      A(I,J) = -1
%    elseif ( I = J )
%      if ( I = 1 )
%        A(I,J) = 1
%      else
%        A(I,J) = N + 2 - I
%    elseif ( J < I )
%      A(I,J) = - (N+1-I) * A(I-1,J)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%     1  -1  0  0  0
%    -4   5 -1  0  0
%    12 -15  4 -1  0
%   -24  30 -8  3 -1
%    24 -30  8 -3  2
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is lower Hessenberg.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    A is integral: int ( A ) = A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
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
  for i = 1 : n
    for j = 1 : n

      if ( i == j-1 )
        a(i,j) = - 1.0;
      elseif ( i == j )
        if ( i == 1 )
          a(i,j) = 1.0;
        else
          a(i,j) = ( n + 2 - i );
        end
      elseif ( j < i )
        a(i,j) = - ( n + 1 - i ) * a(i-1,j);
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
