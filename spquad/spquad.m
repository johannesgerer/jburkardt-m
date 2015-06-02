function [ x, w ] = spquad ( dim, ord, bpt )
%SPQUAD
%   Computes the sparse grid quadrature abscissae and weights
%   on an orthotope/hyperrectangle using the Clenshaw-Curtis rule.
%
%   [X,W]=SPQUAD(DIM,ORD,AB)
%
%   Input Parameters:
%   DIM - number of dimensions
%   ORD - order of the integration rule
%   BPT - boundary points (Optional. Defaults to [-1,1]^dim)
% 
%   If used, BPT should be a 2 by DIM matrix containing the 
%   endpoints of the hyperrectangle in each column.
%
%   Example usage:
% 
%   f=@(x) (1+x(:,1)).*exp(x(:,2).*x(:,3))+(1+x(:,2)).*exp(x(:,3).*x(:,1))
%   [x,w]=spquad(3,4,[-1 0 2; 1 1 3]);
%   Q=w'*f(x);
%
%   written by Greg von Winckel - March 3, 2008
%   Contact: gregory(dot)von-winckel(at)uni-graz(dot)at

%
% Check that the number of dimensions agree.
%
if nargin>2
    if size(bpt,2)~=dim
        error('dimension mismatch');
    end
else
    bpt=repmat([-1,1]',1,dim);
end
%
% Length and midpoint in each dimension.
%
len=diff(bpt); mpt=mean(bpt);
%
% zeroth order case is just the midpoint rule
%
if ord==0 
    x=mpt; w=prod(len);
%
%  1D case is special.
%
elseif ord~=0 && dim==1
    x=mpt+len*cos(pi*2^(-ord)*(0:(2^ord))')/2;
    w=clencurt(2^(ord)+1)*len/2;
else
    x0=mpt;
    w0=prod(len);
    for j=1:ord
        [x,w]=sparsegridnd(dim,j,mpt,len);
        [C,I]=intersect(x,x0,'rows');
        w(I)=w(I)+w0; x0=x; w0=w;
    end

end

%% Multidimensional nodes and difference weights.

function [ x, w ] = sparsegridnd ( n, ord, mpt, len )

% Generates the n-dimensional sparse grid of order ord on the 
% hyperrectangle with centroid mpt and side lengths len, based
% on Chebyshev-Gauss-Lobatto points.

%
% Define 1D grid points
%
p=@(i) unique((i~=0)*cos(pi*2^(-i)*(0:(2^i)))');
%
% Get configurations of all possible subgrids
%
v=genindex(n,ord); 
vmax=1+v(1,n);
%
% Compute all orders of one-dimensional quadrature rules
%
P=uaf(@(j) p(j), (0:vmax-1));
Q=uaf(@(j) diffweight(j), (0:vmax));
%
% Take the union of all possible subgrids 
%
m=size(v,1);
xw=uaf(@(k) getpts(P,Q,v(k,:),mpt,len), (1:m)',1);
x=xw(:,1:n); 
w=xw(:,n+1);
%
% Kludge to deal with small errors introduced by ndgrid
% need a better way to do this
%
roundn=@(a,n) round(a*10^n)/10^n;
x=roundn(x,15);
%
% Get unique points and weights
%
[x,ii,jj]=unique(x,'rows'); 
rows=length(ii); 
cols=length(jj);  
%
% Do node condensation for combining weights
%
w=sparse(jj,(1:cols)',ones(cols,1),rows,cols)*w;


%% One dimensional difference weights

function dw = diffweight ( ii )

if ii==0        
    dw=2;    
elseif ii==1    
    dw=[1;-2;1]/3;
else
    q=@(i) clencurt(2^(i)+1);
    dw=q(ii); dw(1:2:end)=dw(1:2:end)-q(ii-1);
end

%% Compute the subset grid points and difference weights.

function [XW] = getpts ( P, Q, v, mpt, len )

n=size(v,2);
[x{1:n}]=ndgrid(P{1+v});
[w{1:n}]=ndgrid(Q{1+v});
d=size(v,2);

X=uaf(@(k) mpt(k)+x{k}(:)*len(k)/2, (1:d),1);
W=prod(uaf(@(k) w{k}(:), (1:d),1),2);
XW=[X,W];

%% Find all possible combinations of bases

function v = genindex ( n, L1, head )

if n==1
    v = L1;
else
    v = uaf(@(j) genindex(n-1, L1-j, j),(0:L1)',1);
end

if nargin>=3
    v = [head+zeros(size(v,1),1) v];
end

%% Compute 1D Clenshaw-Curtis weights
% Reference: Jörg Waldvogel, 
%  "Fast construction of the Fejér and Clenshaw-Curtis quadrature rules," 
%  BIT Numerical Mathematics 43 (1), p. 001-018 (2004).

function w = clencurt ( N1 )

if N1==1
     w=2;
else
    N=N1-1;  c=zeros(N1,1);
    c(1:2:N1,1)=(2./[1 1-(2:2:N).^2 ])'; 
    f=real(ifft([c(1:N1,:);c(N:-1:2,:)]));
    w=2*([f(1,1); 2*f(2:N,1); f(N1,1)])/2;
end

%% Shorthand array function with uniform output
% Optional third argument converts output to matrix

function result = uaf ( arg, dex, varargin )

result=arrayfun(arg,dex,'UniformOutPut',false);

if nargin>2
    result=cell2mat(result);
end

