function plotindices(z)
% PLOTINDICES  Visualize the index sets of a 2d dim.-adaptive grid
%    PLOTINDICES(Z)  Z must be the sparse grid data as returned by
%    SPVALS. SPVALS must be called with the option DimensionAdaptive
%    'on' (set options using SPSET).
%
%    See also SPVALS, SPSET.

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.0
% Date   : March 22, 2005

% Change log:
% V1.0    : March 22, 2005

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

d = size(z.indices.forwardNeighbors, 2);

switch d
 case 2
	indices = spseq2full(z.indices);
	plot(indices(:,1)+1,indices(:,2)+1,'kx','LineWidth',1);
	hold on;
	activeIndices = find(z.indices.active);
	plot(indices(activeIndices,1)+1, ...
			 indices(activeIndices,2)+1,'bs','LineWidth',1);
  if z.indices.active(z.activeIndices(1))
    plot(indices(z.activeIndices(1),1)+1, ...
	 indices(z.activeIndices(1),2)+1,'rs', ...
	 'LineWidth',2);
  end
	title(['k = ' num2str(size(indices,1))]);
	hold off;
	grid on;
	axis equal;
	axis tight;
	xlim = get(gca,'XLim');
	ylim = get(gca,'YLim');
	set(gca,'XLim', [0,xlim(2)+1]);
	set(gca,'YLim', [0,ylim(2)+1]);
	set(gca,'XTick', 1:xlim(2));
	set(gca,'YTick', 1:ylim(2));
	set(gca,'YDir','normal');
 otherwise
	error(['Visualization of index sets not available for d = ' num2str(d)]);
end
