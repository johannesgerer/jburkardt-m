function a = bodewig_right ( )

%*****************************************************************************80
%
%% BODEWIG_RIGHT returns the right eigenvectors of the Bodewig matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 November 2007
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
   0.263462395147524,   0.560144509774526,   0.378702689441644,  -0.688047939843040; ...
   0.659040718046439,   0.211632763260098,   0.362419048574935,   0.624122855455373; ...
  -0.199633529128396,   0.776708263894565,  -0.537935161097828,   0.259800864702728; ...
  -0.675573350827063,   0.195381612446620,   0.660198809976478,   0.263750269148100 ];

  return
end
