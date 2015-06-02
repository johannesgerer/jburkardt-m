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
   -0.4380038262474289E+00, -0.4908226851347194E+00, ...
    0.6313544088573617E+00,  0.8010097448936463E+00 ];
  ys = [ ...
    0.6281382942978499E-01, -0.1242878410373149E+00, ...
    0.8674258021608136E+00, -0.9533664350988082E+00 ];
  zs = [ ...
   -0.8444012341886235E+00,  0.6401086714464984E+00, ...
    0.1317904550701903E+00, -0.9165855436522309E-01 ];
  ws = [ ...
    0.7590201299956376E+00, 0.9433497505402911E+00, ...
    0.6278119491594441E+00, 0.4982452950508173E+00 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  x(3,1:n) = zs(1:n);
  w(1:n) = ws(1:n);

  return
end
