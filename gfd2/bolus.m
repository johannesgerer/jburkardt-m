%% BOLUS simulates an example of bolus flow.
%
%  Discussion:
%
%    This function is discussed in chapter 20 of the reference.
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
M=40;
N=40;
IM=M;
JM=N;
istep=2;
H=1000;
L=1000000;
dz=H/M;
dx=L/N;
DY=dz;
DX=dx;
kappa=1*dx;
scale=H/10*10000;

for i=1:N
    for k=1:M
        z(i,k)=-H+(k-1/2)*dz;
        x(i,k)=(i-N/2)*dx;
        rho(i,k)=10*(-z(i,k)/H)+2*exp(-x(i,k)^2*30/L^2-(z(i,k)+H/2)^2/H^2*20);
        rho(i,k)=10*(-z(i,k)/H)+1*(1+tanh(x(i,k)/L*20))*exp(-(z(i,k)+H/2)^2/H^2*10);
    end
end

[u w slope]=bolusv(rho,kappa,dx,dz);

[uc wc] = ctocenter(u,w);
%pcolor(x',z',rho')
%shading('interp')
contour(x',z',rho',[0 1 2 3 4 5 6 7 8 9 10])
hold on
hh=uvplot(u,w,x,z,scale,istep)
hold off
pause

imass=1;
isplit=2;
t=0;
DT=10000;
C=rho;
CINI=rho;
NMAX=60;
cdy(1:JM)=DY;
ldx(1:IM)=DX;

for n=1:NMAX
    
    rho=C;
    
    [u v slope]=bolusv(rho,kappa,dx,dz);
    %pcolor(x',z',rho')
    contour(x',z',rho',[0 1 2 3 4 5 6 7 8 9 10])
    %shading('interp')
    hold on
    hh=uvplot(u,v,x,z,scale,istep)
    hold off
    pause(0.01)
    
    if imass==1 
        one=ones(IM,JM);
        onep=one;
    end
    
    % Alernate directions
    % if isplit=2
    
    if isplit==2
        is=mod(n,2);
    else
        is=0;
    end
    
    %two loops over x and y only executing one of the 1D problems.
    % allows to alternate or not
    
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
    
    t=t+DT
    
    % finish time loop
end
