function ip = spcmpvalsm(d,z,y,newlevelseq,levelseq)
% SPCMPVALSM   Compute hierarchical surpluses for the given new
% level sequences considering all given old sequences
% (Maximum-grid). 
	
% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.0
% Date   : July 14, 2004
	
% Change log:
% V1.0   : July 14, 2004 

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
repeat = zeros(d,1);

% Compute the number of points per subdomain of new levels
for kl = 1:nnewlevels
	npoints = 1;
	lval = 0;
	for k = 1:d
		lval = newlevelseq(kl,k);
		if lval == 0 
			npoints = npoints * 3;
		else
			npoints = npoints * 2^lval;
		end
	end
	nnewpoints(kl) = npoints;
end	
		
for kl = 1:nlevels
	npoints = 1;
	lval = 0;
	nlevelzero = 0;
	for k = 1:d
		lval = levelseq(kl,k);
		level(k) = lval;
		if lval == 0
			repvec(k) = 3;
			nlevelzero = nlevelzero + 1;
		else
			repvec(k) = 2^lval;
		end
		repeat(k) = 0;
		npoints = npoints * repvec(k);
		if k > 1
			repvec(k) = repvec(k) * repvec(k-1);
		end
	end

	nrepeats = 2^nlevelzero-1;

	yt = 0;
	k = 0;
	
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
			repstep = 0;
			k = k + 1;
			while k <= kend
				temp = 1;
				l = 1;
				while l <= d
					lval = level(l);
					yt = y(k,l);
					
					% Compute the scaling factor and the array position of
					% the weight
					if lval == 0
						if repeat(l) == 0
							index2(l) = 1;
							temp = temp * (1 - 2 * abs(yt-0.5));
						else
							if yt == 1
								index2(l) = 2;
							else
								xp = floor(yt * 2) * 2;
								if xp == 0
									temp = temp * 2 * (0.5 - yt);
								else
									temp = temp * 2 * (yt - 0.5);
								end
								index2(l) = xp;
							end
						end
					elseif yt == 1
						temp = 0;
						break;
					else
						scale = 2^lval;
						xp = floor(yt * scale);
						temp = temp * ...
									 (1 - 2 * scale * abs( yt - (xp+0.5)/scale));
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
				if repstep == nrepeats
					k = k + 1;
					if nrepeats > 0
						for l = 1:d
							repeat(l) = 0;
						end
						repstep = 0;
					end
				else
					for l = 1:d
						if level(l) == 0
							repeat(l) = repeat(l) + 1;
							if repeat(l) > 1
								repeat(l) = 0;
							else
								break;
							end
						end
					end	
					repstep = repstep + 1;
				end
			end
			k = k - 1;
		else
			k = kend;
		end
	end
	index = index + npoints;
end

