function ip = spcmpvalsnb(d,z,y,newlevelseq,levelseq)
% SPCMPVALSNB   Compute hierarchical surpluses for the given new
% level sequences considering all given old sequences (NB-grid).
	
% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.0
% Date   : July 14, 2004
	
% Change log:
% V1.0   : July 1, 2004 
%	         Initial release.

ninterp = size(y,1);
ip = zeros(ninterp,1);

% Get the number of new levels
nnewlevels = size(newlevelseq, 1);
nnewpoints = size(nnewlevels,1);
	
% Get the number of old levels
nlevels = size(levelseq,1);
	
% index contains the index of the resulting array containing all
% subdomains of the level.
index = 1;

index2 = zeros(d,1); 
repvec = ones(d,1);
level = ones(d,1);

% Compute the number of points per subdomain of new levels
for kl = 1:nnewlevels
	npoints = 1;
	for k = 1:d
		npoints = npoints * 2^newlevelseq(kl,k);
	end
	nnewpoints(kl) = npoints;
end	

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

	k = 0;
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

