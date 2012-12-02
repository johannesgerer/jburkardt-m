function ip = spcmpvalscc(d,z,y,newlevelseq,levelseq)
% SPCMPVALSCC   Compute hierarchical surpluses, Clenshaw-Curtis grid
%    (internal function)
	
% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.2
% Date   : January 24, 2006
	
% Change log:
% V1.0   : July 1, 2004
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
	
index2 = zeros(d,1,'uint32'); 
repvec = ones(d,1,'uint32');
level = zeros(d,1,'uint8');
newlevel = zeros(d,1,'uint32');

% Get the number of new levels
nnewlevels = uint32(size(newlevelseq, 1));
nnewpoints = zeros(nnewlevels,1,'uint32');

% Get the number of old levels
nlevels = uint32(size(levelseq,1));

% index contains the index of the resulting array containing all
% subdomains of the level.
index = uint32(1);

% Compute the number of points per subdomain of new levels
for kl = 1:nnewlevels
	npoints = uint32(1);
	lval = uint8(0);
	for k = 1:d
		lval = newlevelseq(kl,k);
		if lval == 0 % do nothing
		elseif lval < 3
			npoints = npoints * 2;
		else
			npoints = npoints * 2^uint32(lval-1);
		end
	end
	nnewpoints(kl) = npoints;
end	

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
					
					% some tests are omitted compared to the spinterpcc
					% routine, since they are not necessary in case of
					% computing the hierarchical surpluses.
					
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
					else
						scale = 2^double(lval);
						xp = floor(yt * scale / 2);
						temp = temp * ...
									 (1 - scale * abs( yt - ( (xp*2+1)/scale )));
						index2(l) = xp;
					end
					l = l + 1;
				end
				
				%	if temp > 0, etc, has been removed, since in case of
				%	computing the hierarchical surpluses, when omitting the
				% non-contributing subdomands, this case cannot occur anyway.
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
