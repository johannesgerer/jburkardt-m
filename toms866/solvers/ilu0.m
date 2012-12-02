function [L,U] = ilu0(A)
%ilu0   incomplete factorization with no fill of sparse matrix
%   [L,U] = ilu0(A)
%   input
%          A            nonsingular sparse matrix A
%   output
%          L            lower triangular factor with 1 on diagonal
%          U            upper triangular factor
%
%   IFISS function: HCE; 15 June 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

% save nonzero structure of A and of A' (the latter for more 
% efficient column search in find below)
A_mask = A~=0;
At = A_mask';

N = length(A);
for k=1:N-1,
% maximum row (col) index of nonzero in k'th col (row) of A
   mk_r = k+max(find(A_mask(k+1:N,k)));
   mk_c = k+max(find(At(k+1:N,k)));
% use next line instead of previous two only for symmetric nonzero structure
%  mk_r = k + max(find(A_mask(k+1:N,k)));  mk_c=mk_r;   
   if mk_r>k,
      ak = A(k+1:mk_r,k)/A(k,k); 
      A_koutprod_masked = (ak*A(k,k+1:mk_c)) .* A_mask(k+1:mk_r,k+1:mk_c);
      A_kblock = A(k+1:mk_r,k+1:mk_c) - A_koutprod_masked;
      A(:,k) = [A(1:k,k);ak;sparse(N-mk_r,1)];
      if mk_c-k < 1000,
         A(:,k+1:mk_c) = [A(1:k,k+1:mk_c);A_kblock;A(mk_r+1:N,k+1:mk_c)];
      else        
         A_kp1_to_mkc = [A(1:k,k+1:mk_c);A_kblock;A(mk_r+1:N,k+1:mk_c)];
         i=0;
         for j=k+1:mk_c,
            i=i+1;
            A(:,j) = A_kp1_to_mkc(:,i);
         end
      end 
   end
end

L = tril(A,-1) + speye(N,N);
%U = triu(A,0);
U = triu(A,1) + spdiags(diag(A),0,N,N);
