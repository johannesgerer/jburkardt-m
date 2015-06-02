function [ z, w ] = quaecopy ( xs, ys, ws, kk )

%*****************************************************************************80
%
%% QUAECOPY copies a quadrature rule into user arrays Z and W.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    26 June 2014
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
%    Input, real XS(KK), YS(KK), the point coordinates to copy.
%
%    Input, real WS(KK), the weights to copy.
%
%    Input, integer KK, the number of values to copy.
%
%    Output, real Z(2,KK), the copied point coordinates.
%
%    Output, real W(KK), the copied weights.
%
  z(1,1:kk) = xs(1:kk);
  z(2,1:kk) = ys(1:kk);
  w(1:kk) = ws(1:kk);

  return
end
