function [ x, y, z, w ] = ld0194 ( )

%*****************************************************************************80
%
%% LD0194 computes the 194 point Lebedev angular grid.
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
  x = zeros(194,1);
  y = zeros(194,1);
  z = zeros(194,1);
  w = zeros(194,1);
  a = 0.0;
  b = 0.0;
  v = 0.1782340447244611E-02;
  [ n, x, y, z, w ] = gen_oh ( 1, n, a, b, v, x, y, z, w );
  v = 0.5716905949977102E-02;
  [ n, x, y, z, w ] = gen_oh ( 2, n, a, b, v, x, y, z, w );
  v = 0.5573383178848738E-02;
  [ n, x, y, z, w ] = gen_oh ( 3, n, a, b, v, x, y, z, w );
  a = 0.6712973442695226;
  v = 0.5608704082587997E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.2892465627575439;
  v = 0.5158237711805383E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.4446933178717437;
  v = 0.5518771467273614E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.1299335447650067;
  v = 0.4106777028169394E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.3457702197611283;
  v = 0.5051846064614808E-02;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.1590417105383530;
  b = 0.8360360154824589;
  v = 0.5530248916233094E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  
  return
end
