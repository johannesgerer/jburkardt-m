function seq = spgetseq(n,d,options)
% SPGETSEQ  Compute the sets of indices 
%    (internal function)

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.1
% Date   : November 18, 2007

% Change log:
% V1.0   : August 5, 2003
%          Initial release
% V1.1   : January 24, 2006
%          Changed algorithm to operate on a uint8 rather than
%          a double array.
% V1.2   : November 18, 2007
%          Added new grid type : Gauss-Patterson

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------
	
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

% Make sure that integer data types are used
n = uint8(n);
d = uint16(d);

if nargin < 3, options = []; end

sparseIndices = spget(options, 'SparseIndices', 'off');
gridtype = spget(options, 'GridType', 'Clenshaw-Curtis');

% If the sparse indices option is set, call other routine.
if strcmpi(sparseIndices, 'on') || ...
    (strcmpi(sparseIndices, 'auto') && ...
    strcmpi(gridtype, 'Clenshaw-Curtis')) || ...
    (strcmpi(sparseIndices, 'auto') && ...
    strcmpi(gridtype, 'Chebyshev')) || ...
    (strcmpi(sparseIndices, 'auto') && ...
    strcmpi(gridtype, 'Gauss-Patterson'))
  seq = spgetseqsp(n,d,options);
  return;
end

nlevels = uint32(nchoosek(double(n)+double(d)-1,double(d)-1));
seq = zeros(nlevels,d,'uint8');

seq(1,1) = n;
max = n;
for k = uint32(2):nlevels
	if seq(k-1,1) > uint8(0)
		seq(k,1) = seq(k-1,1) - 1;
		for l = uint16(2):d
			if seq(k-1,l) < max
				seq(k,l) = seq(k-1,l) + 1;
				for m = l+1:d
					seq(k,m) = seq(k-1,m);
				end
				break;
			end
		end
	else
		sum = uint8(0);
		for l = uint16(2):d
			if seq(k-1,l) < max
				seq(k,l) = seq(k-1,l) + 1;
				sum = sum + seq(k,l);
				for m = l+1:d
					seq(k,m) = seq(k-1,m);
					sum = sum + seq(k,m);
				end
				break;
			else
				temp = uint8(0);
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
