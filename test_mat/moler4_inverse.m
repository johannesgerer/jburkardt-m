function a = moler4_inverse ( )

%*****************************************************************************80
%
%% MOLER4_INVERSE returns the inverse of the MOLER4 matrix.
%
%  Example:
%
%    0  1  0  0
%    0  0  1  0
%    0  0  0  1
%   -1  0  2  0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2015
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
%  Matrix entries are listed by row.
%
  a = [ ...
    0.0,  1.0,  0.0,  0.0; ...
    0.0,  0.0,  1.0,  0.0; ...
    0.0,  0.0,  0.0,  1.0; ...
   -1.0,  0.0,  2.0,  0.0 ];

  return
end