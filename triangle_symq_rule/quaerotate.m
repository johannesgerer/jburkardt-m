function [ xout, yout ] = quaerotate ( xin, yin )

%*****************************************************************************80
%
%% QUAEROTATE applies a rotation.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    26 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, real XIN, YIN, the coordinates of the point.
%
%    Output, real XOUT, YOUT, the coordinates of the point
%    after rotation.
%

%
%  Initialize the matrix of rotation.
%
  theta = 2.0 * pi / 3.0;
  a11 = cos ( theta );
  a22 = cos ( theta );
  a12 = - sin ( theta );
  a21 = -a12;
%
%  Apply the rotation matrix to the input vector.
%
  xout = a11 * xin + a12 * yin;
  yout = a21 * xin + a22 * yin;

  return
end