function x_mg = mg_ns(Amat,f, domain,mg_mat,mgdata)
%mg_ns    GMG preconditioner for Navier-Stokes equations
%   x_mg = mg_ns(Amat,f, domain,mg_mat,mgdata)
%   input
%          Amat         coefficient matrix
%          f            right-hand side
%          domain       physical domain, 1 for cavity, 3 for step
%          mgmat        problem type, 1 for diffusion, 2 for
%                       convection-diffusion 
%          mgdata       structure containing all GMG data
%   output
%          x_mg            result of preconditioning operation
%
%   IFISS function: HCE; 17 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

if domain==1,   % Cavity
% MG parameters
   tau = 1.d-8;
   maxit = 1;
   npre = 1;
   npost = 1;
   if mg_mat==1      % Apply MG to Poisson equation
      sweeps = 1;    % See mg_solve for explanation
      np = sqrt(length(Amat));  
      nc = log2(np-1);
   elseif mg_mat==2, % Apply MG to convection-diffusion equation
      sweeps = 4;    % See mg_solve for explanation
      nuv = sqrt(length(Amat));
      nc = log2(nuv-1);
   else
      error('Multigrid solver not implemented for this matrix')
   end 
elseif domain==3,  % Step
   tau = 1.d-8;
   maxit = 1;
   sweeps = 1;
   npre = 1;
   npost = 1; 
   nc = mgdata(size(mgdata,2)).nc;
end

% MG set-up
A = mgdata(nc).matrix;
x_mg = zeros(length(f),1);
r = f;
nr0 = norm(r);

if nr0==0, return; end

nr = nr0;
its = 0;
stats = [its,nr];

% MG iterative loop
flag=0;
its=0;
while (nr>tau*nr0)&(its<maxit)
   c = mg_ns_iter(mgdata,zeros(size(r)),r,nc,npre,npost,sweeps); 
   x_mg = x_mg+c;
   r = f - A*x_mg;
   nr = norm(r);
   its = its+1;
   stats = [stats;[its,nr]];
end
if its==(maxit)|isnan(nr)
   flag=1;
end

look_at_mg = 0;
if look_at_mg,
   if flag==0
% successful convergence
      fprintf('\n Problem %2i.  Convergence in %3i iterations',mg_mat,its)   
      fprintf('Bingo!\n\n')
   else
      fprintf('\n Problem %2i.  Iteration has failed to converge in %2i iterations',...
               mg_mat,maxit)
   end
   resplot(stats(:,2));
   nr0=stats(1,2);
   fprintf('\n    k  log10(||r_k||/||r_0||)   \n')
   for nits=0:its  %% HE
      fprintf('%5i %16.4f \n', nits, log10(stats(nits+1,2)/nr0));
   end
end
