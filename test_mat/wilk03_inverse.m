function a = wilk03_inverse ( )

%*****************************************************************************80
%
%% WILK03_INVERSE returns the inverse of the WILK03 matrix.
%
%  Formula:
%
%    1.0D+10  -1.0D+10  0
%    0         10/9     4/9 * 1.0D+10
%    0         0        1.0D+10
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(3,3), the matrix.
%
  a(1:3,1:3) = [  1.0E+10, - 1.0E+10,      0.0; ...
                  0.0,       10.0 / 9.0,   4.0E+10 / 9.0; ...
                  0.0,       0.0,          1.0E+10 ];

  return
end
