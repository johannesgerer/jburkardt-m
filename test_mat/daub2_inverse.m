function a = daub2_inverse ( n )

%*****************************************************************************80
%
%% DAUB2_INVERSE returns the inverse of the DAUB2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 July 2011
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
  a = ( daub2 ( n ) )';

  return
end
