%% IWAVEMED ?
%
%  Discussion:
%
%    This script is discussed in chapter 13 of the reference.
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

%
%  use average profile of med sea in box (0:12)x(33,42)
%
[f, NS, z]=nsmed(0,12,33,42);  
%
% look at modes im1 to im2 (just adapt)
%
im1=1;
im2=im1+2;
%
% Stratification profile and depth of discrete point k
%
kdim=size(NS);
KM=kdim(2);
DZ=z(KM)-z(KM-1); % assuming uniform DZ
N1=sqrt(max(NS));
H=max(abs(z));

%NS(1:KM)=0.001

subplot(1,1,1)    
plot(NS,z)                      % show profile
title('profile, hit space to continue')
pause

for jm=1:100
    
    KHS=100*0.9^jm/H^2;
    % Full matrix approach, not optimal
%
%  This is the theoretical epsilon.
%
    eps=DZ^2*KHS;
%
%  Be careful about the limits..., 
%  now KM-2 is the real size of the problem, surface and bottom being eliminated
%
    for k=1:KM-2
        al(k)=eps*(NS(k+1)/f^2-1); % part of the diagnal of B
    end
%   
% Filling in of (KM-2)x(KM-2) square matrix B
% slightly changed to take into account that lambda is near 1 and lambda=1+x into equations modifies B
% then x is called lambda again
%
    for i=1:KM-2,
        for j=1:KM-2,
            B(i,j)=0;
        end
        im=max(1,i-1);       %for first line
        ip=min(KM-2,i+1);    %for last line
        B(i,im)=0;          %rubbush if i=1
        B(i,ip)=0;          %rubbish if i=KM-2
        B(i,i)=al(i);      % but corrected in both cases since then im=i or ip=i
    end
    
    % Same fo matrix C
    for i=1:KM-2,
        for j=1:KM-2,
            C(i,j)=0;
        end
        im=max(1,i-1);
        ip=min(KM-2,i+1);
        C(i,im)=-1;
        C(i,ip)=-1;
        C(i,i)=2+eps;
    end
    
    % Several ways to calcule eigenvalues
    % transformation into classic probel
	A=B*inv(C);
	[Wt,lambda]=eig(A);
	W=inv(C)*Wt;
    
    % Or use of generalized eigenvalue solver
    [Wb,lambdab]=eig(B,C,'chol');
    
    ll(jm)=max(diag(lambda)) ;
    llb(jm)=max(diag(lambdab)) ;
    ghi=(ll(jm))*f^2/KHS;
    rossby(jm)=sqrt(ghi)/f;
    kh(jm)=KHS;
    rossbye(jm)=sqrt((NS(1)-f^2)/(KHS+pi^2/H^2))/f;
    
end

plot(log10(kh),rossby/1000,'b.')
xlabel('x')
ylabel('R')


