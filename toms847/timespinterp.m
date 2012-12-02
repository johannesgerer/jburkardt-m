function timespinterp
% TIMESPINTERP  Script file to draw a graph showing the time to
% compute 1000 interpolated points with SPINTERP. The
% Clenshaw-Curtis grid is used.
% Note: The sparse grid interpolation routines require Matlab's JIT
% compiler to perform well, which is part of Matlab since version
% 6.5. 
%
%    See also SPVALS, SPINTERP, TESTFUNCTIONS.

% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.2
% Date   : November 2, 2004

% Dimension of the test functions
d = [1,2,4,8,16];
ndims = length(d);

% Maximum number of discretization levels for each dimension
n = [17,13,10,6,4];
%n = [19,16,12,8,5];

markers = ['s', '.', 'd', '+', 'o'];

% Number of points to interpolate
nippoints = 1000;

%  Compute random constants w and c for Gerz' test functions.
w = rand(d(end),1);
c = rand(d(end),1);
sumc = sum(c,1);
sumw = sum(w,1);
c = 1.5.*c/sumc;
w = w/sumw;

time = zeros(ndims,n(1)+1);
level = zeros(ndims,n(1)+1);
npoints = zeros(ndims,ndims+1);

for k = 1:d(end)
	v{k} = rand(nippoints,1);
end
	
for m = 1:ndims
	disp(['Current dim: ' num2str(d(m))]);
	disp(['Computing sparse grid surpluses up to level ' num2str(n(m)) '...']);
	z = {};
	options = spset('MinDepth',n(m),'MaxDepth',n(m),'Vectorized','on', ...
									'GridType', 'Clenshaw-Curtis');
	tic;
	z = spvals('testfunctions',d(m),[],options,1,c(1:d(m)),w(1: ...
																									d(m)));
	t = toc;
	disp(['Computing time: ' num2str(t) ' [s].']);
	disp(['Performing 1000 evaluations for each level...']);
	for l = 0:n(m)
		tic;
		z.interpDepth = l;
		y = spinterp(z,v{1:d(m)});
		time(m,l+1) = toc;
		level(m,l+1) = l;
		if l > 0
			npoints(m,l+1) = npoints(m,l);
		end
		npoints(m,l+1) = npoints(m,l+1) + size(z.vals{l+1},1);
	end
	disp('Done!');
	disp(' ');
end

% Plot results
clf;
h = loglog(npoints',time','.-','LineWidth',1);
for k = 1:ndims
	set(h(k), 'Marker', markers(k));
	hold on;
end
axis tight;

% Plot assymtotic curves for all cases
for nd = 1:ndims
	assymptotic = zeros(n(nd),1);
	for k = 0:n(nd)
		assymptotic(k+1) = d(nd).*factorial(k+d(nd))/factorial(k)/ ...
				factorial(d(nd)); 
	end
	const = 1./assymptotic(end).*time(nd,n(nd)+1);
	plot(npoints(nd,1:n(nd)+1),assymptotic.*const,'k--'); 
end

% Add legend and axis labels
hold off;
title('Time to compute 1000 interpolated values (CC-grid)');
ylabel('time [s]')
xlabel('number of nodes N')
s = {};
for k = 1:ndims
	s{k} = ['d = ' num2str(d(k))];
end
s{ndims+1} = 'asymptotic';
h = legend(s,2);
