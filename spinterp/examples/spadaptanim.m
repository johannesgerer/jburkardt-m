function spadaptanim
% SPADAPTANIM   Illustrate the dimension-adaptive construction
%    Illustrate process by means of a two-dimensional, separable 
%    function.
%
%    See also SPINTERP, SPVALS.

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.0
% Date   : May 7, 2005

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

% Some function f
f = inline('exp(-5*x.^2)+exp(-5*y.^2)');

% Define objective box
range = [-1 1; -1 1];

% Define problem dimension
d = 2;

% Create full grid for plotting
gs = 129;
[X,Y] = meshgrid(linspace(range(1,1),range(1,2),gs),...
								 linspace(range(2,1),range(2,2),gs));

Nmax = 65;	
colormap(1-bone);
			
N = 1; n = 1;
z = [];
err = []; est = []; npoints = [];
while N < Nmax
	% Set options: Switch vectorized processing on.
	options = spset('Vectorized', 'on','RelTol', 1e-8, ...
		'DimensionAdaptive', 'on', ...
		'DimadaptDegree', 1, ...
		'MinPoints', N+1, 'MaxPoints', N+1, ...
		'PrevResults', z);

	% Compute sparse grid weights over range
	z = spvals(f, d, range, options)
	
	N = z.nPoints;

	% Compute inpterpolated values at full grid
	ip = spinterp(z, X, Y);

	% Plot original function, interpolation, and error
	subplot(2,3,1);
	[c,h] = contour3(X,Y,f(X,Y),21);
	set(h,'LineWidth',1);
	surface(X(1:8:129,1:8:129),...
		Y(1:8:129,1:8:129),...
		f(X(1:8:129,1:8:129),Y(1:8:129,1:8:129)),...
		'EdgeColor',[.7 .7 1],'FaceColor','none','LineWidth',0.5)
	view(40,50);
	title('original');

	subplot(2,3,2);
	[c,h] = contour3(X,Y,ip,21);
	set(h,'LineWidth',1);
	surface(X(1:8:129,1:8:129),...
		Y(1:8:129,1:8:129),...
		ip(1:8:129,1:8:129),...
		'EdgeColor',[.7 .7 1],'FaceColor','none','LineWidth',0.5)
	view(40,50);
	title('interpolated');

	erract = ip-f(X,Y);
	subplot(2,3,3);
	imagesc(abs(erract),[0 0.2]);
	set(gca,'XTick',[1 129]);
	set(gca,'XTickLabel',[-1 1]);
	set(gca,'YTick',[1 129]);
	set(gca,'YTickLabel',[-1 1]);
	set(gca,'YDir','normal');
	h = colorbar;
	ylim = get(h,'YLim');
	set(h,'YTick',[ylim(1) (ylim(1)+ylim(2))/2 ylim(2)]);
	set(h,'YTickLabel',[0 0.1 0.2]);
	axis equal;
	axis tight;
	title('absolute error');

	subplot(2,3,4);
	plotindices(z);
	title('index sets');
	set(gca,'YDir','normal');
	set(gca,'XLim',[0 7]);
	set(gca,'YLim',[0 7]);
	set(gca,'XTick', [1 2 3 4 5 6]);
	set(gca,'YTick', [1 2 3 4 5 6]);
	
	subplot(2,3,5);
	x = spgrid(z.indices,[],options);
	plot(x(:,1),x(:,2),'k.', 'MarkerSize', 7);
	title('grid points');
	axis equal;
	axis tight;
	set(gca,'XTick',[]);
	set(gca,'YTick',[]);
	xlabel(['N = ' num2str(N)]);

	subplot(2,3,6);
	err(n) = max(abs(erract(:)));
	est(n) = z.estAbsError;
	npoints(n) = N;
	loglog(npoints, err,'rs-','LineWidth',1.5);
	hold on;
	loglog(npoints, est,'bo-','LineWidth',1.5);
	legend('actual', 'estimated',3);
	
	title(['maximum abs. error']);
	xlabel('N');
	set(gca,'XLim',[1 100]);
	set(gca,'YLim',[1e-3 1e0]);
	set(gca,'XTick',[1 10 100]);
	set(gca,'YTick',[1e-3 1e-2 1e-1 1e0 10]);
	grid on;
	set(gca,'XMinorGrid','off');
	set(gca,'YMinorGrid','off');
	n = n + 1;

	pause(2);
end
hold off;