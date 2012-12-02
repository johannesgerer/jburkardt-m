%% QGMODEL ?
%
%  Discussion:
%
%    This script is discussed in chapter 1 of the reference.
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


% M points in along channel direction. Two of them are for periodic conditions
% N points across channel, take an odd number of points (psi on center)

M=124;
N=124;
L=25000;
dx=L/5;
dy=dx;

AH=0.5;
AH=60;
BH=100*dx*dy;
BH=BH*10;
dissrate=0.00000;
dt=250;
optsur=2*(1-pi/M);
brcol=bluered(64);
omegascale=0.00001;
bcflag=2;
% bcfalg=1: perdiodic along x
% bcflag=2: dirichlet with zero value everywhere

imode=2;

for ic=1:M
    for jc=1:N
        omphys(ic,jc)=0;
        xx(ic,jc)=(ic-M/2)*dx;
        yy(ic,jc)=(jc-N/2)*dy;
        rr=sqrt(xx(ic,jc)^2+yy(ic,jc)^2)/L;
        th=atan2(yy(ic,jc),xx(ic,jc));
        r=rr*(1+0.03*cos(imode*th));

        psiphys(ic,jc)=-(r+1)*exp(-r)*L^2*omegascale;
    % Gaussian eddy
        psiphys(ic,jc)=exp(-r*r)*L^2*omegascale;
    % Gaussian jet
        psiphys(ic,jc)=exp(-(yy(ic,jc)+dx*sin(ic/(M-2)*2*pi))^2/L^2)*L^2*omegascale;
        bcflag=1;
    end
end

uvel=psiphys;
vvel=psiphys;

if bcflag==1
    psiphys=periodic(psiphys);
    omphys=periodic(laplacian(psiphys,dx,dy));
else
    psiphys=dirichletbc(psiphys,0);
    omphys=dirichletbc(laplacian(psiphys,dx,dy),0);
end

pcolor(psiphys')
colormap(brcol)
colorbar
pause

for n=0:24000
    
    [psiphys,nit,relerr,residual]=inversepoisson(omphys,psiphys,dx,dy,100,0.0000005,optsur);
    errtime(n+1)=relerr;
    niter(n+1)=nit;
    
    jacobphys=arakawa(psiphys,omphys,dx,dy);

    lap=laplacian(omphys,dx,dy);
    if bcflag==1
        lap=periodic(lap);
    end
    
    omphys=omphys*exp(-dissrate*dt)-dt*jacobphys+AH*dt*laplacian(omphys,dx,dy)-BH*dt*laplacian(lap,dx,dy);
    
    if bcflag==1
        omphys=periodic(omphys);
    else
        omphys=dirichletbc(laplacian(psiphys,dx,dy),0);
    end

    if mod(n,5)==0;
        uvel=arakawa(psiphys,xx,dx,dy);
        vvel=arakawa(psiphys,yy,dx,dy);
        subplot(1,2,1)
        pcolor(real(omphys)');
        caxis([-omegascale omegascale])
        shading('interp')
        axis equal
        axis off
        title 'Vorticity'
        colormap(brcol)
        %colorbar('horiz')
        subplot(1,2,2)
        pcolor(real(psiphys)');
        caxis([-L^2*omegascale L^2*omegascale])
        shading('interp')
        axis equal
        axis off
        title 'Streamfunction'
        if mod(n,30)==0
            tutut=['shieldededdynew' num2str(10000+n) '.png']
            print('-dpng',tutut)
        end
        pause(0.01)
    end

end
