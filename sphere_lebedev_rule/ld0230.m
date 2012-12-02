function [ x, y, z, w ] = ld0230 ( )

%*****************************************************************************80
%
%% LD0230 computes the 230 point Lebedev angular grid.
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
  x = zeros(230,1);
  y = zeros(230,1);
  z = zeros(230,1);
  w = zeros(230,1);
  a = 0.0;
  b = 0.0;
  v = -0.5522639919727325E-01;
  [ n, x, y, z, w ] = gen_oh ( 1, n, a, b, v, x, y, z, w );
  v = 0.4450274607445226E-02;
  [ n, x, y, z, w ] = gen_oh ( 3, n, a, b, v, x, y, z, w );
  a = 0.4492044687397611;
  v = 0.4496841067921404E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.2520419490210201;
  v = 0.5049153450478750E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6981906658447242;
  v = 0.3976408018051883E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6587405243460960;
  v = 0.4401400650381014E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.4038544050097660E-01;
  v = 0.1724544350544401E-01;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.5823842309715585;
  v = 0.4231083095357343E-02;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.3545877390518688;
  v = 0.5198069864064399E-02;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.2272181808998187;
  b = 0.4864661535886647;
  v = 0.4695720972568883E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  
  return
end
