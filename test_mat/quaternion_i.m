function a = quaternion_i ( )

%*****************************************************************************80
%
%% QUATERNION_I returns a 4 by 4 matrix that behaves like the quaternion unit I.
%
%  Formula:
%
%    0  1  0  0
%   -1  0  0  0
%    0  0  0 -1
%    0  0  1  0
%
%  Properties:
%
%    I * 1 =   I
%    I * I = - 1
%    I * J =   K
%    I * K = - J
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
  a = [  0.0,  1.0,  0.0,  0.0; ...
        -1.0,  0.0,  0.0,  0.0; ...
         0.0,  0.0,  0.0, -1.0; ...
         0.0,  0.0,  1.0,  0.0 ];

  return
end
