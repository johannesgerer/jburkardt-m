function chx = bbp_pi ( d )

%*****************************************************************************80
%
%% BBP_PI implements the Bailey-Borwein-Plouffe algorithm.
%
%  Discussion:
%
%    The BBP algorithm can be used to compute a a few hex digits of pi starting
%    at any position.
%
%    In particular, bbp_pi ( d ) is a char string of hex digits d+1 through 
%    d+13 in the hexadecimal expansion of pi.
%
%    This function does not require extended precision arithmetic or 
%    symbolic computation.
%
%    The results are usually accurate to about 11 or 12 of the 13 digits.
%
%    This program is derived from a C program by David H. Bailey dated 
%    2006-09-08, http://www.experimentalmath.info/bbp-codes/piqpr8.c 
%
%    For many other references: Google "BBP Pi".
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
   s1 = series ( 1, d );
   s2 = series ( 4, d );
   s3 = series ( 5, d );
   s4 = series ( 6, d );
   P = 4. * s1 - 2. * s2 - s3 - s4;
   P = P - floor ( P ) + 1.; 
   chx = hexchar ( P, 13 );

  return
end
function s = series ( m, d )

%*****************************************************************************80
%
%% SERIES
%
% s = series(m,d) = sum_k 16^(d-k)/(8*k+m)
% using the modular powering technique.
%
  s = 0;
  k = 0;
  t = Inf;

  while k < 13 || t > eps
    ak = 8 * k + m;
    if k < d
      t = powmod(16, d - k, ak) / ak;
     else
       t = 16^(d - k) / ak; 
     end
     s = mod(s + t, 1);
     k = k + 1;
   end

  return
end
function r = powmod ( b, p, a )

%*****************************************************************************80
%
%% POWMOD computes mod(b^p,a) without computing b^p.
%
  persistent twop

  if isempty ( twop )
    twop = 2.^(0:25)';
  end

  if a == 1
    r = 0;
    return
  end

  n = find ( p <= twop, 1, 'first' );

  pt = twop ( n );
  r = 1;
  for j = 1 : n
    if p >= pt
      r = mod ( b * r, a );
      p = p - pt;
    end
    pt = 0.5 * pt;
    if pt >= 1
      r = mod ( r * r, a );
    end
  end

  return
end
function chx = hexchar ( s, n )

%*****************************************************************************80
%
%% HEXCHAR returns hex digits.
%
% chx(s,n) = string of the first n hex digits of s.
%
  hx = '0123456789ABCDEF';

  s = abs ( s );

  for j = 1 : n
    s = 16. * mod ( s, 1 );
    chx(j) = hx ( floor ( s ) + 1 );
  end
   
  return
end
