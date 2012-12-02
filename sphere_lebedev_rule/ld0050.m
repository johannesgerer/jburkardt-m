function [ x, y, z, w ] = ld0050 ( )

%*****************************************************************************80
%
%% LD0050 computes the 50 point Lebedev angular grid.
%
%  Modified:
%
%    14 September 2010
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
  x = zeros(50,1);
  y = zeros(50,1);
  z = zeros(50,1);
  w = zeros(50,1);
  a = 0.0;
  b = 0.0;
  v = 0.1269841269841270E-01;
  [ n, x, y, z, w ] = gen_oh ( 1, n, a, b, v, x, y, z, w );
  v = 0.2257495590828924E-01;
  [ n, x, y, z, w ] = gen_oh ( 2, n, a, b, v, x, y, z, w );
  v = 0.2109375000000000E-01;
  [ n, x, y, z, w ] = gen_oh ( 3, n, a, b, v, x, y, z, w );
  a = 0.3015113445777636;
  v = 0.2017333553791887E-01;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  
  return
end
