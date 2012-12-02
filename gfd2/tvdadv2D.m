%% TVDADV2D has many approaches for solving the advection equation in 2D.
%
%  Discussion:
%
%    This script solves the 2D advection equation,
%    allowing the user to experiment with various strategies, by turning
%    pseudo-compressibility on or off, enabling and disabling time splitting,
%    and using different limiters in sheared and unsheared flow fields.
%
%    This script is discussed in chapter 6 of the reference.
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

% Grid points
% 2D advection with splitting approach and pseudo compressibibility for each fractional step
% the limiter functions can be adapted in tvdlim.m (simply uncomment the limiter you want)


% PARAMETERS

% Need to check IM different from JM....
IM=50;
JM=30;

% Domain scaled to [0,1]x[0,1] 
DX=1/(IM-2);
DY=1/(JM-2);

% Velocities are scaled to be at maximum 1
% so that you can chose the timestep dividing  scaled time by a 
% number of time steps to reach time =1
DT=1/(4*max(IM,JM));

% Final time for integration
TF=1.;

% Frequency of image (every nfre time-steps)
nfre=20;

% initial time
t=0;

% type of initial profile centered in XC,YC total width 2 W
% 0: user defined (use values between 1 and 2)
% 1: square
% 2: cone
% 3: Gaussian
iprof=1;
XC=0.25;
YC=0.25;
W=0.1;

% pseudo compressibility mass conservation if imass=1. Only relevant with splitting
% if u=u(y) and v=v(x), should have no effect
imass=0;

% splitting 
% isplit=0: no splitting= 2 x 1D
% isplit=1: always first x than y direction
% isplit=2: alternating x and y direction first
isplit=2;

% Velocity profile given by streamfunction (positive as high pressure in northern hemisphere
% velprof=0: user defined (scale such that velocities are maximum 1)
% velprof=1: solid rotation
% velprof=2: uniform advection with U and V velocity
% velprof=3: Sverdrup gyre with relative boundary layer width del
% velprof=4: jet like
velprof=3;

U=0.5;
V=0.5;
del=0.1;

% Time varying amplitude: amplivar
% amplivar=0: user defined (between -1 and 1)
% amplivar=1: 1 constant
% amplivar=2: cos(pi t) (forth and back over time unit)
% amplivar=3: cos(pi t/2) (forth and back over 2 time units)
% amplivar=4: cos(pi t/4) (forth and back over 4 time units)
amplivar=1;

%want to calculate cfl maximum values? use lookcfl=1
lookcfl=1;

% From here mostly self contained
% EXCEPT If you want to adapt graphics or add profiles

% Grid steps could be made non-uniform (DX(i), DY(j)) by
% filling in the following differently. Not tested
cdy(1:JM)=DY;
ldx(1:IM)=DX;

% Number of time step needed to reach
NMAX=(TF-t)/DT;

% Initialisations with background value 1.001 (zero is not a good choice for mass conservation test)
for i=1:IM
    for j=1:JM
        C(i,j)=1.001;
        CN(i,j)=0;
        x(i,j)=(i-1)/(IM-1);
        y(i,j)=(j-1)/(JM-1);
    end
end
if iprof==0
    % user defined
    for i=1:IM
        for j=1:JM
            C(i,j)=1+0.5*sin(x(i,j))*cos(y(i,j));
        end
    end
elseif iprof==1
    for i=1:IM
        for j=1:JM
         rx=x(i,j)-XC;
         ry=y(i,j)-YC;
         if (abs(rx) < W) && (abs(ry) < W)
         C(i,j)=2;    
         end
        end
    end
elseif iprof==2
    for i=1:IM
        for j=1:JM
         rx=x(i,j)-XC;
         ry=y(i,j)-YC;
         rd=sqrt(rx*rx+ry*ry);
         if abs(rd) < W
         C(i,j)=C(i,j)+(W-rd)/W;    
         end
        end
    end
else
    for i=1:IM
        for j=1:JM
         rx=x(i,j)-XC;
         ry=y(i,j)-YC;
         rd=sqrt(rx*rx+ry*ry);
         C(i,j)=C(i,j)+exp(-(rd*rd/W/W));    
        end
    end
end


% RESOLUTION and PLOT

% Save initial field for possible tests in back-forth exercise
CINI=C;

for i=1:IM
    for j=1:JM
        if velprof==0
            % user defined
        elseif velprof==1
            % solid rotation
               psamplivar(i,j)=((x(i,j)-0.5)^2+(y(i,j)-.5)^2);
        elseif velprof==2
            % uniform flow
               psamplivar(i,j)=-y(i,j)*U+x(i,j)*V;
        elseif velprof==3
            % sverdrup folow
               psamplivar(i,j)=5*del*cos((y(i,j)-0.5)*pi)*(1-x(i,j)-exp(-x(i,j)/del));
        elseif velprof==4
            % jet like
               th=atan2(y(i,j)-0.5,x(i,j)-0.5);
               rc=0.2+0.2*(abs(cos(th)));
               r=sqrt((x(i,j)-0.5)^2+(y(i,j)-0.5)^2);
               psamplivar(i,j)=1 - 0.1*tanh((r-rc)/0.1);
        else
            % for other uses
        end
        u(i,j)=0;
        v(i,j)=0;
    end
end

fig=figure;

contour(psamplivar')
hold on
contour(C')
axis equal
axis([0 IM 0 JM])
title('Stream function and initial condition used, press any key to start')
hold off
pause

contour(C',[0.9 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2. 2.1 2.2])
hold on
contour(C',[0.99 0.99],'k--')
%set(h(1),'LineWidth',2)
hold on
contour(C',[2.01 2.01],'k--')
%set(h(1),'LineWidth',2)
hold off
CAXIS([0.5 2.5])
axis equal
axis([0 IM 0 JM])

M(1) = getframe;

for n=1:NMAX
    
    if amplivar==0
        ampli=0.5;
    elseif amplivar==1
        ampli=1;
    elseif amplivar==2
        ampli=cos(pi*t);
    elseif amplivar==3
        ampli=cos(pi*t/2);
    elseif amplivar==4
        ampli=cos(pi*t/4);
    else
        ampli=sin(2*pi*t);
    end

    if imass==1
        one=ones(IM,JM);
        onep=one;
    end

    psi=psamplivar*ampli;
    
    for i=1:IM
        for j=1:JM-1
            u(i,j)=-(psi(i,j+1)-psi(i,j))/DY;
        end
    end
    for i=1:IM-1
        for j=1:JM
            v(i,j)=(psi(i+1,j)-psi(i,j))/DX;
        end
    end
    
    if lookcfl==1
        clfx=max(max(abs(u*DT/DX)));
        clfy=max(max(abs(u*DT/DY)));
    end
    
    % Alernate directions
    % if isplit=2
    
    if isplit==2
        is=mod(n,2);
    else
        is=0;
    end
    
    %two loops over x and y only executing one of the 1D problems.
    % alows to alternate or not
    
    for jj=0:1
    
        if jj==is
            
            for j=2:JM-1
                %lp=zeros(IM);
                for i=1:IM
                    lu(i)=u(i,j);
                    lc(i)=C(i,j);
                end
                lp=adv1D(lu,lc,DT,ldx,IM);
                for i=1:IM
                    CN(i,j)=lp(i);
                end
            end

            if imass==1
                for i=2:IM-1
                    for j=2:JM-1
                        onep(i,j)=one(i,j)-DT/ldx(i)*(u(i+1,j)-u(i,j));
                        CN(i,j)=(CN(i,j)+(one(i,j)-1)*C(i,j))/(onep(i,j));
                    end
                end
            end
            
            % zero gradients
            CN(:,1)=CN(:,2);
            CN(:,JM)=CN(:,JM-1);
            
            % or initial condition
            CN(:,1)=CINI(:,1);
            CN(:,JM)=CINI(:,JM);
            
            if isplit==0
             % store increment to add and do not update C so old values are used for y direction
                CADD=CN-C;
            else
                C=CN;
            end

            if imass==1
                one=onep;
            end
        
        else

            for i=2:IM-1
                cv=v(i,:);
                cc=C(i,:);
                cp=adv1D(cv,cc,DT,cdy,JM);
                CN(i,1:JM)=cp(1:JM);
            end

            if imass==1
                for i=2:IM-1
                    for j=2:JM-1
                        onep(i,j)=one(i,j)-DT/cdy(j)*(v(i,j+1)-v(i,j));
                        CN(i,j)=(CN(i,j)+(one(i,j)-1)*C(i,j))/(onep(i,j));
                    end
                end
            end
            
            % zero gradient
            CN(1,:)=CN(2,:);
            CN(IM,:)=CN(IM-1,:);
            
            %or initial condition
            CN(1,:)=CINI(1,:);
            CN(IM,:)=CINI(IM,:);
            
            if isplit==0
                C=CN+CADD;
            else
                C=CN;
            end

            if imass==1
                one=onep;
            end

            %pcolor(C')
        
        end

        % finish loop for jj
    
    end
    
    t=t+DT;
    if mod(n,nfre) == 0
        contour(C',[0.9 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2. 2.1 2.2])
        hold on
        contour(C',[0.99 0.99],'k--')
        %set(h(1),'LineWidth',2)
        hold on
        contour(C',[2.01 2.01],'k--')
        %set(h(1),'LineWidth',2)
        hold off
        axis equal
        axis([0 IM 0 JM])
        %axis equal
        CAXIS([0.5 2.5])
        M((n)/nfre+1) = getframe;
        if n==400
            pause
        end
        if n==200
            pause
        end
    end

% finish time loop
end

movie(M)
movie(M)
ERR=norm(CINI-C);
