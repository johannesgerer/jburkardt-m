function Q = mg_ns_smooth(A,sweeps,smooth,stype)
%mg_ns_smooth   smoothers for GMG iteration (Navier-Stokes)
%   Q = mg_ns_smooth(A,sweeps,smooth,stype)
%   input
%          A         coefficient matrix
%          sweeps    number of directions for multidirectional Gauss-Seidel 
%          smooth    smoother (1, Jacobi, 2, Gauss-Seidel, 3 ILU)
%          stype     type of smoother (1 point, 2 line)
%   output
%          Q         structure, smoothing operators in factored form
%
%   IFISS function: HCE; 18 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

N=size(A,1);
n = sqrt(size(A,1));
if stype==2
   % line Gauss-Seidel
   Q1 = tril(A,1);
   [L1,U1] = lu(Q1);
   if sweeps>=2
      Q2 = diag(diag(A,0)) + diag(diag(A,-n),-n) + diag(diag(A,n),n) ...
         + diag(diag(A,-n-1),-n-1) + diag( diag(A,-1),-1)        ...
         + diag(diag(A,n-1),n-1);
      [L2,U2] = lu(Q2);
      if sweeps>=3
         Q3 = triu(A,-1);
         [L3,U3] = lu(Q3);
      if sweeps==4
         Q4 = diag(diag(A,0)) + diag(diag(A,-n),-n) + diag(diag(A,n),n) ...
            + diag(diag(A,n+1),n+1) + diag( diag(A,1),1)            ...
            + diag(diag(A,-n+1),-n+1);
         [L4,U4] = lu(Q4);
         else
            L4=sparse(N,N); U4=L4;
         end
      else
         L3=sparse(N,N); U3=L3; L4=L3; U4=L3;
      end
   else
      L2=sparse(N,N); U2=L2; L3=L2; U3=L2; L4=L2; U4=L2;
   end
else
   % point smoothers
   if smooth==3,
      % ILU
      [L1,U1]=ilu0(A);
      L2=sparse(size(L1)); U2=L2; L3=L2; U3=L2; L4=L2; U4=L2;
   elseif smooth==2,
      % point Gauss-Seidel
      Q1 = tril(A,0); [L1,U1] = lu(Q1);
      L2=sparse(size(L1)); U2=L2; L3=L2; U3=L2; L4=L2; U4=L2;
   else
      % point damped Jacobi
      omega=8/9; % relaxation factor for damped Jacobi
      Q1 = (1/omega)*spdiags(diag(A),0,n*n,n*n);[L1,U1] = lu(Q1);
      L2=sparse(size(L1)); U2=L2; L3=L2; U3=L2; L4=L2; U4=L2;
   end
end
Q = struct('L1',L1,'L2',L2,'L3',L3,'L4',L4, ...
           'U1',U1,'U2',U2,'U3',U3,'U4',U4);     
