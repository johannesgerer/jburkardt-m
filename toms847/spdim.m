function sp = spdim(n, d, options)
% SPDIM   Computes the number of sparse grid points.
%    SP = SPDIM(N,D) Computes the number of points of the sparse
%    grid of dimension D and level N. 
%
%    SP = SPDIM(N,D,OPTIONS) Computes the number of points as
%    above, but with default grid type replaced by the grid type
%    specified in OPTIONS, an argument created with the SPSET
%    function. See SPSET for details.
%
%    See also SPINTERP, SPGRID, SPVALS. 
	
% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.0
% Date   : September 24, 2003

if nargin < 3, options = []; end

gridtype = spget(options, 'GridType', 'Clenshaw-Curtis');

if strcmp(lower(gridtype), 'clenshaw-curtis')
	sp = spdimcc(n, d);
elseif strcmp(lower(gridtype), 'maximum')
	sp = spdimm(n,d);
elseif strcmp(lower(gridtype), 'noboundary')
	sp = spdimm(n,d,0);
else
	error('MATLAB:spinterp:badopt',['Unknown grid type ''' gridtype '''.']);
end

