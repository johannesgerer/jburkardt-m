function z = spvals(f, d, range, options, varargin)
% SPVALS   Computes the sparse grid surpluses of a function FUN.
%    Z = SPVALS(FUN, D) computes the sparse grid surpluses required
%    for multi-linear sparse grid interpolation of the function
%    FUN. The grid is computed over the d-dimensional unit cube
%    [0,1]^D.
%
%    Z = SPVALS(FUN, D, RANGE) In addition to the syntax above, the
%    interpolation box dimensions may be specified. RANGE is a 2 x
%    D array, e.g. to compute the sparse grid representation over
%    the domain [0,1]x[2,4]x[1,5] of f, RANGE must be [0 1; 2 4; 1
%    5]. If RANGE is empty (=[]), it is assumed to be [0,1]^D.
% 
%    Z = SPVALS(FUN, D, RANGE, OPTIONS) computes the sparse grid
%    representation as above, but with default interpolation
%    properties replaced by values in OPTIONS, an argument created
%    with the SPSET function. See SPSET for details. A commonly used
%    option is the scalar relative error tolerance 'RelTol' (1e-2
%    by default).
%
%    Z = SPVALS(FUN, D, RANGE, OPTIONS, P1, P2, ...) passes the
%    parameters P1, P2, ... to the objective function FUN.
%
%    See also SPGRID, SPVALS, SPSET, SPDIM. 

% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.3
% Date   : December 22, 2005

% Change log:
% V1.0    : September 24, 2003
%           Initial version
% V1.1    : January 27, 2004
%           Corrected bug with PrevResults option- now correctly
%           uses previously computed results. Added "KeepGrid" and
%           "KeepFunctionValues" options for later use.
% V1.2    : August 25, 2004
%           Use separate, improved algorithms computation of
%           hierarchical surpluses.
% V1.3    : Changed code to remove "Struct field assignment
%           overwrites a value with class "cell" warning occurring
%           in Matlab verion 7.
	
if nargin < 3, range = []; end
if nargin < 4, options = []; end
if nargin < 5, varargin = {}; end

vectorized = spget(options, 'Vectorized', 'off');
zprev = spget(options, 'PrevResults');
varpos = spget(options, 'VariablePositions');
nresults = spget(options, 'NumberOfOutputs', 1);
nmax = spget(options, 'MaxDepth', 8);
nmin = spget(options, 'MinDepth', 2);
reltol = spget(options, 'RelTol', 1e-2);
abstol = spget(options, 'AbsTol', 1e-6);
gridtype = spget(options, 'GridType', 'Clenshaw-Curtis');
functionArgType = spget(options, 'FunctionArgType', 'list');
keepFunctionValues = spget(options, 'KeepFunctionValues', 'off');
keepGrid = spget(options, 'KeepGrid', 'off');

if strcmp(lower(gridtype), 'clenshaw-curtis')
	ipmethod = 'spcmpvalscc';
	gridgen = 'spgridcc';
elseif strcmp(lower(gridtype), 'maximum')
	ipmethod = 'spcmpvalsm';
	gridgen = 'spgridm';
elseif strcmp(lower(gridtype), 'noboundary')
	ipmethod = 'spcmpvalsnb';
	gridgen = 'spgridnb';
else
	error('MATLAB:spinterp:badopt',['Unknown grid type ''' gridtype '''.']);
end

if isempty(zprev)
	nmaxprev = 0;
	zmin = inf.*ones(nresults,1);
	zmax = -inf.*ones(nresults,1);
	xmin = zeros(nresults,d);
	xmax = zeros(nresults,d);
else
	nmaxprev = zprev.maxLevel + 1;
	if nmax < nmaxprev
		warning('MATLAB:spinterp:badopt', ...
					['New maximum level is equal or less than previous maximum' ...
					 ' level. Setting interpolation depth to this new maximum' ...
					 ' level, but keeping previous results.']); 
		z = zprev;
		z.interpDepth = nmax;
		return;
	end
	z = zprev.vals;
	gridtype = zprev.gridType;
	if isfield(zprev, 'fvals')
		y = zprev.fvals;
	end
	if isfield(zprev, 'grid')
		x = zprev.grid;
	end
	zmin = zprev.fevalRange(:,1);
	zmax = zprev.fevalRange(:,2);
	xmin = zprev.minGridVal;
	xmax = zprev.maxGridVal;
end

% shift the interpolation parameters to the right position, and
% fill field up with any parameters in varargin.
if ~isempty(varpos)
	val = cell(1,d+length(varargin));
	for l = 1:d
		val{varpos(l)} = 1;
	end
	m = 1;
	if length(varargin) > 0
		for l = 1:d+length(varargin)
			if isempty(val{l})
				val{l} = varargin{m};
				m = m + 1;
			end
		end
	end
else
	val = varargin;
end

maxsurplus = zeros(nresults,1);
success = 0;
accuracy = inf;

fevalTime = 0;
surplusCompTime = 0;
for k = nmaxprev:nmax
	t0 = clock;
	levelseq = spgetseq(k,d);
	[z(1:nresults,k+1),x{k+1}] = ...
			spevalf(gridgen, f, levelseq, d, range, varpos, ...
							vectorized, nresults, functionArgType, val{:}); 
	
	if strcmp(lower(keepFunctionValues), 'on')
		y(1:nresults,k+1) = z(:,k+1);
	end
	fevalTime = fevalTime + etime(clock,t0);
	for l = 1:nresults
		[temp, id] = min(z{l,k+1}(:));
		if temp < zmin(l) 
			zmin(l) = temp;
			xmin(l,:) = x{k+1}(id,:);
		end
		[temp, id] = max(z{l,k+1}(:));
		if temp > zmax(l)
			zmax(l) = temp;
			xmax(l,:) = x{k+1}(id,:);
		end
	end
	if k>0
		nsurpluses = size(x{k+1},1);
		t0 = clock;
		for l = 1:nresults
			ip = zeros(nsurpluses, 1);
			for m = 0:k-1
				oldlevelseq = spgetseq(m,d);
				ip = ip + feval(ipmethod, d, z{l,m+1}, x{k+1}, ...
												levelseq, oldlevelseq);
			end
			z{l,k+1} = z{l,k+1} - ip;
		end
		surplusCompTime = surplusCompTime + etime(clock,t0);
		for l = 1:nresults
			maxsurplus(l) = max(abs(z{l,k+1}(:)));
		end
		
		% compute relative accuracy
		if (zmax-zmin) > 0
			accuracy = max(maxsurplus./(zmax-zmin));
		else
			accuracy = inf;
		end
		
		% break if desired relative accuracy is reached, of if desired
    % absolute tolerance is reached, but only if the minimum number
    % of levels have been computed.
		if accuracy <= reltol | max(maxsurplus) <= abstol
			success = 1;
			if k >= nmin
				break;
			end
		end
	end
end

% Display warning if error tolerance was not reached.
if ~success
	warning('MATLAB:spinterp:insufficientDepth', ...
					['MaxDepth = ' num2str(nmax) ' reached before accuracies' ...
					 ' RelTol = ' num2str(reltol) ' or AbsTol = ' num2str(abstol) ...
					 ' were achieved.\nThe current' ...  
					 ' estimated relative accuracy is ' num2str(accuracy) '.']); 
end

npoints = 0;
for l = 0:k
	npoints = npoints + length(z{1,l+1});
end

% Store results in structure
ztemp = z;
clear z;
z.vals = ztemp;
z.gridType = gridtype;
z.d = d;
z.range = range;
z.maxLevel = k;
z.estRelError = accuracy;
z.fevalRange = [zmin zmax];
z.minGridVal = xmin;
z.maxGridVal = xmax;
z.nPoints = npoints;
z.fevalTime = fevalTime;
z.surplusCompTime = surplusCompTime;

if strcmp(lower(keepFunctionValues), 'on')
	z.fvals = y;
end
if strcmp(lower(keepGrid), 'on')
	for k = nmaxprev:nmax
		for l = 1:d
			% Rescale sparse grid to actual range
			x{k+1}(:,l) = range(l,1) + (range(l,2)-range(l,1)).*x{k+1}(:,l);
		end
	end
	z.grid = x;
end
