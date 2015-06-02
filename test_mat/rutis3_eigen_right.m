function a = rutis3_eigen_right ( )

%*****************************************************************************80
%
%% RUTIS3_EIGEN_RIGHT returns the right eigenvectors of the RUTIS3 matrix.
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
%    Output, complex A(4,4), the right eigenvector matrix.
%
  i = sqrt ( -1.0 );

  a(1:4,1:4) = [
     1.0,  - 1.0,    1.0,   1.0; ...
     1.0,  - i     - i,    -1.0; ...
     1.0,    i,      i,    -1.0; ...
     11.0,   1.0,  - 1.0,   1.0 ]';

  return
end

 
