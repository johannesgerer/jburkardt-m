function fd2d_predator_prey ( )

%*****************************************************************************80
%
%% FD2D_PREDATOR_PREY uses finite differences on a 2D predator prey system.
%
%  Discussion:
%
%    This function applies a two-dimensional finite-difference method for 
%    Scheme 2 to the predator-prey system with Kinetics 1.  
%
%  Author: 
%
%    Marcus Garvie
%

%
% User inputs of parameters
alpha = input('Enter parameter alpha   ');
beta = input('Enter parameter beta   ');
gamma = input('Enter parameter gamma   ');
delta = input('Enter parameter delta   ');
a = input('Enter a in [a,b]^2   ');
b = input('Enter b in  [a,b]^2  ');
h = input('Enter space-step h   ');
T = input('Enter maximum time T   ');
delt = input('Enter time-step Delta t   ');
% User inputs of initial data
U0 = input('Enter initial data function U0(X,Y)   ','s'); % see notes
V0 = input('Enter initial data function V0(X,Y)   ','s'); %   in text
% Calculate and assign some constants
mu=delt/(h^2); 
J=round((b-a)/h);
dimJ=J+1;
n = (dimJ)^2;   % no. of nodes (d.f.) for each dependent variable                        
N=round(T/delt);
% Initialization
u=zeros(n,1); v=zeros(n,1); F=zeros(n,1); G=zeros(n,1);
y1=zeros(n,1); y2=zeros(n,1); U_grid=zeros(dimJ,dimJ);
V_grid=zeros(dimJ,dimJ); B=sparse(n,n); L=sparse(n,n); 
% Assign initial data
indexI=1:dimJ;
x=(indexI-1)*h+a;
[X,Y]=meshgrid(x,x);
U0 = eval(U0).*ones(dimJ,dimJ); V0 = eval(V0).*ones(dimJ,dimJ);
% Change orientation of initial data & convert to 1-D vector
U0=U0'; V0=V0'; u=U0(:); v=V0(:);
% Construct matrix L (without 1/h^2 factor)
L(1,1)=3; L(1,2)=-3/2; L(J+1,J+1)=6; L(J+1,J)=-3;
L=L+sparse(2:J,3:J+1,-1,n,n);
L=L+sparse(2:J,2:J,4,n,n);
L=L+sparse(2:J,1:J-1,-1,n,n);
L(1,J+2)=-3/2; L(J+1,2*J+2)=-3;
L=L+sparse(2:J,J+3:2*J+1,-2,n,n);
L(n-J,n-J)=6; L(n-J,n-J+1)=-3; 
L(n,n)=3; L(n,n-1)=-3/2;
L=L+sparse(n-J+1:n-1,n-J+2:n,-1,n,n);
L=L+sparse(n-J+1:n-1,n-J+1:n-1,4,n,n);
L=L+sparse(n-J+1:n-1,n-J:n-2,-1,n,n);
L(n-J,n-(2*J+1))=-3; L(n,n-dimJ)=-3/2;
L=L+sparse(n-J+1:n-1,n-2*J:n-(J+2),-2,n,n);
L=L+sparse(J+2:n-dimJ,2*J+3:n,-1,n,n);
L=L+sparse(J+2:n-dimJ,1:n-2*dimJ,-1,n,n);
L=L+sparse(J+2:n-dimJ,J+2:n-dimJ,4,n,n);
L=L+sparse(J+2:n-(J+2),J+3:n-dimJ,-1,n,n);
L=L+sparse(J+2:dimJ:n-(2*J+1),J+3:dimJ:n-2*J,-1,n,n); 
L=L+sparse(2*J+2:dimJ:n-2*dimJ,2*J+3:dimJ:n-(2*J+1),1,n,n);
L=L+sparse(J+3:n-dimJ,J+2:n-(J+2),-1,n,n);
L=L+sparse(2*J+2:dimJ:n-dimJ,2*J+1:dimJ:n-(J+2),-1,n,n);
L=L+sparse(2*J+3:dimJ:n-(2*J+1),2*J+2:dimJ:n-2*dimJ,1,n,n);
% Construct matrices B1 & B2
B1=sparse(1:n,1:n,1,n,n)+mu*L;
B2=sparse(1:n,1:n,1,n,n)+delta*mu*L;
% Time-stepping procedure
for nt=1:N
    % Evaluate modified functional response
    hhat = u./(alpha + abs(u));
    % Update right-hand-side of linear system 
    F = u - u.*abs(u) - v.*hhat;
    G = beta*v.*hhat - gamma*v;
    y1 = u + delt*F;
    y2 = v + delt*G;
    % Solve for u and v using GMRES
    [u,flagu,relresu,iteru]=gmres(B1,y1,[],1e-6,[],[],[],u);
    if flagu~=0 flagu,relresu,iteru,error('GMRES did not converge'),end
    [v,flagv,relresv,iterv]=gmres(B2,y2,[],1e-6,[],[],[],v);
    if flagv~=0 flagv,relresv,iterv,error('GMRES did not converge'),end
end
% Re-order 1-D solution vectors into 2-D solution grids
V_grid=reshape(v,dimJ,dimJ); U_grid=reshape(u,dimJ,dimJ);
% Put solution grids into ij (matrix) orientation
V_grid=V_grid'; U_grid=U_grid';
% Plot solutions u and v
figure;pcolor(X,Y,U_grid);shading flat;colorbar;axis square xy;title('u')
figure;pcolor(X,Y,V_grid);shading flat;colorbar;axis square xy;title('v')

  return
end
