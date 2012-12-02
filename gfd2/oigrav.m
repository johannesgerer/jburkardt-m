%% OIGRAV uses optimal interpolation for a 1D gravity wave problem.
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

M=63;

% Pseudo observation network starts in iob, ends in ioe with steps ist
iob=floor(M/2+1)-20;
ioe=iob+40;
ist=5;
nstep=100;

% Calculate indexes for pseudo-observations
iobs=0;
for i=iob:ist:ioe
    iobs=iobs+1;
    iobsindex(iobs)=i;
end
nobs=iobs;

HPHT=zeros(nobs,nobs);
PHT=zeros(M-2,nobs);
yob=zeros(1,nobs);
misfit=yob;

u=zeros(1,M);
ssh=zeros(1,M);
uf=zeros(1,M);
sshf=zeros(1,M);
ssha=zeros(1,M);

g=9.81;
DX=1000;
H=100;
t=0;
DT=2;

RL=(M-2)*DX;

for i=1:M
    x(i)=(i-1.5)*DX;
    ssh(i)=0.4*cos((i-1.5)*DX*2*3.1415/RL);
end


% Create covariance matrices with direct selection of relevant components
VAR=0.3^2;
RL=10000;
VAROBS=0.02^2;
for i=1:nobs
    for j=1:nobs
        xi=x(iobsindex(i));
        xj=x(iobsindex(j));
        HPHT(i,j)=exp(-(xi-xj)^2/RL^2)*VAR;
    end
end
for i=1:M-2
    for j=1:nobs
        xi=x(i+1);
        xj=x(iobsindex(j));
        PHT(i,j)=exp(-(xi-xj)^2/RL^2)*VAR;
    end
end
KKALM=PHT*inv(HPHT+VAROBS*diag(ones(nobs,1)));

for n=1:1000
    t=t+DT;
    for i=2:M-1
        ssh(i)=ssh(i)-H*(u(i+1)-u(i))*DT/DX;
        sshf(i)=sshf(i)-H*(uf(i+1)-uf(i))*DT/DX;

    end
    for i=3:M-1
        u(i)=u(i)-g*(ssh(i)-ssh(i-1))*DT/DX;
        uf(i)=uf(i)-g*(sshf(i)-sshf(i-1))*DT/DX;
    end
    
    if mod(n,nstep)==0
        tassimil=t;
        
        for i=1:nobs
            yob(i)=ssh(iobsindex(i))+randn(1,1)*sqrt(VAROBS);
            xob(i)=x(iobsindex(i));
        end
        for i=1:nobs
            misfit(i)=yob(i)-sshf(iobsindex(i));
        end
        corr=KKALM*misfit';
        for i=2:M-1
            ssha(i)=sshf(i)+corr(i-1);
        end
        plot(x(2:M-1),sshf(2:M-1),'r',x(2:M-1),ssh(2:M-1),'g',xob,yob,'bo',x(2:M-1),ssha(2:M-1),'y');
        tt=[ 'time '  num2str(t) ' sec'];
        axis( [x(2) x(M-1) -1 1]);
        title(tt);
        legend('Forecast' ,'True field' ,'Observations', 'Analysis');
        pause(2);
        sshf=ssha;
    end

    plot(x(2:M-1),sshf(2:M-1),'r',x(2:M-1),ssh(2:M-1),'g')
    tt=[ 'time '  num2str(t) ' sec']
    axis( [x(2) x(M-1) -1 1])
    title(tt)
    legend('Forecast','True field')
    pause(0.01)
    
end
