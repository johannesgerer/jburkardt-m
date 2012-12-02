function cmpgrids(n,d)
% CMPGRIDS   Compares the three sparse grid types.
%    CMPGRIDS(N, D) Compares the maximum-norm-based grid, the
%    no-boundary-nodes grid and the Clenshaw-Curtis grid in d = 2
%    or d = 3 dimensions, level N. If N is omitted, N is taken to
%    4. If D is omitted, D is taken to 2.

% Author : Andreas Klimke, Universität Stuttgart
% Date   : Sep 24, 2003
% Version: 1.0
	
if nargin < 1, n = 4; end
if nargin < 2, d = 2; end

set(gcf,'Color',[1 1 1]);
subplot(1,3,1);
options = spset('GridType','Maximum');
plotgrid(n,d,options);
title('Maximum-norm-based grid');
xlabel(['Points: ' num2str(spdim(n,d,options)), ', Level: ' ...
				num2str(n)], 'HorizontalAlignment', 'center'); 
	
subplot(1,3,2);
options = spset('GridType','NoBoundary');
plotgrid(n,d,options);
title('No-boundary-nodes grid');
xlabel(['Points: ' num2str(spdim(n,d,options)), ', Level: ' ...
				num2str(n)], 'HorizontalAlignment', 'center'); 
subplot(1,3,3);
plotgrid(n,d);
title('Clenshaw-Curtis grid');
xlabel(['Points: ' num2str(spdim(n,d)), ', Level: ' ...
				num2str(n)], 'HorizontalAlignment', 'center'); 
