function a = identity_inverse ( n )

%*****************************************************************************80
%
%% IDENTITY_INVERSE returns the inverse of the identity matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
