function a = quaternion_k ( )

%*****************************************************************************80
%
%% QUATERNION_K returns a 4 by 4 matrix that behaves like the quaternion unit K.
%
%  Formula:
%
%    0  0  0  1
%    0  0 -1  0
%    0  1  0  0
%   -1  0  0  0
%
%  Properties:
%
%    K * 1 =   K
%    K * I =   J
%    K * J = - I
%    K * K = - 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%
  a = [ 0.0,   0.0,   0.0,   1.0; ...
        0.0,   0.0,  -1.0,   0.0; ...
        0.0,   1.0,   0.0,   0.0; ...
       -1.0,   0.0,   0.0,   0.0 ];

  return
end
