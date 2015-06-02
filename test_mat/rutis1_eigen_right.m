function a = rutis1_eigen_right ( )

%*****************************************************************************80
%
%% RUTIS1_EIGEN_RIGHT returns the right eigenvectors of the RUTIS1 matrix.
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
%    Output, real A(4,4), the right eigenvector matrix.
%
  a(1:4,1:4) = [ ...
     1.0,  1.0,  1.0,  1.0; ...
     1.0,  0.0,  0.0, -1.0; ...
     0.0,  1.0, -1.0,  0.0; ...
     1.0, -1.0, -1.0,  1.0 ]';

  return
end
