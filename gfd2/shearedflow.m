%% SHEAREDFLOW ?
%
%  Discussion:
%
%    This script is discussed in chapter 16 of the reference.
%
%  Modified:
%
%    02 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
  clear all;
  close all;


% PARAMETERS

% M points in along channel direction. Two of them are for periodic conditions
% N points across channel, take an odd number of points (psi on center)

  dx=5000;
  dy=dx;
%
% width of channel is WW  times the width of shear layer
%
  WW=20;
  WW=8;
%
% number of points across half shear layer
%
  NP=8;
  NP=6;
  N=(NP*2)*WW+1;
  L=(N-1)*dy/(2*WW);
  U=1;
  LX=2*7.89*2*L;
%
% For Bickley jet try LX=2*6*L;
%
  M=LX/dx+2;
  M=floor(M);
  AH=0.5;
  BH=100*dx*dy;
  BH=BH*10;
  AH=60;
  dissrate=0.00000;
  dt=250;
  optsur=2*(1-pi/M);
  brcol=bluered(64);


% INITIALIZATION

  for ic=1:M
    for jc=1:N
        omphys(ic,jc)=0;
        xx(ic,jc)=(ic-M/2)*dx;
        yy(ic,jc)=(jc-N/2)*dy;
        if yy(ic,jc) > L*1.001
            psiphys(ic,jc)= U*(-yy(ic,jc)+WW*L);
        elseif yy(ic,jc) < -L*1.001
            psiphys(ic,jc)= U*(yy(ic,jc)+WW*L);
        else
            psiphys(ic,jc)= (-U/L*(yy(ic,jc)^2/2)+(WW-1/2)*U*L);
        end
        % Bicley jet
        %psiphys(ic,jc)=-U*L*tanh(yy(ic,jc)/L);
        % for assymetric jets
        psiphys(ic,jc)=psiphys(ic,jc)*(1+0.001*sin(4*pi*xx(ic,jc)/LX));
        % For symmetric jets
        %psiphys(ic,jc)=psiphys(ic,jc)*(1+0.005*sign(yy(ic,jc))*sin(4*pi*xx(ic,jc)/LX));
    end
  end

  uvel=psiphys;
  vvel=psiphys;
  omphys=periodic(laplacian(psiphys,dx,dy));

  pcolor(psiphys');
  colormap(brcol);
  colorbar;

  pause;


% RESOLUTION & PLOT

  for n=0:24000
    
    [psiphys,nit,relerr,residual] = inversepoisson(omphys,psiphys,dx,dy,100,0.0000005,optsur);
    errtime(n+1) = relerr;
    niter(n+1) = nit;
    
    jacobphys = arakawa(psiphys,omphys,dx,dy);
    
    lap = laplacian(omphys,dx,dy);
    lap = periodic(lap);
    
    omphys=omphys*exp(-dissrate*dt)-dt*jacobphys+AH*dt*laplacian(omphys,dx,dy)-BH*dt*laplacian(lap,dx,dy);
    omphys=periodic(omphys);
    
    if mod(n,100)==0
        
        uvel = arakawa(psiphys,xx,dx,dy);
        vvel = arakawa(psiphys,yy,dx,dy);
        
        subplot(1,2,1);
        pcolor(real(omphys)');
        caxis([-0.00001 0.00001]);
        shading('interp');
        axis equal;
        axis off;
        title 'Vorticity';
        colormap(brcol);
        % colorbar('horiz')
        
        subplot(1,2,2);
        pcolor(real(psiphys)');
        % caxis([-0.002 0.002]);
        shading('interp');
        axis equal;
        axis off;
        title 'Streamfunction';
        % if mod(n,30)==0
        %     tutut=['shearedflow' num2str(10000+n) '.png'];
        %     print('-dpng',tutut);
        % end
        
        pause(0.001)
        
    end
    
    n
    
  end
