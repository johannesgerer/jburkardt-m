function [x,y,w] = gqcircsegm ( n, omega, r )

%
%% GQCIRCSEGM computes the nodes and weights of a product gaussian formula  
% on a circle segment of a disk centered at the origin 
% with angles in [0,omega]

% uses the routines:
%
% r_jacobi.m, gauss.m from
% www.cs.purdue.edu/archives/2002/wxg/codes/OPQ.html
%
% trigauss.m 
% http://www.math.unipd.it/~marcov/mysoft/trigauss.m
%
%  Modified:
%
%    16 May 2013
%
%  Author:
%
%    Gaspare Da Fies, Marco Vianello, 
%    University of Padova 
%
%  Parameters:
%
%    Input, integer n: algebraic degree of exactness.
%
%    Input, real omega: half-length of the angular interval, 0<omega<=pi
%
%    Input, r: radius of the disk 
%
%    Output, xyw: (ceil((n+1)/2) x ceil((n+2)/2) x 3 array of (xnodes,ynodes,weights) 

%
%  Compute the trigonometric gaussian formula on the arc.
%
  tw = trigauss ( n + 2, 0, omega );
%
%  Compute the algebraic gaussian formula on [-1,1];
%
  ab = r_jacobi ( ceil((n+1)/2), 0, 0 );
  xw = gauss ( ceil((n+1)/2), ab );
%
%  Create the grid.
%
  [ t, theta ] = meshgrid ( xw(:,1), tw(:,1) );
  [ w1, w2 ]   = meshgrid ( xw(:,2), tw(:,2) );
%
%  Nodal cartesian coordinates and weights.
%
  s = sin ( theta(:) );
  x = (r * cos ( theta(:) ))';
  y = (r * t(:) .* s)';
  w = (r^2 * s.^2 .* w1(:) .* w2(:))';

  return
end

