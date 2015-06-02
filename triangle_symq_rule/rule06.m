function [ x, y, w ] = rule06 ( )

%*****************************************************************************80
%
%% RULE06 returns the rule of degree 6.
%
%  Discussion:
%
%    Order 6 (12 pts)
%    1/6 data for 6-th order quadrature with 3 nodes.
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
       0.00000000000000000000000000000000, ...
      -0.69739024379082289479659372931424 ];
  y = [ ...
       0.39457278141889907274877084543840, ...
      -0.50854615859082585320530997387282, ...
      -0.54379745836573696334891625304668 ];
  w = [ ...
       0.11274353612785067755726196993061, ...
       0.53124044525363740527637434536885E-01, ...
       0.53478088172200992051637079165337E-01 ];

  return
end