function h = plotgrid(n,d,options)
% PLOTGRID   Plots the sparse grid.
%    PLOTGRID(N,D) Plots the sparse grid points of dimension D = 2
%    or D = 3 up to level N. Returns a handle H to 
%    
%    PLOTGRID(N,D,OPTIONS) Plots as above, but with default grid
%    type replaced by the grid type specified in OPTIONS, an
%    argument created with the SPSET function. See SPSET for
%    details.  
%
%    PLOTGRID returns a column vector of handles to the grid objects.

% Author : Andreas Klimke, Universität Stuttgart
% Date   : Aug 25, 2004
% Version: 1.1
	
if nargin ~= 2 & nargin ~= 3
	error(['Wrong number of arguments. Please see ''help plotgrid''' ...
				 ' for usage information.']);
end

if nargin < 3, options = []; end

holdstate = ishold;
hvec = [];

switch d
 case 2
	for k = 0:n
		x = spgrid(k,2,options);
		th = plot(x(:,1),x(:,2),'k.');
		hvec = [hvec; th];
		axis equal;
		axis([0 1 0 1]);
		hold on;
	end
 case 3
	for k = 0:n
		x = spgrid(k,3,options);
		th = plot3(x(:,1),x(:,2),x(:,3),'k.');
		hvec = [hvec; th];
		axis equal;
		axis([0 1 0 1 0 1]);
		hold on;
	end
 otherwise
	error(['Invalid parameter d = ' num2str(d) '.']);
end

if ~holdstate, hold off; end
if nargout == 1, h = hvec; end
