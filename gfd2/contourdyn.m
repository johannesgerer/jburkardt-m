%% CONTOURDYN ?
%
%  Discussion:
%
%    This script is discussed in chapter 10 of the reference.
%
%  Modified:
%
%    01 December 2009
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

  nfreq=5;
  t=0;
  itest=4;

% 0 user defined
% 1 one elliptical eddy of axes ration rat=b/a
% 2 three concentric elliptical eddies  of axes ratio rat=b/a
% 3 thin layer
% 4 two circular eddies of radius 0.4 at distance dist

  if itest==0
    % user defined
    
  elseif itest==1
    % one elliptical eddy of axes ration rat=b/a
    
    ip=200;
    ntot=600;
    dt=0.05;
    KM=1;
    rat=4;
    for k=1:KM
        for i=1:ip+1
            th=i/ip*2*pi;
            nlobes=4;
            r=1+0.00*cos(th*nlobes);
            x(i,k)=1*r*cos(i/ip*2*pi)+0.01*sin(i/ip*3*pi);
            y(i,k)=1/rat*r*sin(i/ip*2*pi)+0.01*cos(i/ip*3*pi);
        end
        omofp(k)=1/(4*pi);
        mycol(k)='r';
    end
    
  elseif itest==2
    % three concentric elliptical eddies of axes ratio rat=b/a
    
    nfreq=1;
    ip=200;
    ntot=100;
    dt=0.07;
    KM=3;
    rat=3.5;
    rat=2.5;
    nlobes=2;
    for k=1:KM
        for i=1:ip+1
            th=i/ip*2*pi;
            r=1+0.00*cos(th*nlobes)-(k-1)/KM;
            x(i,k)=1*r*cos(i/ip*2*pi);
            y(i,k)=1/rat*r*sin(i/ip*2*pi);
        end
        omofp(k)=1/(4*pi);
        mycol(k)='b';
    end
    mycol(1)='g';
    mycol(2)='y';
    
  elseif itest==3
    % thin layer
    
    nfreq=1;
    ip=75;
    ntot=220*3;
    dt=0.05;
    KM=2;
    rat=1;
    nlobes=10;
    for k=1:KM
        for i=1:ip+1
            th=i/ip*2*pi;
            r=1+0.003*cos(th*nlobes+(k-1)*pi/2)-0.05*(k-1);
            x(i,k)=1*r*cos(i/ip*2*pi);
            y(i,k)=1/rat*r*sin(i/ip*2*pi);
        end
        omofp(k)=-1/(4*pi);
    end
    mycol(1)='b';
    mycol(2)='w';
    omofp(2)=-omofp(1);
    
  elseif itest==4
    % two circular eddies of radius 0.4 at distance dist
    
    dist=1.4;
    nfreq=1;
    ip=100;
    ntot=400;
    dt=0.1;
    KM=2;
    rat=1;
    for k=1:KM
        for i=1:ip+1
            th=i/ip*2*pi;
            r=0.4;
            x(i,k)=1*r*cos(i/ip*2*pi)+dist*(k-1.5);
            y(i,k)=1/rat*r*sin(i/ip*2*pi);
        end
        omofp(k)=1/(4*pi);
    end
    mycol(1)='r';
    mycol(2)='r';
    
  else
    
    dist=.8;
    nfreq=1;
    ip=75;
    ntot=180;
    dt=0.15;
    ip=300;
    ntot=400;
    ntot=550;
    dt=0.05;
    KM=3;
    rat=1;
    for k=1:KM
        for i=1:ip+1
            th=i/ip*2*pi;
            r=0.3;
            if k==2
                r=0.3*sqrt(2);
            end
            x(i,k)=1*r*cos(i/ip*2*pi)+dist*(k-2);
            y(i,k)=1/rat*r*sin(i/ip*2*pi);
        end
        omofp(k)=1/(4*pi);
    end
    mycol(1)='r';
    mycol(2)='b';
    omofp(2)=-omofp(2);
    mycol(3)='r';
    
  end


%Close contour with reduntant point, also usefull for integration

  for k=1:KM
    x(ip+1,k)=x(1,k);
    y(ip+1,k)=y(1,k);
  end

%allocate tables

  for k=1:KM
    for i=1:ip
        u(i,k)=0;
        v(i,k)=0;
    end
  end

% Initialize old values

  xo=x;
  yo=y;
  xn=x;
  yn=y;

% ntot time step

  for n=1:ntot
    
    %Predictor    
    [u,v]=vorttovel(ip,KM,x,y,omofp);
    [xn,yn]=updatex(ip,KM,x,y,u,v,dt);
    un=u;
    vn=v;
    
    %Corrector
    [u,v]=vorttovel(ip,KM,xn,yn,omofp);
    u=(u+un)/2;
    v=(v+vn)/2;
    [x,y]=updatex(ip,KM,xo,yo,u,v,dt);
    xo=x;
    yo=y;
    
    t=t+dt;
    if mod(n,nfreq)==0
        for k=1:KM
            fill(x(:,k),y(:,k),mycol(k))
            hold on;
        end
        hold off;
        axis([-1.5 1.5 -1.5 1.5]);
        %axis([-2 2 -2 2]);
        axis equal;
        axis off;
        pause(0.01);
    end

  end
