function a = quaternion_j ( )

%*****************************************************************************80
%
%% QUATERNION_J returns a 4 by 4 matrix that behaves like the quaternion unit J.
%
%  Formula:
%
%    0  0  1  0
%    0  0  0  1
%   -1  0  0  0
%    0 -1  0  0
%
%  Properties:
%
%    J * 1 =   J
%    J * I = - K
%    J * J = - 1
%    J * K =   I
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

%
%  Note that the matrix entries are listed by row.
%
  a = [   0.0,   0.0,   1.0,   0.0; ...
          0.0,   0.0,   0.0,   1.0; ...
         -1.0,   0.0,   0.0,   0.0; ...
          0.0,  -1.0,   0.0,   0.0 ];

  return
end
