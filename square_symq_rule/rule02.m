function [ x, w ] = rule02 ( n )

%*****************************************************************************80
%
%% RULE02 returns the rule of degree 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2014
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
   -0.5773502691896256E+00, ...
    0.5773502691896260E+00, ...
    0.5773502691896256E+00, ...
   -0.5773502691896260E+00 ];
  ys = [ ...
   -0.5773502691896260E+00, ...
   -0.5773502691896256E+00, ...
    0.5773502691896260E+00, ...
    0.5773502691896256E+00 ];
  ws = [ ...
    0.7071067811865476E+00, ...
    0.7071067811865476E+00, ...
    0.7071067811865476E+00, ...
    0.7071067811865476E+00 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  w(1:n) = ws(1:n);

  return
end