function b = a123_inverse ( )

%*****************************************************************************80
%
%% A123_INVERSE returns the pseudo-inverse of the A123 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real B(3,3), the matrix.
%
  b = [ ...
    -0.638888888888888,  -0.166666666666666,   0.305555555555555; ...
    -0.055555555555556,   0.000000000000000,   0.055555555555556; ...
     0.527777777777777,   0.166666666666666,  -0.194444444444444 ];

  return
end