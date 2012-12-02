function x = spgrid(n,d,options)
% SPGRID   Computes the sparse grid point coordinates.
%    X = SPGRID(N,D)  Computes the sparse grid points of level N
%    and problem dimension D. The coordinate value of dimension i
%    is stored in column i of the matrix X. One row of matrix X
%    represents one grid point.
%
%    X = SPGRID(N, D, OPTIONS) computes the sparse grid points as
%    above, but with default grid type replaced by the grid type
%    specified in OPTIONS, an argument created with the SPSET
%    function. See SPSET for details.
%
%    See also SPINTERP, SPVALS, SPDIM.
	
% Author : Andreas Klimke
% Version: 1.1
% Date   : April 20, 2004

% Change log:
% V1.0   : September 24, 2003
%          Initial version
% V1.1   : April 20, 2004
%          Compute sequence of levels here instead of in spgridxx
%          subroutine. 
	
if nargin < 3, options = []; end

gridtype = spget(options, 'GridType', 'Clenshaw-Curtis');

if strcmp(lower(gridtype), 'clenshaw-curtis')
	gridgen = 'spgridcc';
elseif strcmp(lower(gridtype), 'maximum')
	gridgen = 'spgridm';
elseif strcmp(lower(gridtype), 'noboundary')
	gridgen = 'spgridnb';
else
	error('MATLAB:spinterp:badopt',['Unknown grid type ''' gridtype '''.']);
end

% Get the sequence of levels
levelseq = spgetseq(n,d);

x = feval(gridgen, levelseq, d);
