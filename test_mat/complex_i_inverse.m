function a = complex_i_inverse ( )

%*****************************************************************************80
%
%% COMPLEX_I_INVERSE returns the inverse of the COMPLEX_I matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(2,2), the matrix.
%
  a(1:2,1:2) =  [ 0.0, -1.0; ...
                 +1.0,  0.0 ];

  return
end
