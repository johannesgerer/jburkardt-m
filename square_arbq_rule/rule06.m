function [ x, w ] = rule06 ( n )

%*****************************************************************************80
%
%% RULE06 returns the rule of degree 6.
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
    -.7347550761673839,0.8662152988634034, ...
    0.1596873653424614,-.8905137714296896, ...
    -.1469707846748791,0.9240009259977663, ...
    -.8463324986375500,-.4086308482879689, ...
    0.5175294652720337,0.4801002492857063 ];
  ys = [ ...
    0.8933891941643415,-.7037359670513631, ...
    -.9085856749287847,0.1644347368502312, ...
    0.5352177835541986,0.4879643750888035, ...
    -.8394767448218339,-.4262330870004397, ...
    0.9176357850707917,-.1009764561823168 ];
  ws = [ ...
    0.1541850714382379,0.1900556513689156, ...
    0.2246942645703077,0.2465847648329768, ...
    0.5062382287542438,0.1829226437278864, ...
    0.1373586623279704,0.4754388545735908, ...
    0.1856913242244974,0.5252576589275637 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  w(1:n) = ws(1:n);

  return
end