function a = rutis3_eigen_left ( )

%*****************************************************************************80
%
%% RUTIS3_EIGEN_LEFT returns the left eigenvectors of the RUTIS3 matrix.
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
%    Output, complex A(4,4), the left eigenvector matrix.
%
  i = sqrt ( -1.0 );

  a(1:4,1:4) = [ ...
     1.0,  1.0,   1.0,  1.0; ...
    -1.0,  1.0,   i,   -i; ...
     1.0, -1.0,   i,   -i; ...
     1.0,  1.0,  -1.0, -1.0 ]';

  return
end
