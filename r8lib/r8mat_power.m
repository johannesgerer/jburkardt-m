function b = r8mat_power ( n, a, npow )

%*****************************************************************************80
%
%% R8MAT_POWER computes a nonnegative power of an R8MAT.
%
%  Discussion:
%
%    The algorithm is:
%
%      B = I
%      do NPOW times:
%        B = A * B
%      end
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real A(N,N), the matrix to be raised to a power.
%
%    Input, integer NPOW, the power to which A is to be raised.
%    N must be nonnegative.
%
%    Output, real B(N,N), the value of A**NPOW.
%
  if ( npow < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_POWER - Fatal error!\n' );
    fprintf ( 1, '  Input value of NPOW < 0.\n' );
    error ( 'R8MAT_POWER - Fatal error!' );
  end

  b = r8mat_identity ( n );

  for ipow = 1 : npow
    b(1:n,1:n) = a(1:n,1:n) * b(1:n,1:n);
  end

  return
end
