%% BAROCLINIC simulates baroclinic instability.
%
%  Discussion:
%
%    This script is discussed in chapter 17 of the reference.
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

ibc=1;

M=180;
N=90;

LY=100000;
LX=3*LY;

dx=LX/(M-2);
dy=LY/(N-1);
U=1;
AH=0.05;
R=LY/4/sqrt(2);
BH=70*dx*dy;
dissrate=0.00000;
dt=min(dx,dy)/U*0.01;
optsur=(2-1*sqrt(2)*pi*sqrt(1.0/(N*N)+1.0/(M*M)));
nnn=1;
beta=0;
NSTEPS=50001;
%NSTEPS=14;
coucou=zeros(NSTEPS,8);
% For color map
val0=zeros(15,1);
vali=[0.5:0.5/14:1].';
vald=[1:-0.5/14:0.5].'
values = [0.:(1-0.)*1/31:1].';
valuesb = [1:-(1-0.)*1/31:0.].';
valuesd=ones(32,1);
valuesc=zeros(64,1);
BCPSI=zeros(4,1);
gray = [values values values];
%bluered=[[vali' valuesd' valuesb' val0']' [val0' values' valuesb' val0']' [val0' values' valuesd' vald']']
bluered=[ [val0' values' valuesd' vald']' [val0' values' valuesb' val0']' [vali' valuesd' valuesb' val0']'];


for ic=1:M
    for jc=1:N
        xx(ic,jc)=(ic-M/2)*dx;
        yy(ic,jc)=(jc-1)*dy-LY/2;
        kx=2*nnn*pi/LX;
        aaa=sqrt((-kx^2-pi^2/LY^2+1/R^2)/(kx^2+pi^2/LY^2+1/R^2));
        phi=atan(aaa);
        psi1p(ic,jc)=U*LY*0.05*sin(pi*(yy(ic,jc)+LY/2)/LY)*cos(kx*xx(ic,jc)+phi);
        psi2p(ic,jc)=U*LY*0.05*sin(pi*(yy(ic,jc)+LY/2)/LY)*cos(kx*xx(ic,jc)-phi);
    end
end

omp1=bcpert(laplacian(psi1p,dx,dy))-(psi1p-psi2p)/(2*R^2);
omp2=bcpert(laplacian(psi2p,dx,dy))+(psi1p-psi2p)/(2*R^2);

pcolor(psi1p');
colormap(bluered);
colorbar;

III1=0;
III2=0;
III3=0;
III4=0;

for jjj=2:M-1
    III1=III1+psi1p(jjj,N)-psi1p(jjj,N-1);
    III2=III2+psi1p(jjj,2)-psi1p(jjj,1);
    III3=III3+psi2p(jjj,N)-psi2p(jjj,N-1);
    III4=III4+psi2p(jjj,2)-psi2p(jjj,1);
end

BCPSI(1)=III1/(M-2)/dy;
BCPSI(2)=III2/(M-2)/dy;
BCPSI(3)=III3/(M-2)/dy;
BCPSI(4)=III4/(M-2)/dy;

for n=0:NSTEPS-1
    
    % Now add non-linear boundary condition correction
    
    NIT=max(N,M)
    rlimi=0.0000003;
    
    [psi1p,psi2p,nit,relerr]=inversepoissonbc(omp1,omp2,psi1p,psi2p,dx,dy,R,NIT,rlimi,optsur,BCPSI,ibc);
    errtime(n+1)=relerr;
    niter(n+1)=nit;
    
    om1=omp1+(beta+2*U/(2*R^2))*yy;
    om2=omp2+(beta-2*U/(2*R^2))*yy;
    psi1=psi1p-U*yy;
    psi2=psi2p+U*yy;
    
    jacob=arakawa(psi1,om1,dx,dy);
    lap=laplacian(omp1,dx,dy);
    omp1=omp1*exp(-dissrate*dt)-dt*jacob+AH*dt*lap-BH*dt*laplacian(lap,dx,dy);
    omp1=bcpertom(omp1);
    jacob=arakawa(psi2,om2,dx,dy);
    lap=laplacian(omp2,dx,dy);
    omp2=omp2*exp(-dissrate*dt)-dt*jacob+AH*dt*lap-BH*dt*laplacian(lap,dx,dy);
    omp2=bcpertom(omp2);

    if mod(n,5)==0
        
        close all;
        figure('Position',[1 1 1200 600]);
        set(gcf,'PaperPositionMode','auto');
        
        subplot(2,2,1);
        pcolor(xx',yy',real(om1)');
        caxis([-0.0004 0.0004]);
        shading('interp');
        axis equal;
        axis off;
        title 'Layer 1 PV';
        colormap(bluered);
        %colorbar('horiz')
        
        subplot(2,2,2);
        pcolor(xx',yy',real(om2)');
        caxis([-0.0004 0.0004]);
        shading('interp');
        axis equal;
        axis off;
        title 'Layer 2 PV';
        %colorbar('horiz')
        
        subplot(2,2,3);
        pcolor(xx',yy',real(psi1)');
        caxis([-U*LY U*LY]);
        shading('interp')
        [MMM IIIND]=max(psi1p);
        [MMAX JIND]=max(MMM);
        IIND=IIIND(JIND);
        [MMM IIIND2]=max(psi2p);
        [MMAX JIND2]=max(MMM);
        IIND2=IIIND2(JIND2);
        hold on;
        plot(xx(IIND,JIND),yy(IIND,JIND),'+',xx(IIND2,JIND2),yy(IIND2,JIND2),'o')
        hold off;
        axis equal;
        axis off;
        title 'Streamfunction layer 1';
        %colorbar('horiz');
        
        subplot(2,2,4);
        %pcolor(xx',yy',real(psi2)');
        pcolor(xx',yy',real((psi2-psi1)/2)');
        caxis([-U*LY U*LY]);
        shading('interp');
        axis equal;
        axis off;
        
        hold on;
        for j=1:N
            ccc(j)=0;
            xxx(j)=(j-1)*dy-LY/2;
        end
        for i=2:M-1
           for j=1:N
               ccc(j)=ccc(j)+(psi2(i,j)-psi1(i,j))/2./(M-2);
           end
        end
        plot(ccc/U/LY*LX/4,xxx);
        hold off;
        
        title 'Interface position';
        %title 'Streamfunction layer 2'
        %colorbar('horiz')
        
        if mod(n,100)==0
        %    tutut=['./bc' num2str(10000+n) '.eps']
        %    print('-dps','-r200',tutut)
            aaaa= [ './bc' num2str(10000+n) '.png'];
            print('-dpng', aaaa);
        end
        
        pause(0.01)
        
    end
    
end

dlmwrite('coucou.dat',coucou,' ');

%exit
