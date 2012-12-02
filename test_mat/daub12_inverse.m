function a = daub12_inverse ( n )

%*****************************************************************************80
%
%% DAUB12_INVERSE returns the inverse of the DAUB12 matrix.
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
  a = ( daub12 ( n ) )';

  return
end
