function P = chud_pi ( d )

%*****************************************************************************80
%
%% CHUD_PI implements the Chudnovsky algorithm for pi.
%
%  Discussion:
%
%    The call chud_pi(d) produces d decimal digits of Pi.
%
%  Licensing:
%
%    Copyright (c) 2011, The MathWorks, Inc.
%    All rights reserved.
%
%    Redistribution and use in source and binary forms, with or without 
%    modification, are permitted provided that the following conditions are 
%    met:
%
%        * Redistributions of source code must retain the above copyright 
%          notice, this list of conditions and the following disclaimer.
%        * Redistributions in binary form must reproduce the above copyright 
%          notice, this list of conditions and the following disclaimer in 
%          the documentation and/or other materials provided with the distribution
%        * Neither the name of the The MathWorks, Inc. nor the names 
%          of its contributors may be used to endorse or promote products derived 
%          from this software without specific prior written permission.
%  
%    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
%    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
%    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
%    ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
%    LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
%    CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
%    SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
%    INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
%    CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
%    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
%    POSSIBILITY OF SUCH DAMAGE.
%
%  Modified:
%
%    27 February 2012
%
%  Author:
%
%    Cleve Moler
%
%  Reference:
%
%    Cleve Moler,
%    Cleve's Corner, "Computing Pi",
%    http://www.mathworks.com/company/newsletters/news_notes/2011/ 
%
%  Parameters:
%
%    Input, integer D, the number of decimal digits desired.
%
%    Output, symbolic P, the value of pi to D digits.
% 
  k = sym ( 0 );
  s = sym ( 0 );
  sig = sym ( 1 );
  n = ceil ( d / 14 );

  for j = 1 : n
    s = s + sig * prod ( 3 * k + 1 : 6 * k) / prod ( 1 : k )^3 * ...
      ( 13591409 + 545140134 * k ) / 640320^( 3 * k + 3 / 2 );
    k = k + 1;
    sig = - sig;
  end

  S = 1 / ( 12 * s );
  P = vpa ( S, d );

  return
end
