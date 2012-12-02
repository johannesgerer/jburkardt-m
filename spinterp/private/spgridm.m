function x = spgridm(levelseq)
% SPGRIDM  Compute grid points, maximum-norm-based grid
%    X = SPGRIDM(LEVELSEQ,D)  Computes the sparse grid points for
%    the given sequence of index LEVELSEQ and problem dimension D. 
%    The coordinate value of dimension i is stored in column i of
%    the matrix X. One row of matrix X represents one grid point.
%    (Internal function)

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.2
% Date   : January 24, 2006
	
% Change log:
% V1.0   : Sep 24, 2003
% V1.1   : April 21, 2004
%          Altered function header to enable dimension-adaptive
%          grids. Simplified code.
% V1.2   : January 24, 2006
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

npoints = zeros(nlevels,1,'uint32');

% Initialize sp with the total number of grid points of the
% level.
% Compute number of points
totalpoints = uint32(0);
for k = 1:nlevels;
	ntemp = uint32(1);
	for l = 1:d
		lev = levelseq(k,l);
		if lev == 0
			ntemp = ntemp * 3;
		else
			ntemp = ntemp * 2^uint32(lev);
		end
	end
	npoints(k) = ntemp;
	totalpoints = totalpoints + ntemp;
end
	
% index contains the index of the resulting array containing all
% subdomains of the level.
index = uint32(1);
	
x = zeros(totalpoints,d);
	
for kl = 1:nlevels
	level = double(levelseq(kl,:));
	for i = 1:d
		% compute the points, scaled to [0,1]
		if level(i) == 0
			c = [0; 0.5; 1];
		else
			c = (((1:2:(2^level(i).*2))).*2^(-1-level(i)))';
		end

		% Compute the number of grid points per dimension, store it
		% in repvec. The funny (level == 0) statement makes sure that
		% each level 0 dimension is counted as three.
		repvec = [2.^level+(level == 0).*2]';
		npoints = prod(repvec);
		repvec(i) = 1;
		c = repmat(shiftdim(c, 1-double(i)), repvec);
		x(index:index+npoints-1,i) = c(:);
	end
	index = index + npoints;
end
