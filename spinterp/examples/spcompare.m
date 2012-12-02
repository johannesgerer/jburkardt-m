function spcompare
% SPCOMPARE  Compare multilinear interpolation schemes
%    Compares the multilinear sparse grid interpolation routines 
%    using the six test functions TESTFUNCTIONS of Gerz.
%
% Note: This demo takes a few minutes to run.
%
%    See also SPINTERP, TESTFUNCTIONS.

% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.3
% Date   : March 16, 2005

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

% Dimension of the test functions
d = 3;
%d = 5;

% Sparse grid types
gridtype = {'Maximum', 'NoBoundary', 'Clenshaw-Curtis'};

% Number of discretization levels, sparse grids
switch d
 case 3
	nmax = [7 9 11]; 
 case 5
	nmax = [5 7 9]; 
end

% Discretization depth, full grid 
% Maximum number of points: (2^(nfull-1)+1)^d
switch d
 case 3
	nfull = 6;
 case 5
	nfull = 5;
end

%  Compute random constants w and c for Gerz' test functions.
w = rand(d,6);
c = rand(d,6);
b = [1.5 d 1.85 7.03 20.4 4.3];
sumc = sum(c,1);
sumw = sum(w,1);
for k = 1:6
	c(:,k) = b(k).*c(:,k)/sumc(k);
	w(:,k) = w(:,k)/sumw(k);
end

% Compute 1000 random points to interpolate
y = cell(1,d);
for k = 1:d
	y{k} = rand(1000,1);
end

z = cell(1,3);
npoints = cell(1,3);
maxerr = cell(1,3);
for l = 1:3
	maxerr{l} = zeros(6,nmax(l));
	npoints{l} = zeros(1,nmax(l));
end

disp(['Problem dimension: d = ' num2str(d)]);

warning('off', 'MATLAB:spinterp:insufficientDepth');

% Do for all six testfunctions
for k = 1:6
	
	disp(['Current test function: ' num2str(k)]);
	% Do for all sparse grid interpolation schemes
	
	% Compute exact function values
	f_exact = feval('testfunctions',y{:},k,c(:,k),w(:,k));
	
	% Compute approximative, interpolated function values and maximum
  % absolute error maxerr.
	z = cell(1,3);
	for l = 1:3
		disp(['  Grid: ' gridtype{l}]);
		for n = 0:nmax(l)
			tic;
			% Compute sparse grid and weights
			options = spset('GridType', gridtype{l}, 'MinDepth', n, ...
											'MaxDepth', n, 'Vectorized', 'on', ...
											'PrevResults', z{l});
			z{l} = spvals('testfunctions',d,[],options,k,c(:,k),w(:,k));
			t = toc; tic;
			f_interp = spinterp(z{l},y{:});
			t2 = toc;
			maxerr{l}(k,n+1) = max(abs(f_exact - f_interp));
			disp(['    n: ' sprintf('%2d',n) ...
						', spvals: ' sprintf('%5.2f', t) ' [s], spinterp: ' ...
						sprintf('%5.2f',t2) ' [s], e_max: ' ...
						sprintf('%1.3e', maxerr{l}(k,n+1)) '.']);
			npoints{l}(n+1) = z{l}.nPoints;
		end
		disp(' ');
	end
end

warning('on', 'MATLAB:spinterp:insufficientDepth');

% Compute full grid interpolation error for comparison
npoints0 = zeros(1,nfull);
maxerr0 = zeros(6,nfull);
Xfull = cell(1,d);
for l = 1:nfull
	x = linspace(0,1,2^(l-1)+1);
	npoints0(l) = (2^(l-1)+1)^d;
	[Xfull{1:d}] = ndgrid(x);
	for k = 1:6
		V = feval('testfunctions',Xfull{:},d,k,c(:,k),w(:,k));
		f_interp0 = interpn(Xfull{:},V,y{:});
		f_exact = feval('testfunctions',y{:},k,c(:,k),w(:,k));
		maxerr0(k,l) = max(abs(f_exact - f_interp0));		
	end
end
		
% Plot error decay
functionnames = {'oscillatory', 'product peak', 'corner peak', ...
								 'Gaussian', 'continuous', 'discontinuous'};

clf;
for k = 1:6
	subplot(2,3,k);
	loglog(npoints0,maxerr0(k,:),'k+--','LineWidth',1, 'MarkerSize', 4);
	hold on
	loglog(npoints{1},maxerr{1}(k,:),'bs-','LineWidth',1, 'MarkerSize', 4);
	loglog(npoints{2},maxerr{2}(k,:),'g.--','LineWidth',1, 'MarkerSize', 5);
	loglog(npoints{3},maxerr{3}(k,:),'ro-.','LineWidth',1, 'MarkerSize', 4);
	set(gca,'XLim',[1 1e6]);
	xlim = get(gca,'XLim');
	set(gca,'XTick',[1 1e2 1e4 1e6]);
	npo = logspace(0,log10(xlim(2)),50);
	npo2 = npo.^(-2).*abs(log2(npo)).^(3*(d-1));
	[a, idx] = max(npo2);
	npo = logspace(log10(npo(idx)),log10(xlim(2)),10);
	npo2 = npo.^(-2).*abs(log2(npo)).^(3*(d-1));
	npo2 = npo2/max(npo2);
	loglog(npo, npo2, 'k:', 'LineWidth', 1);
	title(functionnames{k});
end
h = legend('full','H^M','H^{NB}', 'H^{CC}','[spc]', 3);
