function [x_g,w_g,phi0,phi1,p0_x,p1_x,p0_xx,p1_xx] = ...
         oned_shapeherm(x,r,w)

%*****************************************************************************80
%
%  oned_shapeherm.m - computes test functions and derivatives on a
%                     (C1+) Hermite element given element coordinates 
%                     and Gauss points.
%
%  Copyright (c) 2007, Jeff Borggaard, Virginia Tech
%  Version: 1.0a
%
%  Usage:    [x_g,w_g,phi0,phi1,p0_x,p1_x,p0_xx,p1_xx] = ...
%                                          oned_shapeherm(x_local,r,w)
%
%  Variables:     x_local
%                        Coordinates of the element nodes
%                 r
%                        Coordinates of Gauss points in (-1,1)
%                 w
%                        Gauss weights associated with r
%
%                 x_g
%                        Coordinates of Gauss points in the element
%                 w_g
%                        Gauss weights scaled by the element Jacobian
%                 phi*
%                        Value of element shape functions at x_g
%                 p*_x
%                        First spatial derivatives of phi
%                 p*_xx
%                        Second spatial derivatives of phi
%-----------------------------------------------------------------------

% [n,t1] = size(x);     % n = 2, representing the endpoints of the interval
                        % t1 had better be 1, since this is ONED_shapeherm
  rule   = length(r);   % derive the order of the quadrature rule

  % Transform coordinates for linear elements
    len = ( x(2,1)-x(1,1) );
    c0 = len/2;
    c1 = ( x(2,1)+x(1,1) )/2;

    x_g = c0*r + c1;

    phi0(:,1) = ( 1-r ).^2 .* ( .25*r + .50);
    phi0(:,2) = ( 1+r ).^2 .* (-.25*r + .50);

    phi1(:,1) = ( 1-r ).^2 .* ( .125*r + .125)*len;
    phi1(:,2) = ( 1+r ).^2 .* ( .125*r - .125)*len;
    
    p0_r(:,1) = ( 1-r ) .* (-.75*r - .75);
    p0_r(:,2) = ( 1+r ) .* (-.75*r + .75);
    
    p1_r(:,1) = ( 1-r ) .* (-.375*r - .125)*len;
    p1_r(:,2) = ( 1+r ) .* ( .375*r - .125)*len;

    dxdr = c0;
    djac = dxdr;
    drdx = 1./djac;
    
    
    p0_x(:,1) = p0_r(:,1).*drdx;
    p0_x(:,2) = p0_r(:,2).*drdx;
    
    p1_x(:,1) = p1_r(:,1).*drdx;
    p1_x(:,2) = p1_r(:,2).*drdx;
    
    p0_rr(:,1) = 1.5*r;
    p0_rr(:,2) =-1.5*r;
    
    p1_rr(:,1) = (.75*r - .25)*len;
    p1_rr(:,2) = (.75*r + .25)*len;
    
    p0_xx(:,1) = p0_rr(:,1)*drdx^2;
    p0_xx(:,2) = p0_rr(:,2)*drdx^2;
    
    p1_xx(:,1) = p1_rr(:,1)*drdx^2;
    p1_xx(:,2) = p1_rr(:,2)*drdx^2;
    
    w_g = djac.*w;

  return
end
