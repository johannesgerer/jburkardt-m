function x = spgrid(n,d,options)
% SPGRID   Compute the sparse grid point coordinates
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
% Version: 1.3
% Date   : November 18, 2007

% Change log:
% V1.0   : September 24, 2003
%          Initial version
% V1.1   : April 20, 2004
%          Compute sequence of levels here instead of in spgridxx
%          subroutine. 
% V1.2   : June 15, 2004
%          Added new grid type : Chebyshev distributed nodes
%          (at the extrema of the Chebyshev polynomials)
% V1.3   : November 18, 2007
%          Added new grid type : Gauss-Patterson

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------
	
if nargin < 3, options = []; end
if nargin < 2, d = []; end

gridtype = spget(options, 'GridType', 'Clenshaw-Curtis');
sparseIndices = spget(options, 'SparseIndices', 'auto');
options = spset(options, 'SparseIndices', sparseIndices);

switch lower(gridtype)
 case 'clenshaw-curtis'
	if strcmpi(sparseIndices, 'off')
		gridgen = 'spgridcc';
	else
		gridgen = 'spgridccsp';
	end
 case 'maximum'
	gridgen = 'spgridm';
 case 'noboundary'
	gridgen = 'spgridnb';
 case 'chebyshev'
	if strcmpi(sparseIndices, 'off')
		gridgen = 'spgridcb';
	else
		gridgen = 'spgridcbsp';
	end
 case 'gauss-patterson'
	if strcmpi(sparseIndices, 'off')
		gridgen = 'spgridgp';
	else
		gridgen = 'spgridgpsp';
	end
 otherwise
	error('MATLAB:spinterp:badopt',['Unknown grid type ''' gridtype '''.']);
end

% Get the sequence of levels
if ~isempty(d)
	levelseq = spgetseq(n,d,options);
else
	% For internal usage: pass sequence of levels directly.
	levelseq = n;
end

x = feval(gridgen, levelseq);
