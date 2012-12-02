function a = helmert2_inverse ( n, x )

%*****************************************************************************80
%
%% HELMERT2_INVERSE returns the inverse of the HELMERT2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the vector that defines the first row.
%
%    Output, real A(N,N), the inverse matrix.
%
  a = ( helmert2 ( n, x ) )';

  return
end
