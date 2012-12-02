function [z,x] = spevalf(method,f,levelseq,d,range,varpos,vectorized, ...
												 nresults,functionArgType,varargin)
% SPEVALF   Internal function to evaluate the model function at the
% sparse grid points.
	
% Author : Andreas Klimke, Universität Stuttgart
% Date   : April 20, 2004
% Version: 1.3

val = varargin;
x = feval(method,levelseq,d);

% compute the function values at the grid points
if ~isempty(range)
	v = zeros(size(x));
	for l = 1:d
		v(:,l) = x(:,l) .* (range(l,2)-range(l,1)) + range(l,1);
	end
else
	v = x;
end

if strcmp(lower(vectorized), 'on')
	v = mat2cell(v,size(v,1),ones(1,d));
		
	if isempty(varpos)
		[z{1:nresults}] = feval(f, v{:}, varargin{:});
	else
		for l = 1:d
			val{varpos(l)} = v{l};
		end
		[z{1:nresults}] = feval(f, val{:});
	end
else
	z(1:nresults) = {zeros(size(v,1),1)};
	res(1:nresults) = {0};
	if isempty(varpos)
		if ~strcmp(lower(functionArgType), 'list')
			vec = 1;
		else
			vec = 0;
		end
		for l = 1:size(v,1)
			if ~vec
				val = mat2cell(v(l,:), 1, ones(1,d));
				[res{1:nresults}] = feval(f, val{:}, varargin{:});
			else
				val = v(l,:);
				[res{1:nresults}] = feval(f, val, varargin{:});
			end
			for m = 1:nresults
				z{m}(l) = res{m};
			end
		end
	else
		for l = 1:size(v,1)
			for m = 1:d
				val{varpos(m)} = v(l,m);
			end
			[res{1:nresults}] = feval(f, val{:});
			for m = 1:nresults
				z{m}(l) = res{m};
			end
		end
	end
end
	
