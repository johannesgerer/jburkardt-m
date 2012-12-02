function a = kershaw_inverse ( )

%*****************************************************************************80
%
%% KERSHAW_INVERSE returns the inverse of the KERSHAW matrix.
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
  a = [ ...
     3.0,  2.0,  0.0, -2.0; ...
     2.0,  3.0,  2.0,  0.0; ...
     0.0,  2.0,  3.0,  2.0; ...
    -2.0,  0.0,  2.0,  3.0 ];

  return
end
