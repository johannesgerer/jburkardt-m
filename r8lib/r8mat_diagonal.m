function a = r8mat_diagonal ( n, diag )

%*****************************************************************************80
%
%% R8MAT_DIAGONAL returns a diagonal matrix as an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real DIAG(N), the diagonal entries.
%
%    Output, real A(N,N), the N by N identity matrix.
%
  a(1:n,1:n) = 0.0;

  for i = 1 : n
    a(i,i) = diag(i);
  end

  return
end
