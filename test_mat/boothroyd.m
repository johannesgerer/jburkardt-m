function a = boothroyd ( n )

%*****************************************************************************80
%
%% BOOTHROYD returns the BOOTHROYD matrix.
%
%  Formula:
%
%    A(I,J) = C(N+I-1,I-1) * C(N-1,N-J) * N / ( I + J - 1 )
%
%  Example:
%
%    N = 5
%
%     5    10    10     5     1
%    15    40    45    24     5
%    35   105   126    70    15
%    70   224   280   160    35
%   126   420   540   315    70
%
%  Properties:
%
%    A is not symmetric.
%
%    A is positive definite.
%
%    det ( A ) = 1.
%
%    The inverse matrix has the same entries, but with alternating sign.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
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
  a = zeros ( n, n );

  for i = 1 : n

    for j = 1 : n

      a(i,j) = r8_choose ( n+i-1, i-1 ) * r8_choose ( n-1, n-j ) * n ...
        / ( i + j - 1 );

    end

  end

  return
end
