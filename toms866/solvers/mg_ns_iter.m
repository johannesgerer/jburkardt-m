function x = mg_ns_iter(mgdata,x0,f,level,npre,npost,sweeps)
%mg_ns_iter    performs one MG iteration (Navier-Stokes)
%   x = mg_ns_iter(mgdata,x0,f,level,npre,npost,sweeps)
%   input
%          mgdata       structure containing matrices, grid transfer 
%                       operators and smoothing operators
%          x0           initial iterate
%          f            right-hand side
%          level        grid level
%          npre         number of presmoothing steps
%          npost        number of postsmoothing steps
%          sweeps       type of sweeping strategy used for Gauss-Seidel
%                       smoothing
%   output
%          x            result of one MG iteration
%
%   IFISS function: HCE; 18 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

A = mgdata(level).matrix;
P = mgdata(level).prolong;
for i=2:level, smoother(i) = mgdata(i).smoother; end 

if level==2,
   n = length(A);
   [U,Sig,V] = svd(full(A));
   s = diag(Sig);
   if abs(s(n))<1.d-14, si = [1./s(1:n-1);0];
   else                 si = 1./s(1:n);
   end
   Sigi = diag(si);
   x = V*(Sigi*(U'*f));
else

   % presmooth 
   x = mg_pre(A,x0, f,npre,smoother,level,sweeps);
   % Restrict residual   
   r = f - A*x;
   rc = P'*r;
   % coarse grid correction
   cc = mg_ns_iter(mgdata,zeros(size(rc)),rc,level-1,npre,npost,sweeps);
   % add this line for W-cycle
%  cc = mg_ns_iter(mgdata,cc,rc,level-1,npre,npost,sweeps);
   x = x + P*cc;   
   % postsmooth
   x = mg_post(A,x,f,npost,smoother,level,sweeps);
end
