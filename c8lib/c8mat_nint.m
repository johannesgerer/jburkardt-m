function a = c8mat_nint ( m, n, a )

%*****************************************************************************80
%
%% C8MAT_NINT rounds the entries of a C8MAT.
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
%    Input, integer M, N, the order of the array.
%
%    Input, complex A(M,N), the array to be rounded.
%
%    Output, complex A(M,N), the rounded array.
%
  for j = 1 : n
    for i = 1 : m
      a(i,j) = c8_nint ( a(i,j) );
    end
  end

  return
end
