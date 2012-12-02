function ip = spinterp(z, varargin)
% SPINTERP   Piecewise multilinear sparse grid interpolation.
%    IP = SPINTERP(Z, Y1, ..., YD)  Computes the interpolated
%    values at (Y1, ..., YD) over the sparse grid. The Y may be
%    double arrays of equal size for vectorized processing. The
%    sparse grid data must be given as a structure Z containing the
%    hierarchical surpluses (computed with SPVALS).
%
%    Example:
%       f = inline('x.^2 + y.^2 - 2.*z');
%       z = spvals(f,3);
%       f_interp = spinterp(z, 0.5, 0.2, 0.2)
%       f_exact = f(0.5, 0.2, 0.2)
%       error = abs(f_exact - f_interp)
%
%    See also SPGRID, SPVALS, SPSET, SPDIM. 
	
% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.2
% Date   : August 25, 2004

% Change log:
% V1.0    : September 23, 2003
%           Initial version
% V1.1    : January 27, 2004
%           Added some new options that can be specified using
%           optional structure fields in z. With the selectOutput
%           field, the desired output argument can be specified
%           (this applies to interpolants of functions with several
%           output variables. See SPDEMOVAROUT for a
%           demonstration). 
% V1.2    : August 25, 2004
%           Slight design change to calling syntax of spinterp
%           method.
	
gridtype = z.gridType;
d = z.d;
range = z.range;
if isfield(z, 'interpDepth')
	n = z.interpDepth;
else
	n = size(z.vals,2) - 1;
end
if isfield(z, 'interpStartDepth')
	nfrom = z.interpStartDepth;
else
	nfrom = 0;
end
if isfield(z, 'selectOutput')
	output = z.selectOutput;
else
	output = 1;
end
z = z.vals;

if strcmp(lower(gridtype), 'clenshaw-curtis')
	ipmethod = 'spinterpcc';
elseif strcmp(lower(gridtype), 'maximum')
	ipmethod = 'spinterpm';
elseif strcmp(lower(gridtype), 'noboundary')
	ipmethod = 'spinterpnb';
else
	error('MATLAB:spinterp:badopt',['Unknown grid type ''' gridtype '''.']);
end

if length(varargin) ~= d
	error('MATLAB:spinterp:badopt', ...
				['Number of inputs does not match sparse grid' ...
				 ' dimension.']);
end

% store the original array shape
orgsize = size(varargin{1});

% Transform multiple parameter inputs to a matrix for fast
% processing; also perform normalization to unit cube.
for k = 1:length(varargin)
	if ~isempty(range)
		varargin{k} = (varargin{k}(:)-range(k,1))./(range(k,2)-range(k,1));
	else 
		varargin{k} = varargin{k}(:);
	end
end
y = [varargin{:}];
	
ninterp = size(y,1);

ip = zeros(ninterp,1);

% do multiple levels at once
for k = nfrom:n
	levelseq = spgetseq(k,d);
	ip = ip + feval(ipmethod,d,z{output,k+1},y,levelseq);
end
		
% restore original array shape
ip = reshape(ip,orgsize);
