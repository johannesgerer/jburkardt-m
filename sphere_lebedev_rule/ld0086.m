function [ x, y, z, w ] = ld0086 ( )

%*****************************************************************************80
%
%% LD0086 computes the 86 point Lebedev angular grid.
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
  x = zeros(86,1);
  y = zeros(86,1);
  z = zeros(86,1);
  w = zeros(86,1);
  a = 0.0;
  b = 0.0;
  v = 0.1154401154401154E-01;
  [ n, x, y, z, w ] = gen_oh ( 1, n, a, b, v, x, y, z, w );
  v = 0.1194390908585628E-01;
  [ n, x, y, z, w ] = gen_oh ( 3, n, a, b, v, x, y, z, w );
  a = 0.3696028464541502;
  v = 0.1111055571060340E-01;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6943540066026664;
  v = 0.1187650129453714E-01;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.3742430390903412;
  v = 0.1181230374690448E-01;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  
  return
end
