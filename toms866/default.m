function reply = default(query,value)
%default   gets response to IFISS prompt
%   reply = default(query,value);
%   input
%          query   character string: asks a question
%          value   integer: the default response
%
%   IFISS function: AR; 31 August 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage (see readme.m)
global BATCH FID
if exist('BATCH') & BATCH==1, 
   replycell=textscan(FID,'%f%*[^\n]',1);
   reply=deal(replycell{:});
   disp(query)
   disp(reply)
else
   reply=input([query,' : ']);
   if isempty(reply), reply=value; end
end
return
