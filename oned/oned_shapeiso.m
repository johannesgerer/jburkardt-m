function [x_g,w_g,phi,p_x,p_xx] = oned_shapeiso(x_local,r,w)

%*****************************************************************************80
%
%  oned_shapeiso.m - computes test functions and derivatives for a
%                    isoparametric Lagrange C0 element given element 
%                    coordinates and Gauss points.
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0a
%
%  Usage:    [x_g,w_g,phi,p_x,p_xx] = oned_shapeiso(x_local,r,w)
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
%                 phi
%                        Value of element shape functions at x_g
%                 p_x
%                        First spatial derivatives of phi
%                 p_xx
%                        Second spatial derivatives of phi
%                        (only applicable with 2nd order or higher)
%                        (currently not used)
%-----------------------------------------------------------------------
  x      = x_local;
  [n,t1] = size(x);  % t1 had better be 1
  rule   = length(r);

  if (n==2)
    % Transform coordinates for linear elements

    % defined backwards to help Matlab create the proper sized array
    phi(:,2) = ( 1+r )/2;
    phi(:,1) = ( 1-r )/2;

    x_g = phi*x(:,1);

    p_r(:,2) = .5*ones(size(r));
    p_r(:,1) =-p_r(:,2);

    dxdr = p_r*x(:,1);
    djac = dxdr;
    drdx = 1./djac;

    p_x(:,2) = p_r(:,2).*drdx;
    p_x(:,1) = p_r(:,1).*drdx;
    w_g = djac.*w;

  elseif (n==3)
    % Transform coordinates for quadratic elements

    % defined backwards to help Matlab create the proper sized array
    phi(:,3) = .5*r.*( r+1 );
    phi(:,2) =-( r+1 ).*( r-1 );
    phi(:,1) = .5*r.*( r-1 );

    x_g = phi*x(:,1);

    p_r(:,3) = ( r+.5 );
    p_r(:,2) =-2*r;
    p_r(:,1) = ( r-.5 );

    dxdr = p_r*x(:,1);
    djac = dxdr;
    drdx = 1./djac;

    p_x(:,3) = p_r(:,3).*drdx;
    p_x(:,2) = p_r(:,2).*drdx;
    p_x(:,1) = p_r(:,1).*drdx;
    w_g = djac.*w;

  elseif (n==4)
    % Transform coordinates for (nonconforming) cubic elements
    
    r2  = r.*r;
    r3  = r.*r2;

    phi(:,4) =  9*( r3+r2-r/9-1/9 )/16;
    phi(:,3) =-27*( r3+r2/3-r-1/3 )/16;
    phi(:,2) = 27*( r3-r2/3-r+1/3 )/16;
    phi(:,1) =- 9*( r3-r2-r/9+1/9 )/16;

    x_g = phi*x(:,1):

    p_r(:,4) =  9*( 3*r2+2*r-1/9 )/16;
    p_r(:,3) =-27*( 3*r2+2*r/3-1 )/16;
    p_r(:,2) = 27*( 3*r2-2*r/3-1 )/16;
    p_r(:,1) =- 9*( 3*r2-2*r-1/9 )/16;

    dxdr = p_r*x(:,1);
    djac = dxdr;
    drdx = 1./djac;

    p_x(:,4) = p_r(:,4).*drdx;
    p_x(:,2) = p_r(:,2).*drdx;
    p_x(:,3) = p_r(:,3).*drdx;
    p_x(:,1) = p_r(:,1).*drdx;
    w_g = djac.*w;

    p_rr(:,4) =  9*( 6*r+2   )/16;
    p_rr(:,2) = 27*( 6*r-2/3 )/16;
    p_rr(:,3) =-27*( 6*r+2/3 )/16;
    p_rr(:,1) =- 9*( 6*r-2   )/16;

%   dxdrr = p_rr*x(:,1);
%   drdxx = 1./dxdrr;
%   p_xx  = p_rr.*(drdx).^2 + p_r.*drdxx;

  else
    error('Elements higher than cubic not supported')
    keyboard
  end

  return
end

