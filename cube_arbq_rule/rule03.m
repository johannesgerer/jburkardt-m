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
%    08 July 2014
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
%    Output, real X(3,N), the coordinates of the nodes.
%
%    Output, real W(N), the weights.
%
  xs = [ ...
    -0.5588399103385127E+00, 0.5588399103385127E+00, ...
    -0.6245748884711381E+00, 0.6245748884711382E+00, ...
    0.5311975164163759E+00, -0.5311975164163759E+00 ];
  ys = [ ...
    -0.3347842945931215E+00, 0.3347842945931215E+00, ...
    -0.3608970655525763E+00, 0.3608970655525763E+00, ...
    -0.9062032945290301E+00, 0.9062032945290301E+00 ];
  zs = [ ...
    -0.8055865032240838E+00, 0.8055865032240838E+00, ...
    0.5832521303475051E+00, -0.5832521303475051E+00, ...
    0.8103733422256782E-02, -0.8103733422256782E-02 ];
  ws = [ ...
    0.4391890453578504E+00, 0.4391890453578504E+00, ...
    0.5478113077968971E+00, 0.5478113077968971E+00, ...
    0.4272132092183473E+00, 0.4272132092183473E+00 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  x(3,1:n) = zs(1:n);
  w(1:n) = ws(1:n);

  return
end
