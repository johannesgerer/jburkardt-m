function a = c8mat_identity ( n )

%*****************************************************************************80
%
%% C8MAT_IDENTITY sets the square matrix A to the identity.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, complex A(N,N), the N by N identity matrix.
%
  a(1:n,1:n) = 0.0;

  for i = 1 : n
    a(i,i) = 1.0;
  end

  return
end
