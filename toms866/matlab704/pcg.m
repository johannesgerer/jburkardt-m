function [x,flag,relres,iter,resvec] = pcg(A,b,tol,maxit,M1,M2,x0,varargin)
%PCG   Preconditioned Conjugate Gradients Method.
%   X = PCG(A,B) attempts to solve the system of linear equations A*X=B for
%   X. The N-by-N coefficient matrix A must be symmetric and positive
%   definite and the right hand side column vector B must have length N.
%
%   X = PCG(AFUN,B) accepts a function handle AFUN instead of the matrix A.
%   AFUN(X) accepts a vector input X and returns the matrix-vector product
%   A*X. In all of the following syntaxes, you can replace A by AFUN.
%
%   X = PCG(A,B,TOL) specifies the tolerance of the method. If TOL is []
%   then PCG uses the default, 1e-6.
%
%   X = PCG(A,B,TOL,MAXIT) specifies the maximum number of iterations. If
%   MAXIT is [] then PCG uses the default, min(N,20).
%
%   X = PCG(A,B,TOL,MAXIT,M) and X = PCG(A,B,TOL,MAXIT,M1,M2) use symmetric
%   positive definite preconditioner M or M=M1*M2 and effectively solve the
%   system inv(M)*A*X = inv(M)*B for X. If M is [] then a preconditioner
%   is not applied. M may be a function handle MFUN returning M\X.
%
%   X = PCG(A,B,TOL,MAXIT,M1,M2,X0) specifies the initial guess. If X0 is
%   [] then PCG uses the default, an all zero vector.
%
%   [X,FLAG] = PCG(A,B,...) also returns a convergence FLAG:
%    0 PCG converged to the desired tolerance TOL within MAXIT iterations
%    1 PCG iterated MAXIT times but did not converge.
%    2 preconditioner M was ill-conditioned.
%    3 PCG stagnated (two consecutive iterates were the same).
%    4 one of the scalar quantities calculated during PCG became too
%      small or too large to continue computing.
%
%   [X,FLAG,RELRES] = PCG(A,B,...) also returns the relative residual
%   NORM(B-A*X)/NORM(B). If FLAG is 0, then RELRES <= TOL.
%
%   [X,FLAG,RELRES,ITER] = PCG(A,B,...) also returns the iteration number
%   at which X was computed: 0 <= ITER <= MAXIT.
%
%   [X,FLAG,RELRES,ITER,RESVEC] = PCG(A,B,...) also returns a vector of the
%   residual norms at each iteration including NORM(B-A*X0).
%
%   Example:
%      n1 = 21; A = gallery('moler',n1);  b1 = A*ones(n1,1);
%      tol = 1e-6;  maxit = 15;  M = diag([10:-1:1 1 1:10]);
%      [x1,flag1,rr1,iter1,rv1] = pcg(A,b1,tol,maxit,M);
%   Or use this parameterized matrix-vector product function:
%      afun = @(x,n)gallery('moler',n)*x;
%      n2 = 21; b2 = afun(ones(n2,1),n2);
%      [x2,flag2,rr2,iter2,rv2] = pcg(@(x)afun(x,n2),b2,tol,maxit,M);
%
%   Class support for inputs A,B,M1,M2,X0 and the output of AFUN:
%      float: double
%
%   See also BICG, BICGSTAB, CGS, GMRES, LSQR, MINRES, QMR, SYMMLQ,
%   CHOLINC, FUNCTION_HANDLE.

%   Copyright 1984-2004 The MathWorks, Inc.
%   $Revision: 1.18.4.4 $ $Date: 2004/12/06 16:35:22 $

if (nargin < 2)
   error('MATLAB:pcg:NotEnoughInputs', 'Not enough input arguments.');
end

% Determine whether A is a matrix or a function.
[atype,afun,afcnstr] = iterchk(A);
if strcmp(atype,'matrix')
   % Check matrix and right hand side vector inputs have appropriate sizes
   [m,n] = size(A);
   if (m ~= n)
      error('MATLAB:pcg:NonSquareMatrix', 'Matrix must be square.');
   end
   if ~isequal(size(b),[m,1])
      error('MATLAB:pcg:RSHsizeMatchCoeffMatrix', ...
         ['Right hand side must be a column vector of' ...
         ' length %d to match the coefficient matrix.'],m);
   end
else
   m = size(b,1);
   n = m;
   if ~isvector(b) || (size(b,2) ~= 1) % if ~isvector(b,'column')
      error('MATLAB:pcg:RSHnotColumn',...
         'Right hand side must be a column vector.');
   end
end

% Assign default values to unspecified parameters
if (nargin < 3) || isempty(tol)
   tol = 1e-6;
end
if (nargin < 4) || isempty(maxit)
   maxit = min(n,20);
end

% Check for all zero right hand side vector => all zero solution
n2b = norm(b);                      % Norm of rhs vector, b
if (n2b == 0)                       % if    rhs vector is all zeros
   x = zeros(n,1);                  % then  solution is all zeros
   flag = 0;                        % a valid solution has been obtained
   relres = 0;                      % the relative residual is actually 0/0
   iter = 0;                        % no iterations need be performed
   resvec = 0;                      % resvec(1) = norm(b-A*x) = norm(0)
   if (nargout < 2)
      itermsg('pcg',tol,maxit,0,flag,iter,NaN);
   end
   return
end

if ((nargin >= 5) && ~isempty(M1))
   existM1 = 1;
   [m1type,m1fun,m1fcnstr] = iterchk(M1);
   if strcmp(m1type,'matrix')
      if ~isequal(size(M1),[m,m])
         error('MATLAB:pcg:WrongPrecondSize', ...
            ['Preconditioner must be a square matrix' ...
            ' of size %d to match the problem size.'],m);
      end
   end
else
   existM1 = 0;
   m1type = 'matrix';
end

if ((nargin >= 6) && ~isempty(M2))
   existM2 = 1;
   [m2type,m2fun,m2fcnstr] = iterchk(M2);
   if strcmp(m2type,'matrix')
      if ~isequal(size(M2),[m,m])
         error('MATLAB:pcg:WrongPrecondSize', ...
            ['Preconditioner must be a square matrix' ...
            ' of size %d to match the problem size.'],m);
      end
   end
else
   existM2 = 0;
   m2type = 'matrix';
end

if ((nargin >= 7) && ~isempty(x0))
   if ~isequal(size(x0),[n,1])
      error('MATLAB:pcg:WrongInitGuessSize', ...
         ['Initial guess must be a column vector of' ...
         ' length %d to match the problem size.'],n);
   else
      x = x0;
   end
else
   x = zeros(n,1);
end

if ((nargin > 7) && strcmp(atype,'matrix') && ...
      strcmp(m1type,'matrix') && strcmp(m2type,'matrix'))
   error('MATLAB:pcg:TooManyInputs', 'Too many input arguments.');
end

% Set up for the method
flag = 1;
xmin = x;                          % Iterate which has minimal residual so far
imin = 0;                          % Iteration at which xmin was computed
tolb = tol * n2b;                  % Relative tolerance
r = b - iterapp_704('mtimes',afun,atype,afcnstr,x,varargin{:});
normr = norm(r);                   % Norm of residual

if (normr <= tolb)                 % Initial guess is a good enough solution
   flag = 0;
   relres = normr / n2b;
   iter = 0;
   resvec = normr;
   if (nargout < 2)
      itermsg('pcg',tol,maxit,0,flag,iter,relres);
   end
   return
end

resvec = zeros(maxit+1,1);         % Preallocate vector for norm of residuals
resvec(1) = normr;                 % resvec(1) = norm(b-A*x0)
normrmin = normr;                  % Norm of minimum residual
rho = 1;
stag = 0;                          % stagnation of the method

% loop over maxit iterations (unless convergence or failure)

for i = 1 : maxit
   if existM1
      y = iterapp_704('mldivide',m1fun,m1type,m1fcnstr,r,varargin{:});
      if any(~isfinite(y))
         flag = 2;
         break
      end
   else % no preconditioner
      y = r;
   end

   if existM2
      z = iterapp_704('mldivide',m2fun,m2type,m2fcnstr,y,varargin{:});
      if any(~isfinite(z))
         flag = 2;
         break
      end
   else % no preconditioner
      z = y;
   end

   rho1 = rho;
   rho = r' * z;
   if ((rho == 0) || isinf(rho))
      flag = 4;
      break
   end
   if (i == 1)
      p = z;
   else
      beta = rho / rho1;
      if ((beta == 0) || isinf(beta))
         flag = 4;
         break
      end
      p = z + beta * p;
   end
   q = iterapp_704('mtimes',afun,atype,afcnstr,p,varargin{:});
   pq = p' * q;
   if ((pq <= 0) || isinf(pq))
      flag = 4;
      break
   else
      alpha = rho / pq;
   end
   if isinf(alpha)
      flag = 4;
      break
   end
   if (alpha == 0)                  % stagnation of the method
      stag = 1;
   end

   % Check for stagnation of the method
   if (stag == 0)
      stagtest = zeros(n,1);
      ind = (x ~= 0);
      stagtest(ind) = p(ind) ./ x(ind);
      stagtest(~ind & p ~= 0) = Inf;
      if (abs(alpha)*norm(stagtest,inf) < eps)
         stag = 1;
      end
   end

   x = x + alpha * p;               % form new iterate
   normr = norm(b - iterapp_704('mtimes',afun,atype,afcnstr,x,varargin{:}));
   resvec(i+1) = normr;

   if (normr <= tolb)               % check for convergence
      flag = 0;
      iter = i;
      break
   end

   if (stag == 1)
      flag = 3;
      break
   end

   if (normr < normrmin)           % update minimal norm quantities
      normrmin = normr;
      xmin = x;
      imin = i;
   end

   r = r - alpha * q;

end                                % for i = 1 : maxit

% returned solution is first with minimal residual
if (flag == 0)
   relres = normr / n2b;
else
   x = xmin;
   iter = imin;
   relres = normrmin / n2b;
end

% truncate the zeros from resvec
if ((flag <= 1) || (flag == 3))
   resvec = resvec(1:i+1);
else
   resvec = resvec(1:i);
end

% only display a message if the output flag is not used
if (nargout < 2)
   itermsg('pcg',tol,maxit,i,flag,iter,relres);
end
