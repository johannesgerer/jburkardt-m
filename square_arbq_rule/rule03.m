function [ x, w ] = rule03 ( n )

%*****************************************************************************80
%
%% RULE03 returns the rule of degree 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 July 2014
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
%    Input, integer N, the number of nodes.
%
%    Output, real X(2,N), the coordinates of the nodes.
%
%    Output, real W(N), the weights.
%
  xs = [ ...
    -.5773502691896256,0.5773502691896260, ...
    0.5773502691896256,-.5773502691896260 ];
  ys = [ ...
    -.5773502691896260,-.5773502691896256, ...
    0.5773502691896260,0.5773502691896256 ];
  ws = [ ...
    0.7071067811865476,0.7071067811865476, ...
    0.7071067811865476,0.7071067811865476 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  w(1:n) = ws(1:n);

  return
end