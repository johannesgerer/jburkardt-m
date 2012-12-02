function spcomparepoly
% SPCOMPAREPOLY  Compare multilinear and polynomial interpolation  
%    Script to compare the multilinear Clenshaw-Curtis sparse grid 
%    interpolation scheme to the polynomial interpotion scheme with 
%    the Chebyshev grid and the Gauss-Patterson grid.
%
%    See also SPINTERP, TESTFUNCTIONS.

% Author : Andreas Klimke, Universitaet Stuttgart
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

% Sparse grid types
gridtype = {'Chebyshev', 'Gauss-Patterson', 'Clenshaw-Curtis'};

Nmax = 1e4;

% Number of discretization levels, sparse grids
n = 1;
while spdim(n,d) < Nmax
	nmax = n;
	n = n + 1;
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

% Compute 100 random points to interpolate
y = {};
for k = 1:d
	y{k} = rand(100,1);
end

for l = 1:2
	maxerr{l} = zeros(6,nmax+1);
	npoints{l} = zeros(1,nmax+1);
end

disp(['Problem dimension: d = ' num2str(d) ', max. nodes: N = ' ...
			num2str(spdim(nmax,d)) ]);

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
		for n = 0:nmax
		  if l == 2 && n > 5
			  % Skip GP-grid for n larger than stable
				maxerr{l}(k,n+1) = NaN;
				npoints{l}(n+1) = NaN;
				continue;
			end		
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
						', spvals:' sprintf('%6.2f', t) ' [s], spinterp:' ...
						sprintf('%6.2f',t2) ' [s], e_max: ' ...
						sprintf('%1.3e', maxerr{l}(k,n+1)) '.']);
			npoints{l}(n+1) = z{l}.nPoints;
		end
		disp(' ');
	end
end

warning('on', 'MATLAB:spinterp:insufficientDepth');
		
% Plot error decay
functionnames = {'oscillatory', 'product peak', 'corner peak', ...
								 'Gaussian', 'continuous', 'discontinuous'};

clf;
for k = 1:6
	subplot(2,3,k);
	loglog(npoints{1},maxerr{1}(k,:),'bs-','LineWidth',1, 'MarkerSize', 4);
	hold on
	loglog(npoints{2},maxerr{2}(k,:),'gd-.','LineWidth',1, 'MarkerSize', 4);
	loglog(npoints{3},maxerr{3}(k,:),'ro--','LineWidth',1, 'MarkerSize', 4);
	set(gca,'XLim',[1 1e4]);
	xlim = get(gca,'XLim');
	set(gca,'XTick',[1 1e1 1e2 1e3 1e4]);
	title(functionnames{k},'FontSize',12);
end
h = legend('H^{CGL}','H^{GP}','H^{CC}',3);
