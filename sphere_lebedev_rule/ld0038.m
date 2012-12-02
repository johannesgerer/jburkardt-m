function [ x, y, z, w ] = ld0038 ( )

%*****************************************************************************80
%
%% LD0038 computes the 38 point Lebedev angular grid.
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
  x = zeros(38,1);
  y = zeros(38,1);
  z = zeros(38,1);
  w = zeros(38,1);
  a = 0.0;
  b = 0.0;
  v = 0.9523809523809524E-02;
  [ n, x, y, z, w ] = gen_oh ( 1, n, a, b, v, x, y, z, w );
  v = 0.3214285714285714E-01;
  [ n, x, y, z, w ] = gen_oh ( 3, n, a, b, v, x, y, z, w );
  a = 0.4597008433809831;
  v = 0.2857142857142857E-01;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  
  return
end
