function reply = default(query,value)
%DEFAULT gets response to IFISS prompt
%   reply = default(query,value);
%   input
%          query   character string: asks a question
%          value   integer: the default response
%
%   IFISS function: AR 31 August 2005, HCE 2 January 2010.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage (see readme.m)
global BATCH FID
if exist('BATCH') & BATCH==1, 
   replycell=textscan(FID,'%f%*[^\n]',1);
   reply=deal(replycell{:});
   disp(query)
   disp(reply)
else
   if length(query)>=26 && strcmp(query(10:26),'timestep sequence'), 
      reply=input([query,' : '],'s');
   else
      reply=input([query,' : ']);
   end
   if isempty(reply), reply=value; end
end
return
