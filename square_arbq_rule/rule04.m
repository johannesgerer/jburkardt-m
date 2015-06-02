function [ x, w ] = rule04 ( n )

%*****************************************************************************80
%
%% RULE04 returns the rule of degree 4.
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
    0.8434867168489557,0.7481765370372371, ...
    -.4061851500656107,-.4581090172172534, ...
    0.1816993641713940,-.9077196977637252 ];
  ys = [ ...
    0.7332250861965538,-.6280294280975105, ...
    -.7973798546121016,0.8743017248509551, ...
    0.1628466016041256,0.8506794801388022E-02 ];
  ws = [ ...
    0.2754640609309160,0.4372667066134153, ...
    0.4966805368802857,0.3707670373943532, ...
    0.8675752571634261,0.3806735257637942 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  w(1:n) = ws(1:n);

  return
end