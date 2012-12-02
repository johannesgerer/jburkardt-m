function z = spvals(f, d, range, options, varargin)
% SPVALS   Construct a sparse grid interpolant
%    Z = SPVALS(FUN, D) Compute the sparse grid representation Z
%    for multi-linear sparse grid interpolation of the function
%    FUN. The grid is computed over the d-dimensional unit cube
%    [0,1]^D.
%
%    Z = SPVALS(FUN, D, RANGE) In addition to the syntax above, the
%    interpolation box dimensions may be specified. RANGE is a 2 x
%    D array, e.g. to compute the sparse grid representation over
%    the domain [0,1]x[2,4]x[1,5] of FUN, RANGE must be [0 1; 2 4; 1
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

% Author : Andreas Klimke
% Version: 1.9
% Date   : November 18, 2007

% Change log:
% V1.0   : September 24, 2003
%          Initial version
% V1.1   : January 27, 2004
%          Corrected bug with PrevResults option- now correctly
%          uses previously computed results. Added "KeepGrid" and
%          "KeepFunctionValues" options for later use.
% V1.2   : April 22, 2004
%          Added possibility for dimension-adaptive grids.
% V1.3   : June 15, 2004
%          Added Chebyshev grid.
% V1.4   : March 10, 2005
%          Added processing of sparse index arrays. This
%          significantly improves the computational complexity for
%          higher-dimensional sparse grids.
% V1.5   : June 12, 2005
%          Corrected bug regarding grid scaling w/ non-sparse
%          indices (forgot to update code accordingly).
% V1.6   : September 02, 2005
%          Altered structure assignment to avoid warning in new 
%          Matlab release R14SP2. 
% V1.7   : September 05, 2005
%          Removed bug with levelseq initialization in case of sparse
%          index sets.
% V1.8   : February 2, 2006
%          Added DropTol processing
% V1.9   : November 18, 2007
%          Added new grid type : Gauss-Patterson
	
% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

% Ensure that d is of type uint16
d = uint16(d);

if nargin < 3, range = []; end
if nargin < 4, options = []; end
if nargin < 5, varargin = {}; end

% Check if dimension-adaptive sparse grid interpolation is
% requested. In this case, call SPADAPTVALS instead.
dimadaptive = spget(options, 'DimensionAdaptive', 'off');
zprev = spget(options, 'PrevResults');
if strcmpi(dimadaptive, 'on')
	z = spadaptvals(f, d, range, options, varargin{:});
	
  % Update purge date if present
	if isfield(zprev, 'purgeData')
		z.purgeData = zprev.purgeData;
  	z = sppurge(z);
	end
	return;
end

vectorized = spget(options, 'Vectorized', 'off');
varpos = spget(options, 'VariablePositions');
nresults = spget(options, 'NumberOfOutputs', 1);
gridtype = spget(options, 'GridType', 'Clenshaw-Curtis');
if strcmpi(gridtype, 'gauss-patterson') 
	nmax = spget(options, 'MaxDepth', uint8(6));
	if nmax > 6
		warning('MATLAB:spinterp:badopt',['Maximum supported depth ' ...
		  'level for the Gauss-Patterson grid is 6, but MaxDepth ' ...
			'was set to ' num2str(nmax) '. Using MaxDepth = 6 instead.']);
		nmax = uint8(6);
	end
elseif strcmpi(gridtype, 'chebyshev')
  nmax = spget(options, 'MaxDepth', uint8(8));
	if nmax > 10
		warning('MATLAB:spinterp:badopt',['Maximum supported depth ' ...
		  'level for the Chebyshev grid is 10, but MaxDepth ' ...
			'was set to ' num2str(nmax) '. Using MaxDepth = 10 instead.']);
		nmax = uint8(10);
	end
else
  nmax = spget(options, 'MaxDepth', uint8(8));
end

nmin = spget(options, 'MinDepth', uint8(2));
reltol = spget(options, 'RelTol', 1e-2);
abstol = spget(options, 'AbsTol', 1e-6);
functionArgType = spget(options, 'FunctionArgType', 'list');
keepFunctionValues = spget(options, 'KeepFunctionValues', 'off');
keepGrid = spget(options, 'KeepGrid', 'off');
sparseIndices = spget(options, 'SparseIndices', 'auto');
enableDCT = spget(options, 'EnableDCT', 'on');

maxarraysize = 1e6; % Maximum number of doubles to allocate at a
                    % time for the grid points

dosparse = false;
switch lower(gridtype)
 case 'clenshaw-curtis'
	if strcmpi(sparseIndices, 'off')
		ipmethod = 'spcmpvalscc';
		gridgen = 'spgridcc';
	else
		ipmethod = 'spcmpvalsccsp';
		gridgen = 'spgridccsp';
		dosparse = true;
		x = [];
		y = cell(1,nresults);
	end
 case 'maximum'
	ipmethod = 'spcmpvalsm';
	gridgen = 'spgridm';
 case 'noboundary'
	ipmethod = 'spcmpvalsnb';
	gridgen = 'spgridnb';
 case 'chebyshev'
	if strcmpi(sparseIndices, 'off')
		if strcmpi(enableDCT, 'off')
			ipmethod = 'spcmpvalscb';
		else
			ipmethod = 'spcmpvalscbdct';
		end
		gridgen = 'spgridcb';
	else
		if strcmpi(enableDCT, 'off')
			ipmethod = 'spcmpvalscbsp';
		else
			ipmethod = 'spcmpvalscbspdct';
		end			
		gridgen = 'spgridcbsp';
		dosparse = true;
		x = [];
		y = cell(1,nresults);
	end
 case 'gauss-patterson'
	if strcmpi(sparseIndices, 'off')
		ipmethod = 'spcmpvalsgp';
		gridgen = 'spgridgp';
	else
		ipmethod = 'spcmpvalsgpsp';
		gridgen = 'spgridgpsp';
		dosparse = true;
		x = [];
		y = cell(1,nresults);
	end
 otherwise
	error('MATLAB:spinterp:badopt',['Unknown grid type ''' gridtype '''.']);
end

if isempty(zprev)
	nmaxprev = uint8(0);
	zmin = inf.*ones(nresults,1);
	zmax = -inf.*ones(nresults,1);
	xmin = zeros(nresults,d);
	xmax = zeros(nresults,d);
	fevalTime = 0;
	surplusCompTime = 0;
	npoints = uint32(0);
  levelseq = [];
else
	
	% If previous grid is dimension-adaptive, call other routine
	if isfield(zprev, 'dimAdapt')
		z = spadaptvals(f, d, range, options, varargin{:});
		return;
	end
		
	if zprev.maxLevel == nmax
		% nothing to do!
		z = zprev;
		return;
	end
	nmaxprev = zprev.maxLevel + 1;
	
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
	fevalTime = zprev.fevalTime;
	surplusCompTime = zprev.surplusCompTime;
	npoints = zprev.nPoints;
  
  if dosparse
    levelseq = zprev.indices;
  end
end

% shift the interpolation parameters to the right position, and
% fill field up with any parameters in varargin.
val = posvars(d, varpos, varargin{:});

success = 0;
accuracy = inf;

if ~dosparse
	% Compute the hierarchical surpluses without sparse index sets and
  % without storing the neighbors
	
	for k = nmaxprev:nmax
		maxsurplus = zeros(nresults,1);
		
		t0 = clock;
		levelseq = spgetseq(k,d,options);
		[z(1:nresults,k+1),x{k+1}] = ...
				spevalf(gridgen, f, levelseq, d, [], range, varpos, ...
								vectorized,nresults,functionArgType,val{:}); 
		if strcmpi(keepFunctionValues, 'on')
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
		npoints = npoints + size(x{k+1},1);
		if k > 0
			nsurpluses = size(x{k+1},1);
			t0 = clock;
			for l = 1:nresults
				ip = zeros(nsurpluses, 1);
				for m = uint8(0):k-1
					oldlevelseq = spgetseq(m,d,options);
					ip = ip + feval(ipmethod, d, z{l,m+1}, x{k+1}, ...
					 								levelseq, oldlevelseq);
				end
				z{l,k+1} = z{l,k+1} - ip;
			end
			surplusCompTime = surplusCompTime + etime(clock,t0);
		end
		
		if strcmpi(keepGrid, 'on')
			% Rescale sparse grid to actual range
			for l = 1:d
				x{k+1}(:,l) = range(l,1)+(range(l,2)-range(l,1)).*x{k+1}(:,l);
			end
		end
		
		for l = 1:nresults
			maxsurplus(l) = max(abs(z{l,k+1}(:)));
		end
		
		if k > 0
			% compute relative accuracy
			if all(zmax-zmin) > 0
				accuracy = max(maxsurplus./(zmax-zmin));
			else
				accuracy = inf;
			end
			
			if strcmpi(gridtype, 'chebyshev')
				for l = 1:nresults
					z{l,k+1} = reordervals(z{l,k+1},levelseq);
				end
			end
			
			% break if desired relative accuracy is reached, of if desired
			% absolute tolerance is reached, but only if the minimum number
			% of levels have been computed.
			if accuracy <= reltol || max(maxsurplus) <= abstol
				success = 1;
				if k >= nmin
					break;
				end
			end
		end
	end
else
	
	% Compute the hierarchical surpluses using sparse index sets and
  % neighbor information
	for k = nmaxprev:nmax
		t0 = clock;
		levelseq = spgetseq(k,d,spset('PrevResults', levelseq, ...
																	'GridType', gridtype, ...
																	'SparseIndices', 'on'));
		fevalTime = fevalTime + etime(clock,t0);

		maxsurplus = zeros(nresults,1);
	
		lastnewindex = uint32(size(levelseq.indicesNDims,1));
		currentindex = levelseq.currentindex;
	
		while currentindex <= lastnewindex
			t0 = clock;
			firstnewindex = currentindex;
			nodearraysize = 0;
			while nodearraysize <= maxarraysize
				nodearraysize = nodearraysize + ...
						double(levelseq.subGridPoints(currentindex)) * d;
				currentindex = currentindex + 1;
				if currentindex > lastnewindex
					break;
				end
			end
			[znew(1:nresults,1),xnew] = ...
					spevalf(gridgen, f, levelseq, d, ...
									[firstnewindex currentindex-1], ...
									range, varpos, vectorized, nresults, ...
									functionArgType,val{:}); 
			
			npoints = npoints + size(xnew,1);
			if strcmpi(keepFunctionValues, 'on')
				for l = 1:nresults
					y{l} = [y{l}; znew{l}];
				end
			end
			
			if strcmpi(keepGrid, 'on')
				% Rescale sparse grid to actual range
				xnew2 = xnew;
				for l = 1:d
					xnew2(:,l) = range(l,1)+(range(l,2)-range(l,1)).*xnew2(:,l);
				end
				x = [x; xnew2];
			end
			
			fevalTime = fevalTime + etime(clock,t0);
			for l = 1:nresults
				[temp, id] = min(znew{l}(:));
				if temp < zmin(l) 
					zmin(l) = temp;
					xmin(l,:) = xnew(id,:);
				end
				[temp, id] = max(znew{l}(:));
				if temp > zmax(l)
					zmax(l) = temp;
					xmax(l,:) = xnew(id,:);
				end
			end
			if k > 0
				t0 = clock;
				for l = 1:nresults
					znew{l} = znew{l} - feval(ipmethod, d, z{l}, xnew, ...
																		levelseq, firstnewindex, ...
																		currentindex-1);			
				end
				surplusCompTime = surplusCompTime + etime(clock,t0);
			end	
			
			for l = 1:nresults
				maxsurplus(l) = max(maxsurplus(l),max(abs(znew{l}(:))));
			end
			
			if k > 0
				% compute relative accuracy
				if all(zmax-zmin) > 0
					accuracy = max(maxsurplus./(zmax-zmin));
				else
					accuracy = inf;
				end
				
				if strcmpi(gridtype, 'chebyshev')
					for l = 1:nresults
						znew{l} = reordervals(znew{l},levelseq, firstnewindex, ...
																	currentindex-1);
					end
				end
				
				for l = 1:nresults
					z{l} = [z{l}; znew{l}];
				end
			else
				z = znew;
			end
		end
	
		% break if desired relative accuracy is reached, of if desired
		% absolute tolerance is reached, but only if the minimum number
		% of levels have been computed.
		if k > 0
			if accuracy <= reltol || max(maxsurplus) <= abstol
				success = 1;
				if k >= nmin
					break;
				end
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

% Store results in structure
ztemp = z;
clear z;
z.vals = ztemp;
z.gridType = gridtype;
z.d = d;
z.range = range;
z.maxLevel = k;
z.estRelError = accuracy;
z.estAbsError = max(maxsurplus);
z.fevalRange = [zmin zmax];
z.minGridVal = xmin;
z.maxGridVal = xmax;
z.nPoints = npoints;
z.fevalTime = fevalTime;
z.surplusCompTime = surplusCompTime;

% Store index information if sparse index sets are used
if dosparse, z.indices = levelseq; end

% Update purge data if it is present
if isfield(zprev, 'purgeData')
  z.purgeData = zprev.purgeData;
  z = sppurge(z);
end

if strcmpi(keepFunctionValues, 'on')
	z.fvals = y;
end
if strcmpi(keepGrid, 'on')
	z.grid = x;
end
