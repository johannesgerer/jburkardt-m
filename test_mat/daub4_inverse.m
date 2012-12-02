function a = daub4_inverse ( n )

%*****************************************************************************80
%
%% DAUB4_INVERSE returns the inverse of the DAUB4 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = ( daub4 ( n ) )';

  return
end
