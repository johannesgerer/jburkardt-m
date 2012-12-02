%% KALMANUPWADV ?
%
%  Discussion:
%
%    This script is discussed in chapter 22 of the reference.
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


% PARAMETERS

M=100;
cfl=0.5;
MF=50;
i1=10;
i2=30;
kloc=40;
NITER=MF/cfl;


% INITIALIZATION

for i=1:M
    c(i)=0;
    x(i)=i;
    ce(i)=0;
end
for i=i1:i2
    c(i)=1;
    ce(i+MF)=1;
end
ci=c;
cp=c;
cu=c;

for i=1:M
    for j=1:M
        MM(i,j)=0;
    end
end
MM(1,1)=1;
cflerr=cfl*0.9;
for i=2:M
    MM(i,i)=1-cflerr;
    MM(i,i-1)=cflerr;
end
PERR=zeros(M,M);
%PERR(10,10)=0.1;


% RESOLUTION

for n=1:NITER
    
    cu=(MM*cu')';
    cp=(MM*c')';
    c=cp;     
    PERR=MM*PERR*MM';
    PERR(1,1)=0;
    for i=2:M
        PERR(i,i)=PERR(i,i)+0.01;
    end
    KAL=PERR(:,kloc)/(PERR(kloc,kloc)+0.0001);

    for i=1:M
        di=round(cfl*n);
        cex(i)=ci(max(i-di,1));
    end
    obs=cex(kloc);
    myerr=(obs-c(kloc))*KAL';
    pcolor(PERR');
    pause(0.1)
    c=c+myerr;
    for i=1:M
        for j=1:M
            PERRA(i,j)=PERR(i,j)- KAL(i)*PERR(kloc,j);
        end
    end
    PERR=PERRA;

end

figure;
plot(x,c,'-',x,ce,'-.',x,ci,'--',x,cu,'+')
axis([0 100 -0.4 1.4])
