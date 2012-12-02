function sp = spdim(n, d, options)
% SPDIM   Computes the number of sparse grid points
%    SP = SPDIM(N,D) Computes the number of points of the sparse
%    grid of dimension D and level N. 
%
%    SP = SPDIM(N,D,OPTIONS) Computes the number of points as
%    above, but with default grid type replaced by the grid type
%    specified in OPTIONS, an argument created with the SPSET
%    function. See SPSET for details.
%
%    See also SPINTERP, SPGRID, SPVALS. 
	
% Author : Andreas Klimke
% Version: 1.2
% Date   : November 18, 2007

% Change log:
% V1.0   : September 24, 2003
%          Initial version
% V1.1   : June 15, 2004
%          Added new grid type : Chebyshev distributed nodes
%          (at the extrema of the Chebyshev polynomials)
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

if nargin < 3, options = []; end

if d == 0
	% By definition; useful when computing recurrence formulae such
  % as Bungartz, "Finite Elements of Higher Order on Sparse
  % Grids", p.35, 1998.
	sp = 1;
	return;
end

gridtype = spget(options, 'GridType', 'Clenshaw-Curtis');

if strcmpi(gridtype, 'clenshaw-curtis')
	sp = spdimcc(n,d);
elseif strcmpi(gridtype, 'maximum')
	sp = spdimm(n,d);
elseif strcmpi(gridtype, 'noboundary')
	sp = spdimm(n,d,0);
elseif strcmpi(gridtype, 'chebyshev')
	% number of nodes same as CC-grid
	sp = spdimcc(n,d);
elseif strcmpi(gridtype, 'gauss-patterson')
	% number of nodes same as NB-grid
	sp = spdimm(n,d,0);
else
	error('MATLAB:spinterp:badopt',['Unknown grid type ''' gridtype '''.']);
end

