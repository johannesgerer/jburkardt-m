function ip = spinterpnb(d,z,y,levelseq)
% SPINTERPNB   Multi-linear interpolation for no-boundary-nodes grid.
%    IP = SPINTERPM(D,Z,Y,LEVELSEQ)  Computes the interpolated
%    values at [Y1, ..., YN]  over the sparse grid for a given
%    sequence of index sets LEVELSEQ.  Y may be a double array for
%    vectorized processing, with each row representing one
%    point. The sparse grid data must be given  as an array Z
%    containing the hierarchical surpluses (computed with
%    SPVALS). Note that the sparse grid is always normalized to the
%    unit cube [0,1]^D, i.e., if the weights have been computed for
%    a different domain, the values Y have to be rescaled
%    accordingly.
		
% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.1
% Date   : August 25, 2004

% Change log:
% V1.0   : Sep 24, 2003 
%          Initial release.
% V1.1   : Aug 25, 2004
%          Modified calling syntax for more generality.

ninterp = size(y,1);
ip = zeros(ninterp,1);
	
% Get the number of levels
nlevels = size(levelseq,1);
	
% index contains the index of the resulting array containing all
% subdomains of the level.
index = 1;

index2 = zeros(d,1); 
repvec = ones(d,1);
level = ones(d,1);

for kl = 1:nlevels
	npoints = 1;
	lval = 0;
	for k = 1:d
		lval = levelseq(kl,k);
		level(k) = lval;
		repvec(k) = 2^lval;
		npoints = npoints * repvec(k);
		if k > 1
			repvec(k) = repvec(k) * repvec(k-1);
		end
	end
	yt = 0;
	
	for k = 1:ninterp
		temp = 1;
		l = 1;
		while l <= d
			lval = level(l);
			yt = y(k,l);
			
			% Compute the scaling factor and the array position of
			% the weight
			if lval == 0
				index2(l) = 0;
			else
				scale = 2^lval;
				if yt == 1
					xp = scale-1;
				else
					xp = floor(yt * scale);
				end
				if xp == 0
					temp = temp * ...
								 (1 - 2 * scale * ( yt - (xp+0.5)/scale));						
				elseif xp == scale - 1
					temp = temp * ...
								 (1 + 2 * scale * ( yt - (xp+0.5)/scale));						
				else						
					temp = temp * ...
								 (1 - 2 * scale * abs( yt - (xp+0.5)/scale));
				end
				index2(l) = xp;
			end
			l = l + 1;
			if temp == 0
				break;
			end
		end
		
		% If the scaling factor is not Zero, add the computed value
		if temp > 0
			index3 = index + index2(1);
			for l = 2:d
				index3 = index3 + repvec(l-1)*index2(l);
			end
			ip(k) = ip(k) + temp*z(index3);
		end
	end
	index = index + npoints;
end

