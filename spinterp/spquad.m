function q = spquad(z)
% SPQUAD   Compute integral value of sparse grid interpolant.
%    Q = SPQUAD(Z)  Computes the integral over the sparse grid 
%    domain. The sparse grid data must be given as a structure Z
%    containing the hierarchical surpluses (computed with 
%    SPVALS). 
%
%    Example:
%       f = inline('x.^2 + y.^2 - 2.*z');
%       options = spset('GridType','Chebyshev','Vectorized','on');
%       z = spvals(f,3,[],options);
%       F_quad = spquad(z)
%       F_exact = -1/3
%       error = abs(F_exact - F_quad)
%
%    See also SPVALS. 

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------
	
% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.1
% Date   : November 13, 2007

% Change log:
% V1.0   : May 04, 2004
%          Initial version
% v1.1   : November 13, 2007
%          Reorganized to use weights functions
	
gridtype = z.gridType;
d = z.d;

if isfield(z, 'indices');
	sparseIndices = 'on';
	levelseq = z.indices;
else
	sparseIndices = 'off';
	n = size(z.vals,2) - 1;
end

if isfield(z, 'selectOutput')
	output = z.selectOutput;
else
	output = 1;
end

if ~isempty(z.range)
	scale = prod(z.range(:,2)-z.range(:,1));
else
	scale = 1;
end

z = z.vals;

% do multiple levels at once
if strcmpi(sparseIndices, 'off')
	options = spset('SparseIndices','off','GridType',gridtype);
	q = 0;
	for k = n:-1:0
		% get the sequence of levels
		levelseq = spgetseq(k,d,options);
		quadw = spquadw(levelseq,[],options);
		q = q + sum(quadw .* z{output,k+1});
	end
else
	options = spset('SparseIndices','on','GridType',gridtype);
	quadw = spquadw(levelseq,[],options);
	q =  sum(quadw .* z{output});
end		

% Rescale to domain
q = q * scale;
