function x = spgridcc(levelseq)
% SPGRIDCC   Compute grid points, Clenshaw-Curtis grid 
%    X = SPGRIDCC(LEVELSEQ)  Computes the sparse grid points for
%    the given sequence of index sets LEVELSEQ. The coordinate
%    value of dimension i is stored in column i of the matrix
%    X. One row of matrix X represents one grid point. 
%    (Internal function)
	
% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.3
% Date   : January 24, 2005

% Change log:
% V1.0   : July 30, 2003
%          Initial version
% V1.1   : April 20, 2004
%          Altered function header to enable dimension-adaptive
%          grids. Simplified code.
% V1.2   : March 09, 2005
%          Improved efficiency of code for higher-dimensional grid
%          data.
% V1.3   : January 24, 2006
%          Changed data types to operate on uint arrays
	
% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

% Get the number of levels
nlevels = uint32(size(levelseq,1));

% Get the dimension
d = uint16(size(levelseq,2));

npoints = zeros(nlevels, 1, 'uint32');
dim = zeros(d,1,'uint16');

% Compute number of points
totalpoints = uint32(0);
for k = 1:nlevels;
	ntemp = uint32(1);
	for l = 1:d
		lev = uint32(levelseq(k,l));
		if lev == 0
			continue;
		elseif lev <= 2
			ntemp = ntemp * 2;
		else
			ntemp = ntemp * 2^(lev-1);
		end
	end
	npoints(k) = ntemp;
	totalpoints = totalpoints + ntemp;
end
	
% index contains the index of the resulting array containing all
% subdomains of the level.
index = 1;
	
x = 0.5*ones(totalpoints,d);
	
for kl = 1:nlevels
	c = {};
	ndims = uint8(0);
	for k = 1:d
		% compute the points, scaled to [0,1]
		lev = double(levelseq(kl, k));
		if lev == 0
			continue;
		elseif lev == 1
			ndims = ndims + 1;
			c{ndims} = [0; 1];
		else
			ndims = ndims + 1;
			c{ndims} = ( ( ( (1:2^(lev-1)) *2 ) -1).*2^(-lev))';
		end
		dim(ndims) = k;
	end
	if ndims > 1
		[c{:}] = ndgrid(c{:});
	end
	for k = 1:ndims
		x(index:index+npoints(kl)-1,dim(k)) = c{k}(:);
	end
	index = index + npoints(kl);
end
