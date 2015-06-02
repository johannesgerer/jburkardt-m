function [ x, w ] = rule07 ( n )

%*****************************************************************************80
%
%% RULE07 returns the rule of degree 7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2014
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
    0.4595981103653579D-16,0.9258200997725515, ...
    0.6742045114073804D-16,-.9258200997725515, ...
    -.3805544332083157,0.3805544332083157, ...
    0.3805544332083157,-.3805544332083157, ...
    -.8059797829185990,0.8059797829185988, ...
    0.8059797829185990,-.8059797829185988 ];
  ys = [ ...
    -.9258200997725515,-.1073032005210112D-16, ...
    0.9258200997725515,0.1241105822293750D-15, ...
    -.3805544332083157,-.3805544332083157, ...
    0.3805544332083157,0.3805544332083157, ...
    -.8059797829185988,-.8059797829185990, ...
    0.8059797829185988,0.8059797829185990 ];
  ws = [ ...
    0.1711023816204485,0.1711023816204485, ...
    0.1711023816204485,0.1711023816204485, ...
    0.3681147816131979,0.3681147816131979, ...
    0.3681147816131979,0.3681147816131979, ...
    0.1678896179529011,0.1678896179529011, ...
    0.1678896179529011,0.1678896179529011 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  w(1:n) = ws(1:n);

  return
end