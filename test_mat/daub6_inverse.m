function a = daub6_inverse ( n )

%*****************************************************************************80
%
%% DAUB6_INVERSE returns the inverse of the DAUB6 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2011
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
  a = ( daub6 ( n ) )';

  return
end
