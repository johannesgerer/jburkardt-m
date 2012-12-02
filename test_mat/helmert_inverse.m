function a = helmert_inverse ( n )

%*****************************************************************************80
%
%% HELMERT_INVERSE returns the inverse of the Helmert matrix.
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
%    Output, real A(N,N), the inverse matrix.
%
  a = ( helmert ( n ) )';

  return
end
