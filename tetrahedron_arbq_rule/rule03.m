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
    -.1685037180276000,0.2783799427534418E-01, ...
    -.3512216177343445,0.4308532463549043, ...
    -.4676763747967377,0.1492831253848431 ];
  ys = [ ...
    0.1910914916271708,-.2304932838839657E-01, ...
    0.1835144026339993,-.2474715823180446, ...
    -.4235250827264375,0.6397847685164516 ];
  zs = [ ...
    -.3896267314585163,0.5481350663241830, ...
    0.5147815330343534E-01,-.1683315641007033, ...
    -.1586973077889307,-.1080219253055393 ];
  ws = [ ...
    0.1287213727402025,0.2179034339695993, ...
    0.1243503792062836,0.2446917182410072, ...
    0.1365439875826512,0.1187726516749031 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  x(3,1:n) = zs(1:n);
  w(1:n) = ws(1:n);

  return
end
