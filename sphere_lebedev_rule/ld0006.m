function [ x, y, z, w ] = ld0006 ( )

%*****************************************************************************80
%
%% LD0006 computes the 6 point Lebedev angular grid.
%
%  Modified:
%
%    15 September 2010
%
%  Author:
%
%    Dmitri Laikov
%
%  Reference:
%
%    Vyacheslav Lebedev, Dmitri Laikov,
%    A quadrature formula for the sphere of the 131st
%    algebraic order of accuracy,
%    Russian Academy of Sciences Doklady Mathematics,
%    Volume 59, Number 3, 1999, pages 477-481.
%
%  Parameters:
%
%    Output, real X(N), Y(N), Z(N), W(N), the coordinates
%    and weights of the points.
%
  n = 0;
  x = zeros(6,1);
  y = zeros(6,1);
  z = zeros(6,1);
  w = zeros(6,1);
  a = 0.0;
  b = 0.0;
  v = 0.1666666666666667;
  [ n, x, y, z, w ] = gen_oh ( 1, n, a, b, v, x, y, z, w );
  
  return
end
