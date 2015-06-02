function a = a123_eigen_right ( )

%*****************************************************************************80
%
%% A123_EIGEN_RIGHT returns the right eigenvectors of the A123 matrix.
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
%    Output, real A(3,3), the right eigenvector matrix.
%
  a = [ ...
    -0.231970687246286,  -0.785830238742067,   0.408248290463864; ...
    -0.525322093301234,  -0.086751339256628,  -0.816496580927726; ...
    -0.818673499356181,   0.612327560228810,   0.408248290463863 ];

  return
end