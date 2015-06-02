function a = dif2_llt ( n )

%*****************************************************************************80
%
%% DIF2_LLT returns the Cholesky factor of the DIF2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2007
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
    a(i,i) = sqrt ( i + 1 ) / sqrt ( i );
  end

  for i = 2 : n
    a(i,i-1) = - sqrt ( i - 1 ) / sqrt ( i );
  end

  return
end
