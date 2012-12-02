function timespvalsdct
% TIMESPVALSDCT   Compares the performance of SPVALS for the Cheby-
%    shev-Gauss-Lobatto grid with and without the DCT-based grid
%    construction algorithm.
%
% Note: This demo takes a couple of minutes to run.
%
%    See also TIMESPVALS.

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.0
% Date   : May 31, 2006

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

n1 = [14,12,10,6];
n2 = [17,14,10,6];
dvec = [1,2,4,8];

for k = 1:length(n1)
  subplot(2,2,k,'align');
  d = dvec(k);
  options = spset('GridType', 'Chebyshev', 'SparseIndices', 'on', ...
								'EnableDCT', 'off');
  timespvals(options,n1(k),d);
  options = spset('GridType', 'Chebyshev', 'SparseIndices', 'on');
  hold on
  timespvals(options,n2(k),d);
  hold on
  plot([1,1e7],[1e-4,1e3],'k-.')
  hold off
  title(['d = ' num2str(d)]);
  xlabel('');
  axis normal;
  h = get(gca,'Children');
  set(h(2),'LineStyle','--','LineWidth',1.5,'Marker','*','Color','r');
  set(h(3),'LineStyle','-','LineWidth',1.5,'Marker','+','Color','b');
  legend({'no DCT', 'with DCT', 'O(N)'},2);
  set(gca,'XTick',[1e1,1e2,1e3,1e4,1e5]);
  set(gca,'YTick',[1e-3,1e-2,1e-1,1e0,1e1,1e2,1e3,1e4]);
  set(gca,'XLim',[1e1,1e5])
end
hold off;
