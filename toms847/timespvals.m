function timespvals
% TIMESPVALS  Script file to test the performance of the
% multilinear sparse grid interpolation routine by measuring the
% required time to compute the hierarchical surpluses. The
% Clenshaw-Curtis grid is used.
% Note: The sparse grid interpolation routines require Matlab's JIT
% compiler to perform well, which is part of Matlab since version
% 6.5. 
%
%    See also SPVALS, SPINTERP, TESTFUNCTIONS.

% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.3
% Date   : November 2, 2004

% Dimensions of the test functions
d = [1,2,4,8,16];
ndims = length(d);

% Maximum number of discretization levels for each dimension
n = [17,13,10,6,4];
%n = [19,16,12,8,5];

markers = ['s', '.', 'd', '+', 'o'];

%  Compute random constants w and c for Gerz' test functions.
w = rand(d(end),1);
c = rand(d(end),1);
sumc = sum(c,1);
sumw = sum(w,1);
c = 1.5.*c/sumc;
w = w/sumw;

time = NaN*ones(ndims,n(1)+1);
npoints = zeros(ndims,n(1)+1);

for m = 1:ndims
	disp(['Current dim: ' num2str(d(m))]);
	for l = 0:n(m)
		tic
		disp(['Current level n = ' num2str(l) '...']);
		z = {};
		options = spset('MinDepth',l,'MaxDepth',l,'Vectorized','on',...
										'GridType','Clenshaw-Curtis');
		z = spvals('testfunctions',d(m),[],options,1,c(1:d(m)),w(1: ...
																									d(m)));
		t = z.surplusCompTime;
		disp(['Computing sparse grid points and evaluating function took ' ...
					num2str(z.fevalTime) ' [s].']);
		time(m,l+1) = t;
		disp(['Computing hierarchical surpluses took ' num2str(t) ' [s].']);
		disp(' ');
		if l > 0
			npoints(m,l+1) = npoints(m,l);
		end
		npoints(m,l+1) = npoints(m,l+1) + size(z.vals{l+1},1);
	end
end

% Plot results
clf;
h = loglog(npoints(:,2:end)', time(:,2:end)', 'LineWidth', 1);
axis tight;
for k = 1:ndims
	set(h(k), 'Marker', markers(k));
	hold on;
end
axis manual;

% Plot assymtotic curves for two cases
for nd = [1 ndims]
	assymptotic = zeros(n(nd),1);
	for k = 0:n(nd)
    levelseq = spgetseq(k,d(nd))';
		seqpoints = prod((levelseq <= 1) .* 2.^levelseq + ...
										 (levelseq > 1) .* 2.^(levelseq-1));
		
    assymptotic(k+1) = sum((prod(levelseq+1)-1).*seqpoints)*d(nd);
		if k > 0
			assymptotic(k+1) = assymptotic(k+1) + assymptotic(k);
		end
	end
	const = 1./assymptotic(end).*time(nd,n(nd)+1);
	plot(npoints(nd,1:n(nd)+1),assymptotic.*const,'k--'); 
end

% Add legend and axis labels
hold off;
title('Time to compute hierarchical surpluses for Clenshaw-Curtis grid');
ylabel('time [s]');
xlabel('number of nodes N');
s = {};
for k = 1:ndims
  s{k} = ['d = ' num2str(d(k))];
end
s{ndims+1} = 'asymptotic';
h = legend(s,2);
