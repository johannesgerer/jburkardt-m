function a = invol_inverse ( n )

%*****************************************************************************80
%
%% INVOL_INVERSE returns the inverse of the INVOL matrix.
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
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = invol ( n );

  return
end
