function [ uout, vout ] = triasimp ( x, y )

%*****************************************************************************80
%
%% TRIASIMP maps a point from the reference triangle to the simplex.
%
%  Discussion:
%
%    Map the reference triangle with vertices
%      (-1,-1/sqrt(3)), (1,-1/sqrt(3)), (0,2/sqrt(3))
%    to the simplex with vertices
%      (0,0), (1,0), (0,1).
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
%    Input, real X, Y, the coordinates of a point in the
%    reference triangle.
%
%    Output, real UOUT, VOUT, the coordinates of the corresponding
%    point in the simplex.
%
  scale = 1.0 / sqrt ( 3.0 );

  uout = 0.5 * ( x + 1.0 ) - 0.5 * scale * ( y + scale );

  vout = 1.0 * scale * ( y + scale );

  return
end