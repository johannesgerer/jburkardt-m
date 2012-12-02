function a = daub10_inverse ( n )

%*****************************************************************************80
%
%% DAUB10_INVERSE returns the inverse of the DAUB10 matrix.
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
  a = ( daub10 ( n ) )';

  return
end
