function [ x, y, z, w ] = ld0590 ( )

%*****************************************************************************80
%
%% LD0590 computes the 590 point Lebedev angular grid.
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
  x = zeros(590,1);
  y = zeros(590,1);
  z = zeros(590,1);
  w = zeros(590,1);
  a = 0.0;
  b = 0.0;
  v = 0.3095121295306187E-03;
  [ n, x, y, z, w ] = gen_oh ( 1, n, a, b, v, x, y, z, w );
  v = 0.1852379698597489E-02;
  [ n, x, y, z, w ] = gen_oh ( 3, n, a, b, v, x, y, z, w );
  a = 0.7040954938227469;
  v = 0.1871790639277744E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6807744066455243;
  v = 0.1858812585438317E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6372546939258752;
  v = 0.1852028828296213E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.5044419707800358;
  v = 0.1846715956151242E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.4215761784010967;
  v = 0.1818471778162769E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.3317920736472123;
  v = 0.1749564657281154E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.2384736701421887;
  v = 0.1617210647254411E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.1459036449157763;
  v = 0.1384737234851692E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6095034115507196E-01;
  v = 0.9764331165051050E-03;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6116843442009876;
  v = 0.1857161196774078E-02;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.3964755348199858;
  v = 0.1705153996395864E-02;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.1724782009907724;
  v = 0.1300321685886048E-02;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.5610263808622060;
  b = 0.3518280927733519;
  v = 0.1842866472905286E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.4742392842551980;
  b = 0.2634716655937950;
  v = 0.1802658934377451E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.5984126497885380;
  b = 0.1816640840360209;
  v = 0.1849830560443660E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.3791035407695563;
  b = 0.1720795225656878;
  v = 0.1713904507106709E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.2778673190586244;
  b = 0.8213021581932511E-01;
  v = 0.1555213603396808E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.5033564271075117;
  b = 0.8999205842074875E-01;
  v = 0.1802239128008525E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  
  return
end
