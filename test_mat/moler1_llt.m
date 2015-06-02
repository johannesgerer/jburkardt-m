function a = moler3_llt ( alpha, n )

%*****************************************************************************80
%
%% MOLER1_LLT returns the Cholesky factor of the MOLER1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2015
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

  for j = 1 : n
    a(j,j) = 1.0;
    for i = j + 1 : n
      a(i,j) = alpha;
    end
  end

  return
end
