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
    0.6700319885140564,0.6424528854269665, ...
    -.5079273596590297 ];
  ys = [ ...
    -.8727274074699508,0.8751842913892396, ...
    -.8014238374817481E-02 ];
  ws = [ ...
    0.6106555690526828,0.6235399890121793, ...
    0.1594231566681328E+01 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  w(1:n) = ws(1:n);

  return
end