function [ x, y, w ] = rule04 ( )

%*****************************************************************************80
%
%% RULE04 returns the rule of degree 4.
%
%  Discussion:
%
%    Order 4 (6 pts)
%    1/6 data for 4-th order quadrature with 2 nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
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
%  Parameters:
%
%    Output, real X(*), Y(*), the coordinates of the nodes.
%
%    Output, real W(*), the weights.
%
  x = [ ...
       0.00000000000000000000000000000000, ...
       0.00000000000000000000000000000000 ];
  y = [ ...
      -0.39011034927098671317419951524681, ...
       0.83747122925185483484415621413487 ];
  w = [ ...
       0.14699335257362380894667320570121, ...
       0.72352316251791601189863277931619E-01 ];

  return
end