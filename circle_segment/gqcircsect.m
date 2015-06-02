function [x,y,w] = gqcircsect ( n, omega, R )

%
%% GQCIRCSEGM computes the nodes and weights of a product gaussian formula  
% on a circle sector of a disk centered at the origin 
% with angles in [-omega,omega]

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
%    Input, R: radius of the disk 
%
%    Output, xyw: (ceil((n+1)/2) x ceil((n+2)/2) x 3 array of (xnodes,ynodes,weights) 

%
%  Compute the trigonometric gaussian formula on the arc.
%
  tw = trigauss ( n, -omega, omega );
%
%  Compute the algebraic gaussian formula on [0,R];
%
  ab = r_jacobi ( ceil((n+2)/2), 0, 0 );
  rw = gauss ( ceil((n+2)/2), ab );
  rw(:,1) = (rw(:,1)+1)/2*R;
  rw(:,2) = rw(:,2)/2*R;
  
%
%  Create the grid.
%
  [ r, theta ] = meshgrid ( rw(:,1), tw(:,1) );
  [ w1, w2 ]   = meshgrid ( rw(:,2), tw(:,2) );
%
%  Nodal cartesian coordinates and weights.
%
  x = (r(:) .* cos ( theta(:) ))';
  y = (r(:) .* sin ( theta(:) ))';
  w = (r(:) .* w1(:) .* w2(:))';

  return
end
