function seq = spgetseq(n,d);
% SPGETSEQ  Internal function to compute the sequence of subdomains
% occurring for level n and dimension d.
% Note: For computational reasons, the indices start with index 0,
% i.e. compared to the algorithms described in the paper where the
% indices start with 1, the indices are shifted by 1.

% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.0
% Date   : August 5, 2003
	
% Examples:
% For dimension 2, level n = 3, the sequence is
%     3     0
%     2     1
%     1     2
%     0     3
%
% For dimension 3, level n = 3, the sequence is
%     3     0     0
%     2     1     0
%     1     2     0
%     0     3     0
%     2     0     1
%     1     1     1
%     0     2     1
%     1     0     2
%     0     1     2
%     0     0     3
	
level = zeros(d,1);
level(1) = n;
nlevels = getnlevels(n,d);
seq = zeros(nlevels,d);
seq(1,1) = n;
max = n;
for k = 2:nlevels
	if seq(k-1,1) > 0
		seq(k,1) = seq(k-1,1) - 1;
		for l = 2:d
			if seq(k-1,l) < max
				seq(k,l) = seq(k-1,l) + 1;
				for m = l+1:d
					seq(k,m) = seq(k-1,m);
				end
				break
			end
		end
	else
		sum = 0;
		for l = 2:d
			if seq(k-1,l) < max
				seq(k,l) = seq(k-1,l) + 1;
				sum = sum + seq(k,l);
				for m = l+1:d
					seq(k,m) = seq(k-1,m);
					sum = sum + seq(k,m);
				end
				break;
			else
				temp = 0;
				for m = l+2:d
					temp = temp + seq(k-1,m);
				end
				max = n-temp;
				seq(k,l) = 0;
			end
		end
		seq(k,1) = n - sum;
		max = n - sum;
	end
end
		

%-------------------------------------------------------------------
function n = getnlevels(n,d);
% Determines the number of subdomains per level
narray = ones(n+1,d);
for k = 2:d
	for l = 2:n+1
		narray(l,k) = narray(l-1,k) + narray(l,k-1);
	end
end
n = narray(n+1,d);
	
