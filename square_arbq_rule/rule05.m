function [ x, w ] = rule05 ( n )

%*****************************************************************************80
%
%% RULE05 returns the rule of degree 5.
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
    0.1775868202077551E-01,-.1775868202077539E-01, ...
    0.7788710544649639,-.7788710544649639, ...
    -.7703781288541645,0.7703781288541645, ...
    -.7490353914168658D-33 ];
  ys = [ ...
    -.9659285494001192,0.9659285494001192, ...
    -.5715708301251639,0.5715708301251639, ...
    -.5829672991828014,0.5829672991828014, ...
    0.1356144833394667D-33 ];
  ws = [ ...
    0.2246199725165690,0.2246199725165690, ...
    0.3901817339168917,0.3901817339168917, ...
    0.3953508381187504,0.3953508381187504, ...
    0.8081220356417684 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  w(1:n) = ws(1:n);

  return
end