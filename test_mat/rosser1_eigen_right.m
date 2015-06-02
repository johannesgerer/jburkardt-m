function x = rosser1_eigen_right ( )

%*****************************************************************************80
%
%% ROSSER1_EIGEN_RIGHT returns the right eigenvectors of the ROSSER1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real X(8,8), the right eigenvector matrix.
%
  a = sqrt ( 10405.0 );
  b = sqrt ( 26.0 );
%
%  Note that the matrix entries are listed by COLUMN.
%
  x(1:8,1:8) = [ ...
    2.0, 1.0, 1.0, 2.0, 102.0 + a, 102.0 + a, -204.0 - 2.0 * a, -204.0 - 2.0 * a; ...
    1.0, 2.0, -2.0, -1.0, 14.0, 14.0,       7.0,       7.0; ...
    2.0, -1.0, 1.0, -2.0, 5.0 - b, -5.0 + b, -10.0 + 2.0 * b, 10.0 - 2.0 * b; ...
    7.0, 14.0, -14.0, -7.0,  -2.0, -2.0,      -1.0,      -1.0; ...
    1.0, -2.0,  -2.0,  1.0,  -2.0, 2.0,      -1.0,       1.0; ...
    2.0, -1.0, 1.0, -2.0, 5.0 + b, -5.0 - b, -10.0 - 2.0 * b, 10.0 + 2.0 * b; ...
    1.0, -2.0,  -2.0,  1.0,   2.0, -2.0,       1.0,      -1.0; ...
    2.0, 1.0, 1.0, 2.0, 102.0 - a, 102.0 - a, -204.0 + 2.0 * a, -204.0 + 2.0 * a ]';

  return
end
