function [phi_g, ip, x_g,  w_g] = boundary(i_bnd, x_local, n_gauss)

% Compute values of 2D quadratic bases at 1D Gauss points along a boundary
% Also return a list of (3) indices for the non-zero basis functions, 
% the co-ords of the Gauss points and the 1D integration weights
%
% i_bnd specifies the triangle boundary of interest
%       1 - along s   = 0 boundary   - points [1 4 2]
%       2 - along r+s = 1 boundary   - points [2 5 3]
%       3 - along r   = 0 boundary   - points [3 6 1]
% x_local 6 x 2 array of nodal coordinate points (x, y)
% n_gauss  the number of Gauss points for the 1D integration
 
% phi_g is a n_gauss array x 3 - values of the 3 non-zero quadratic basis
%                                functions at the n_gauss 1D integration points
% ip  array of indices for non-zero quadratic functions
% x_g   is an n_gauss x 2 array of coordinates for the 1D Gauss points
% w_g   is an n_gauss array of integration weights

%% extract the Gauss weights and points on [- 1, 1];
     [r,  w_g] = oned_gauss(n_gauss); % 1 \le n_gauss \le 6
     
     r1 = (1+r)/2; % map to [0, 1]
     r1 = r1(:);   % make sure it's a column
  
%% which boundary is requested 
     switch i_bnd
         case {1}
             ip = [ 1 4 2];
         case {2}
             ip = [ 2 5 3];
         case {3}
             ip = [ 3 6 1];
         otherwise
             disp(['Illegal i_bnd = ', int2str(i_bnd)])
             return
     end
 
%% Coordinates of the Gauss points
     x_g = (1-r1)*x_local(ip(1),:) ...
          +   r1 *x_local(ip(3),:);

%% Scale the weights by the (unsigned) length of the interval
     djac  =  norm(x_local(ip(3), :) - x_local(ip(1), :))/2; 
     w_g   =  w_g*djac;
     
%% Evaluate the test functions
  
      p1 = 1 -3*r1 + 2*r1.^2; % p1(r = 0)  = 1
      p2 =    4*r1 - 4*r1.^2; % p2(r = 1/2)= 1
      p3 =   -  r1 + 2*r1.^2; % p3(r = 1)  = 1

      phi_g = [p1(:)  p2(:) p3(:) ]; 

  return
end
