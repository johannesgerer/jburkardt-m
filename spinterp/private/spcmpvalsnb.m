function ip = spcmpvalsnb(d,z,y,newlevelseq,levelseq)
% SPCMPVALSNB   Compute hierarchical surpluses, no-boundary-nodes grid
%    (internal function)
	
% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.2
% Date   : January 24, 2006
	
% Version history:
% V1.0   : July 14, 2004
%          Initial release.
% V1.1   : June 9, 2005
%          Corrected bug, inititialization of nnewpoints used command
%          'size' instead of 'zeros'.
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

ninterp = uint32(size(y,1));
ip = zeros(ninterp,1);

% Get the number of new levels
nnewlevels = uint32(size(newlevelseq, 1));
nnewpoints = zeros(nnewlevels,1,'uint32');
	
% Get the number of old levels
nlevels = uint32(size(levelseq,1));
	
% index contains the index of the resulting array containing all
% subdomains of the level.
index = uint32(1);

index2 = zeros(d,1,'uint32'); 
repvec = ones(d,1,'uint32');
level = ones(d,1,'uint8');

% Compute the number of points per subdomain of new levels
for kl = 1:nnewlevels
	npoints = uint32(1);
	for k = 1:d
		npoints = npoints * 2^uint32(newlevelseq(kl,k));
	end
	nnewpoints(kl) = npoints;
end	

for kl = 1:nlevels
	npoints = uint32(1);
	lval = uint8(0);
	for k = 1:d
		lval = levelseq(kl,k);
		level(k) = lval;
		repvec(k) = 2^uint32(lval);
		npoints = npoints * repvec(k);
		if k > 1
			repvec(k) = repvec(k) * repvec(k-1);
		end
	end

	k = uint32(0);
	yt = 0;
	for nkl = 1:nnewlevels
		skiplevel = 0;
		for l = 1:d
			if level(l) > newlevelseq(nkl,l)
				skiplevel = 1;
				break;
			end
		end
		kend = k + nnewpoints(nkl);
		
		if ~skiplevel
			while k < kend
				k = k + 1;
				temp = 1;
				l = uint16(1);
				while l <= d
					lval = level(l);
					yt = y(k,l);
					
					% Compute the scaling factor and the array position of
					% the weight
					if lval == 0
						index2(l) = 0;
					else
						scale = 2^double(lval);
						xp = floor(yt * scale);
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
				end
				
				index3 = index + index2(1);
				for l = 2:d
					index3 = index3 + repvec(l-1)*index2(l);
				end
				ip(k) = ip(k) + temp*z(index3);
			end
		else
			k = kend;
		end
	end
	index = index + npoints;
end
