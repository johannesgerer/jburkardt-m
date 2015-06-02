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
%    09 July 2014
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
    -.2677028585910073,0.1510931841533142, ...
    -.1367699195237390,0.8067449309051964 ];
  ys = [ ...
    0.5939017006199488E-01,0.4354087732476309, ...
    -.3280341115590410,-.3400977314285288 ];
  zs = [ ...
    -.3969426941142150,0.2151719254306919, ...
    0.2950846519937133,-.3430378951002550 ];
  ws = [ ...
    0.2918008865477151,0.2706884392356724, ...
    0.3098349601753470,0.9865925745591227E-01 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  x(3,1:n) = zs(1:n);
  w(1:n) = ws(1:n);

  return
end
