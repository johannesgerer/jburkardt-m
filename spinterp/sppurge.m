function z = sppurge(z, options)
% SPPURGE   Purge sparse grid data
%    Z = SPPURGE(Z)  Marks indices that have corresp.
%    hierarchical surplus values larger than the default
%    drop tolerance [0, 100*eps]. The SPPURGE function
%    returns the same sparse grid interpolant data z, but
%    enhanced by a field purgeData that is used by
%    SPINTERP to only consider the marked indices in the
%    interpolation process, thus saving computing time.
%  
%    Z = SPPURGE(Z, OPTIONS)  OPTIONS must be an options
%    structure generated with SPSET. Only the value of
%    the DropTol property is used, which enables the user to 
%    set any absolute and relative drop tolerance to be used
%    by the purging algorithm.
%
%    See also: SPSET
	
% Author : Andreas Klimke
% Version: 1.1
% Date   : December 4, 2007

% Change log:
% V1.0   : February 1, 2006
%          Initial version
% V1.1   : December 4, 2007
%          Added Gauss-Patterson grid.

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

if nargin > 1
  % New user-demanded drop tolerance
  dropTol = spget(options, 'DropTol', 'auto');
  % Check if purge data is already present
  if isfield(z, 'dropTol')
    if dropTol == z.dropTol
      % do nothing
    else
      % Remove previous data; it is now invalid.
      if isfield(z,'purgeData')
        z = rmfield(z,'purgeData');
      end
    end
  end    
elseif isfield(z, 'dropTol')
  % Update of previously computed sppurge data
  dropTol = z.dropTol;
else
  % Use default drop tolerance.
  dropTol = 'auto';
end 
if isa(dropTol, 'char')
	if strcmpi(dropTol, 'off')
		dropTol = [0, 0];
	elseif strcmpi(dropTol, 'auto')
		dropTol = [0, 100*eps];
	else
		error('MATLAB:spinterp:badopt', ...
					['Unknown string value to DropTol property. Did you ' ...
           'accidentally quote the 1x2 drop tolerance vector?']);
	end
elseif isa(dropTol, 'double') 
	if length(dropTol) < 2
		error('MATLAB:spinterp:badopt', ...
					['DropTol must be either a string or a 1x2 double ' ...
					 'vector. See ''help spset'' for details.']);
	end
else
	error('MATLAB:spinterp:badopt', ...
				['DropTol must be either a string or a 1x2 double ' ...
				 'vector. See ''help spset'' for details.']);
end	

absdroptol = dropTol(1);
reldroptol = dropTol(2);

% Do nothing if drop tolerance is less than or equal to zero
if absdroptol <= 0 && reldroptol <= 0
 % Remove purge data if present
 if isfield(z,'purgeData')
   z = rmfield(z,'purgeData');
   z = rmfield(z,'dropTol');
 end
 return; 
end

gridtype = z.gridType;
d = z.d;

if isfield(z, 'indices');
	sparseIndices = 'on';
	indices = z.indices;
else
	sparseIndices = 'off';
end

% Set the currently used drop tolerance
z.dropTol = dropTol;

nout = size(z.vals,1);

if strcmpi(sparseIndices, 'off')
	switch lower(gridtype)
	 case 'clenshaw-curtis'
		getpointsmethod = @spgetnpointscc;
	 case 'maximum'
		getpointsmethod = @spgetnpointsm;
	 case 'noboundary'
		getpointsmethod = @spgetnpointsnb;
	 case 'chebyshev'
		getpointsmethod = @spgetnpointscc;
	 case 'gauss-patterson'
		getpointsmethod = @spgetnpointsnb;
	 otherwise
		error('MATLAB:spinterp:badopt', ...
					['Unknown grid type ''' gridtype '''.']);
	end
	if isfield(z, 'purgeData')
		nfrom = size(z.purgeData,2);
	else
		nfrom = 1;
		z.purgeData{1} = ones(1,nout,'uint8');
		% Omit level 0, since it is clear that there is some data
		% to be considered unless the objective function is f(x) = 0
	end
	nto = size(z.vals,2) - 1;
	% Do this with respect to all outupts
	for k = nfrom:nto
		seq = spgetseq(k,d);
		seqlength = size(seq,1);
		[totalpoints, npoints] = feval(getpointsmethod,seq);
		purgedata = zeros(seqlength,nout,'uint8');
		for l = 1:nout
			droptol = max((z.fevalRange(l,2)- ...
				z.fevalRange(l,1))*reldroptol, absdroptol);
			vals = z.vals{l,k+1};
			zid = uint32(1);
			for m = 1:seqlength
				endzid = zid + npoints(m);
				while zid < endzid
					if abs(vals(zid)) >= droptol
						purgedata(m,l) = 1;
						zid = endzid;
						break;
					else
						zid = zid + 1;
					end
				end
			end
		end
		z.purgeData{k+1} = purgedata;
	end
else
	npoints = z.indices.subGridPoints;
	addr    = z.indices.subGridAddr;
	if isfield(z, 'purgeData')
		idfrom = uint32(size(z.purgeData,1))+1;
	else
		idfrom = uint32(2);
		z.purgeData = ones(1,nout,'uint8');
		% Omit first index set, since it is clear that there is some data
		% to be considered unless the objective function is f(x) = 0
	end
	idto = uint32(size(npoints,1));
	if idto >= idfrom
		purgedata = [z.purgeData; zeros(idto-idfrom+1,nout,'uint8')];
		for l = 1:nout
			droptol = max((z.fevalRange(l,2)- ...
			z.fevalRange(l,1))*reldroptol, absdroptol);
			vals = z.vals{l};
			for m = idfrom:idto
				zid = addr(m);
				endzid = addr(m) + npoints(m);
				while zid < endzid
					if abs(vals(zid)) >= droptol
						purgedata(m,l) = 1;
						break;
					else
						zid = zid + 1;
					end
				end
			end
		end
		z.purgeData = purgedata;
	end
end
