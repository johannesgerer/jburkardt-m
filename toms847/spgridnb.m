function x = spgridnb(levelseq, d)
% SPGRIDNB   Computes the sparse grid points (without boundary) in
% each coordinate direction.
%    X = SPGRIDNB(LEVELSEQ,D)  Computes the sparse grid points for
%    the given sequence of index LEVELSEQ and problem dimension D. 
%    The coordinate value of dimension i is stored in column i of
%    the matrix X. One row of matrix X represents one grid point.
	
% Author : Andreas Klimke
% Version: 1.1
% Date   : April 21, 2004

% Change log:
% V1.0   : Sep 25, 2003
%          Initial version
% V1.1   : April 21, 2004
%          Altered function header and simplified code.

% Get the number of levels
nlevels = size(levelseq,1);
	
% Initialize sp with the total number of grid points of the
% level.
totalpoints = spseqdimnb(levelseq,d);
	
% index contains the index of the resulting array containing all
% subdomains of the level.
index = 1;
	
x = zeros(totalpoints,d);
	
for kl = 1:nlevels
	level = levelseq(kl,:);
	for i = 1:d
		% compute the points, scaled to [0,1]
		if level(i) == 0
			c = 0.5;
		else
			c = (((1:2:(2^level(i).*2))).*2^(-1-level(i)))';
		end

		% Compute the number of grid points per dimension, store it
		% in repvec.
		repvec = [2.^level];
		npoints = prod(repvec);
		repvec(i) = 1;
		c = repmat(shiftdim(c, 1-i), repvec);
		x(index:index+npoints-1,i) = c(:);
	end
	index = index + npoints;
end

% ----------------------------------------------------------------
function n = spseqdimnb(levelseq, d)
% SPSEQDIMNB   Compute number of grid points for given sequence of
% index sets.

% Author : Andreas Klimke
% Version: 1.0
% Date   : April 20, 2004

n = 0;
for k = 1:size(levelseq,1);
	ntemp = 1;
	for l = 1:d
		ntemp = ntemp * 2^levelseq(k,l);
	end
	n = n + ntemp;
end

