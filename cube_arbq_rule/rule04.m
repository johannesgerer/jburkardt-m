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
    0.5378961355313995E+00, 0.9230515460764596E+00, ...
    -0.3017729559458644E+00, -0.4286245373611857E-01, ...
    -0.4919281030834148E+00, -0.6331783925165083E+00, ...
    0.3433859697316836E+00, 0.7159140285867756E+00, ...
    -0.9634379969028102E+00, 0.9533570645781855E+00 ];
  ys = [ ...
    -0.2921294864376587E+00, 0.1338187840340383E-01, ...
    -0.6336712971880923E+00, 0.8637293692260690E+00, ...
    0.6650083378678769E+00, -0.6579587923349518E+00, ...
    0.1314461211661866E+00, -0.9334671020954506E+00, ...
    0.2821274186555609E+00, 0.9271218349088852E+00 ];
  zs = [ ...
    -0.9904747768071651E+00, 0.9034506944137641E+00, ...
    0.7478682467863593E+00, 0.6980492706389707E+00, ...
    -0.6792172628059848E+00, -0.5142053190660802E+00, ...
    -0.1491834467493042E-01, -0.1124003569988050E-01, ...
    0.4370157998712708E+00, -0.4433572115706369E+00 ];
  ws = [ ...
    0.2015871863001034E+00, 0.1475782644463766E+00, ...
    0.3427728700669111E+00, 0.2477511243780946E+00, ...
    0.3268948471688580E+00, 0.3510375486490554E+00, ...
    0.6548775481546729E+00, 0.2014557914699008E+00, ...
    0.2371445377295266E+00, 0.1173274063826890E+00 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  x(3,1:n) = zs(1:n);
  w(1:n) = ws(1:n);

  return
end
