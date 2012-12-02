function [ x, y, z, w ] = ld0350 ( )

%*****************************************************************************80
%
%% LD0350 computes the 350 point Lebedev angular grid.
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
  x = zeros(350,1);
  y = zeros(350,1);
  z = zeros(350,1);
  w = zeros(350,1);
  a = 0.0;
  b = 0.0;
  v = 0.3006796749453936E-02;
  [ n, x, y, z, w ] = gen_oh ( 1, n, a, b, v, x, y, z, w );
  v = 0.3050627745650771E-02;
  [ n, x, y, z, w ] = gen_oh ( 3, n, a, b, v, x, y, z, w );
  a = 0.7068965463912316;
  v = 0.1621104600288991E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.4794682625712025;
  v = 0.3005701484901752E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.1927533154878019;
  v = 0.2990992529653774E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6930357961327123;
  v = 0.2982170644107595E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.3608302115520091;
  v = 0.2721564237310992E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6498486161496169;
  v = 0.3033513795811141E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.1932945013230339;
  v = 0.3007949555218533E-02;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.3800494919899303;
  v = 0.2881964603055307E-02;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.2899558825499574;
  b = 0.7934537856582316;
  v = 0.2958357626535696E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.9684121455103957E-01;
  b = 0.8280801506686862;
  v = 0.3036020026407088E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.1833434647041659;
  b = 0.9074658265305127;
  v = 0.2832187403926303E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  
  return
end
