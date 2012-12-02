function spcomparederiv
% SPCOMPAREDERIV  Compare derivative computation schemes
%    Script to compare the achieved approximation quality of 
%    the derivatives for the multilinear Clenshaw-Curtis sparse
%    grid (discontinuous and augmented continuous) and the
%    Chebyshev grid.
%
%    See also SPINTERP, TESTDERIVATIVES.

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.0
% Date   : July 12, 2006

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
gridtype = {'Chebyshev', 'Clenshaw-Curtis', 'Clenshaw-Curtis'};

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

for l = 1:3
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
	
	% Compute exact derivative values
	for l = 1:d
		f_grad_exact{l} = feval('testderivatives',y{:},l,k,c(:,k),w(:,k));
	end
	
	% Compute approximate, interpolated function values and maximum
  % absolute error maxerr.
	z = cell(1,3);
	for l = 1:3
	  disp([' Grid: ' gridtype{l}]);
		if l == 3
			disp('   Enabling augmented continuous derivatives.'); 
		end
		for n = 0:nmax
			tic;
			% Compute sparse grid and weights
			options = spset('GridType', gridtype{l}, 'MinDepth', n, ...
											'MaxDepth', n, 'Vectorized', 'on', ...
											'PrevResults', z{l});
			z{l} = spvals('testfunctions',d,[],options,k,c(:,k),w(:,k));
			t = toc; tic;
			if l == 3
			  z{l}.continuousDerivatives = 'on';
			end
			[f_interp, f_ipgrad] = spinterp(z{l},y{:});
			f_ipgrad_mat = cell2mat(f_ipgrad);
			t2 = toc;
			temp = 0;
			for l2 = 1:d
			  temp = max(temp, ...
				   max(abs(f_grad_exact{l2} - f_ipgrad_mat(l2:d:end))));
			end
			maxerr{l}(k,n+1) = temp;
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
	subplot(2,3,k,'align');
	loglog(npoints{1},maxerr{1}(k,:),'bs-','LineWidth',1, 'MarkerSize', 4);
	hold on
	loglog(npoints{2},maxerr{2}(k,:),'ro--','LineWidth',1, 'MarkerSize', 4);
	hold on
	loglog(npoints{3},maxerr{3}(k,:),'kd-.','LineWidth',1, 'MarkerSize', 4);
	axis tight;
	set(gca,'XLim',[1 Nmax]);
	xlim = get(gca,'XLim');
	ylim = log10([ ...
	  min([min(maxerr{1}(k,:)),min(maxerr{2}(k,:)),min(maxerr{3}(k,:))]) ...
	  max([max(maxerr{1}(k,:)),max(maxerr{2}(k,:)),max(maxerr{3}(k,:))])]);
	set(gca,'YLim',10.^[floor(ylim(1)/2)*2 ceil(ylim(2)/2)*2]);
	set(gca,'XTick',10.^(1:log10(Nmax)));
	title(functionnames{k});
end
h = legend('H^{CGL}','H^{CC} (discont.)','H^{CC} (cont.)',1);
legend boxoff;