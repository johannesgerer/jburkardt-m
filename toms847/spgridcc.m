function x = spgridcc(levelseq, d)
% SPGRIDCC   Computes the Clenshaw-Curtis sparse grid points in
% each coordinate direction. 
%    X = SPGRIDCC(LEVELSEQ, D)  Computes the sparse grid points for
%    the given sequence of index sets LEVELSEQ and dimension D. The
%    coordinate value of dimension i is stored in column i of the
%    matrix X. One row of matrix X represents one grid point.
	
% Author : Andreas Klimke
% Version: 1.1
% Date   : April 20, 2004

% Change log:
% V1.0   : July 30, 2003
%          Initial version
% V1.1   : April 20, 2004
%          Altered function header and simplified code.
	
% Get the number of levels
nlevels = size(levelseq,1);

% Compute number of points
totalpoints = spseqdimcc(levelseq,d);

% index contains the index of the resulting array containing all
% subdomains of the level.
index = 1;

x = zeros(totalpoints,d);

for kl = 1:nlevels
	level = levelseq(kl,:);
	for i = 1:d
		% compute the points, scaled to [0,1]
		if level(i) == 0
			% take the interval bounds if the level is zero
			c = 0.5;
		elseif level(i) == 1
			c = [0; 1];
		else
			c = ( ( ( (1:2^(level(i)-1)) *2 ) -1).*2^(-level(i)))';
		end
		% Compute the number of grid points per dimension, store it
		% in repvec.
		repvec = ones(1,d);
		for k = 1:d
			if level(k) == 0
				% repvec(k) = 1;
			elseif level(k) < 3
				repvec(k) = 2;
			else
				repvec(k) = 2^(level(k)-1);
			end
		end
		npoints = prod(repvec);
		repvec(i) = 1;
		c = repmat(shiftdim(c, 1-i), repvec);
		x(index:index+npoints-1,i) = c(:);
	end
	index = index + npoints;
end

% -----------------------------------------------------------------
function n = spseqdimcc(levelseq, d)
% SPSEQDIMCC   Compute number of grid points for given sequence of
% index sets.

% Author : Andreas Klimke
% Version: 1.0
% Date   : April 20, 2004

n = 0;
for k = 1:size(levelseq,1);
	ntemp = 1;
	for l = 1:d
		lev = levelseq(k,l);
		if lev == 0
			continue;
		elseif lev <= 2
			ntemp = ntemp * 2;
		else
			ntemp = ntemp * 2^(lev-1);
		end
	end
	n = n + ntemp;
end
