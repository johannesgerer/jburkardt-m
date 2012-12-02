%% KEPSMODEL implements a K-Epsilon closure model.
%
%  Discussion:
%
%    This script is discussed in chapter 14 of the reference.
%
%  Modified:
%
%    30 November 2009
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

M=102;
H=100;
dt=200;
dz=H/(M-2);
nsteps=3000;
fcorio=1*10^(-4);
c1=1.44;
c2=1.92;
c3=-0.2;
z0surf=0.1;
z0bot=0.1;
kkarm=0.4;
CDRAG=kkarm^2/(log(dz/(2*z0bot)))^2;
U10=15;
heatflux=00;
ustarwind=sqrt(10^(-3)*(1+U10*U10)/1028);
% If given by xxx N/m^2:
xxx=0.15;
ustarwind=sqrt(xxx/1028);
NBV=0.015;
alpha=1;

tkemin=10^(-10);
epsmin=10^(-15);

for k=1:M
    rho(k)=-2*tanh((k-M/2)/M*8.14);
    z(k)=-H+(k-1.5)*dz;
    rho(k)=-1-NBV^2/9.81*1028*z(k);
    u(k)=0;
    v(k)=0;
    tke(k)=tkemin;
    eps(k)=epsmin;
end

MS=zeros(1,M);
ntmh=MS;
NS=MS;
source=MS;
sink=MS;

% RESOLUTION

for n=1:nsteps
    t=n*dt;
    [NS,MS]=NSMS(rho,u,v,z);
    ustarbot=sqrt(CDRAG)*sqrt(u(2)^2+v(2)^2);
    MS(2)=ustarbot^2/z0bot^2;
    MS(M)=ustarwind^2/z0surf^2;
    
    [nu,kappa]=nukappa(tke,eps,NS,MS);
    
    usurf(n)=u(M-1);
    vsurf(n)=v(M-1);
    % density equation    
    source=zeros(1,M);
    sink=source;
    BCB=0;
    BCS=-(heatflux/(1024*4160))*1.7*10^(-4)*1024;
    % flux
    iflag=1;
    SN=diffusionstep(rho,kappa,dt,dz,alpha,source,sink,BCB,BCS,iflag);  
    % put reasonable values (in principle, you should use flux values)
    SN(1)=SN(2);
    SN(M)=SN(M-1);
    rho=SN;
    
    % alternate splitting
    for sw=1:2
        if mod(sw+n,2)==0
            % u velocity
            source=fcorio*v;
            sink=zeros(1,M);
            BCS=-ustarwind^2;
            BCB=0;
            % flux
            iflag=1;
            SN=diffusionstep(u,nu,dt,dz,alpha,source,sink,BCB,BCS,iflag)     ;  
            % put reasonable values (in principle, you should use flux values)
            SN(1)=SN(2);
            SN(M)=SN(M-1);
            u=SN;
        else
            % v velocity
            source=-fcorio*u;
            sink=zeros(1,M);
            BCB=0.;
            BCS=0;
            % flux
            iflag=1;
            SN=diffusionstep(v,nu,dt,dz,alpha,source,sink,BCB,BCS,iflag)     ;  
            % put reasonable values (in principle, you should use flux values)
            SN(1)=SN(2);
            SN(M)=SN(M-1);
            v=SN;
        end
    end
    
    % update parameters
    [NS , MS]=NSMS(rho,u,v,z);
    ustarbot=sqrt(CDRAG)*sqrt(u(2)^2+v(2)^2);
    MS(2)=ustarbot^2/z0bot^2;
    MS(M)=ustarwind^2/z0surf^2;
    [nu , kappa]=nukappa(tke,eps,NS,MS);
    
    % take equation
    for k=1:M
        if NS(k) < 0
            source(k)=nu(k)*MS(k)-kappa(k)*NS(k);
            sink(k)=eps(k);
        else
            source(k)=nu(k)*MS(k);
            sink(k)=kappa(k)*NS(k)+eps(k);
        end
    end
    
    % take care of staggering
    for k=2:M
        nutke(k)=(nu(k)+nu(k-1))/2;
    end
    nutke(1)=nutke(2);
    
    BCB=ustarbot^2;
    BCS=ustarwind^2;
    iflag=0;
    SNB=diffusionstep(tke(2:M),nutke(2:M),dt,dz,alpha,source(2:M),sink(2:M),BCB,BCS,iflag)     ;  
    for k=2:M
        tke(k)=SNB(k-1);
        if tke(k)<tkemin
            tke(k)=tkemin;
        end
    end
    
    for k=1:M
        val=eps(k)/tke(k);
        if c3*NS(k)< 0
            source(k)=val*c1*nu(k)*MS(k)-val*(c3*kappa(k)*NS(k));
            sink(k)=val*(c2*eps(k));
        else
            source(k)=val*c1*nu(k)*MS(k);
            sink(k)=val*(c2*eps(k))+val*(c3*kappa(k)*NS(k));
        end
    end
    
    BCB=ustarbot^3/z0bot/kkarm;
    BCS=ustarwind^3/z0surf/kkarm;
    iflag=0;
    SNB=diffusionstep(eps(2:M),nutke(2:M),dt,dz,alpha,source(2:M),sink(2:M),BCB,BCS,iflag);  
    
    for k=2:M
        eps(k)=SNB(k-1);
        % mixing length??
        % eps(k)=tke(k)^(3/2)/10;
        if eps(k)<epsmin
            eps(k)=epsmin;
        end
    end
    for k=2:M
        % check, need for constants
        ll(k)=tke(k)^(3/2)/eps(k);
    end
    
    [aa,ii]=max(NS);
    hh(n)=z(ii);
    time(n)=t;
    
    if mod(n-1,10)==0
        plot(rho,z,'-.')
        %hold on
        aaaa = [ 'Turbulence model, time ' num2str(t/24/3600,'%4.2f') ' d'];
        disp([aaaa]);
        title(aaaa)
        xlabel('Density anomaly')
        ylabel('z')
        axis([-1 1.4 -100 0])
        pause(0.001)
    end
    
end
