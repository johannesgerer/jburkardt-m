function ip = spinterpcc(d,z,y,levelseq,purgedata)
% SPINTERPCC   Multi-linear interpolation (Clenshaw-Curtis)
%    IP = SPINTERPCC(D,Z,Y,LEVELSEQ)  Computes the interpolated
%    values at [Y1, ..., YN] over the sparse grid for the given
%    sequence of index sets LEVELSEQ. Y may be a double array for
%    vectorized processing, with each row representing one
%    point. The sparse grid data must be given as an array Z
%    containing the hierarchical surpluses (computed with
%    SPVALS). Note that the sparse grid is always normalized to the
%    unit cube [0,1]^D, i.e., if the weights have been computed for
%    a different domain, the values Y have to be rescaled
%    accordingly. (Internal function)
	
% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.7
% Date   : February 3, 2006

% Change log:
% V1.0   : August 12, 2003
%          Initial release.
% V1.1   : Sep 11, 2003
%          Modified input of values to facilitate vectorized 
%          processing if called similar to a regular function.
% V1.2   : Sep 15, 2003
%          Function restores original array shape. 
% V1.3   : Sep 16, 2003
%          Added possibility of multiple output variables of the 
%          function to interpolate. 
% V1.4   : Sep 17, 2003
%          Corrected serious bug that gave wrong results for very
%          low n.
% V1.5   : Sep 24, 2003
%          Removed cell processing; this is now done by an external 
%          routine.
% V1.6   : January 24, 2006
%          Changed data types to operate on uint arrays
% V1.7   : February 3, 2006
%          Added droptol processing.

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------
	
ninterp = uint32(size(y,1));
ip = zeros(ninterp,1);

index2 = zeros(d,1,'uint32'); 
repvec = ones(d,1,'uint32');
level  = ones(d,1,'uint8');

% Conventional routine using levelseq as full array
% Get the number of levels
nlevels = uint32(size(levelseq,1));
	
if ~isempty(purgedata), purge = true; else purge = false; end
	
% index contains the index of the resulting array containing all
% subdomains of the level.
index = uint32(1);
	
for kl = 1:nlevels
	npoints = uint32(1);
	lval = uint8(0);
	for k = 1:d
		lval = levelseq(kl,k);
		level(k) = lval;
		if lval == 0
			repvec(k) = 1;
		elseif lval < 3
			repvec(k) = 2;
		else
			repvec(k) = 2^uint32(lval-1);
		end
		npoints = npoints * repvec(k);
		if k > 1
			repvec(k) = repvec(k) * repvec(k-1);
		end
	end
	
	% Skip subgrids with all surpluses below droptol.
	if purge
		if purgedata(kl) == 0
			index = index + npoints;
			continue;
		end
	end
	
	yt = 0;
	for k = 1:ninterp
		temp = 1;
		l = uint16(1);
		while l <= d
			lval = level(l);
			yt = y(k,l);
			
			% security test if yt is within a valid range.
			if yt < 0  || yt > 1
				if yt < 0 yt = 0; else yt = 1; end
				warning('MATLAB:spinterp:outOfRange', ...
								'Interpolated point is out of valid range.');
			end
			
			% Compute the scaling factor and the array position of
			% the weight
			if lval == 1
				if yt == 1
					index2(l) = 1;
				else
					xp = floor(yt * 2);
					if xp == 0
						temp = temp * 2 * (0.5 - yt);
					else
						temp = temp * 2 * (yt - 0.5);
					end
					index2(l) = xp;
				end
			elseif lval == 0
				index2(l) = 0;
			elseif yt == 1
				temp = 0;
				break;
			else
				scale = 2^double(lval);
				xp = floor(yt * scale / 2);
				temp = temp * ...
							 (1 - scale * abs( yt - ( (xp*2+1)/scale )));
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
