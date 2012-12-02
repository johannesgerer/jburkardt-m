function [ x, y, z, w ] = ld0146 ( )

%*****************************************************************************80
%
%% LD0146 computes the 146 point Lebedev angular grid.
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
  x = zeros(146,1);
  y = zeros(146,1);
  z = zeros(146,1);
  w = zeros(146,1);
  a = 0.0;
  b = 0.0;
  v = 0.5996313688621381E-03;
  [ n, x, y, z, w ] = gen_oh ( 1, n, a, b, v, x, y, z, w );
  v = 0.7372999718620756E-02;
  [ n, x, y, z, w ] = gen_oh ( 2, n, a, b, v, x, y, z, w );
  v = 0.7210515360144488E-02;
  [ n, x, y, z, w ] = gen_oh ( 3, n, a, b, v, x, y, z, w );
  a = 0.6764410400114264;
  v = 0.7116355493117555E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.4174961227965453;
  v = 0.6753829486314477E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.1574676672039082;
  v = 0.7574394159054034E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.1403553811713183;
  b = 0.4493328323269557;
  v = 0.6991087353303262E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  
  return
end
