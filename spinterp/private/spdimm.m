function [sp, spmatrix] = spdimm(maxn, maxd, boundary)
% SPDIMM  Compute number of sparse grid points, maximum-norm grid 
%	   [SP, SPMATRIX] = SPDIMM(MAXN, MAXD, BOUNDARY)   Computes the
%	   number of sparse grid points up to dimension MAXD and level
%	   MAXN. If BOUNDARY is of value Zero, the sparse grid  without
%	   the boundary nodes is computed. Otherwise, if BOUNDARY is
%	   omitted or empty, the total number of nodes, with both inner
%	   and boundary points, is computed. SP Contains the number of
%	   sparse grid points of dimension MAXN and level MAXD, SPMATRIX
%	   is a matrix containing all other dimensions and levels up to
%	   MAXN and MAXD. (Internal function)

% The algorithm uses the recursive formulas Eq. (17) and (20) from
% "Duenne Gitter und deren Anwendung bei der adaptiven Lösung der
% dreidimensionalen Poisson-Gleichung", Hans-Joachim Bungartz,
% 1992.
	
% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.0
% Date   : July 29, 2003

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------
	
if nargin < 3
	boundary = [];
end

maxn = maxn + 1;

spmatrix = zeros(maxd, maxn);

if boundary == 0
	spmatrix(1,:) = 2.^(1:maxn)-1;
	for d = 2:maxd
		for n = 1:maxn
			for k = 0:n-1
				spmatrix(d,n) = spmatrix(d,n) + 2^k*spmatrix(d-1,n-k);
			end
		end
	end
else
	spmatrix(1,:) = 2.^(1:maxn)+1;
	for d = 2:maxd
		for n = 1:maxn
			spmatrix(d,n) = 3*spmatrix(d-1,n);
			for k = 1:n-1
				spmatrix(d,n) = spmatrix(d,n) + 2^k*spmatrix(d-1,n-k);
			end
		end
	end
end

sp = spmatrix(maxd, maxn);