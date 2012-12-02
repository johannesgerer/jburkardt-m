function ival = r8mat_is_centrosymm ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_IS_CENTROSYMM checks for centrosymmetry.
%
%  Discussion:
%
%    A is centrosymmetric: A(I,J) = A(N+1-I,N+1-J).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the row and column dimensions of 
%    the matrix.  M and N must be positive.
%
%    Input, real A(M,N), the matrix.
%
%    Output, integer IVAL:
%    -1, the matrix is not centrosymmetric.
%    1, the matrix is centrosymmetric.
%
  ival = 1;

  for i = 1 : min ( m, n )
    for j = n : -1 : max ( 1, n - m + 1 )
      if ( a(i,j) ~= a(n+1-i,n+1-j) )
        ival = -1;
        return
      end
    end
  end

  return
end
