function [r,s,w] = twod_gauss(rule)
%-----------------------------------------------------------------------
%  twod_gauss.m - calculate Gauss integration points for triangular 
%                 elements
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [r,s,w] = twod_gauss(rule)
%
%  Variables:     rule
%                        Number of Gauss points:
%                 r
%                        xi coordinate of Gauss points
%                 s
%                        eta coordinate of Gauss points
%                 w
%                        Gauss weights corresponding to (r,s)
%-----------------------------------------------------------------------

  if (rule == 1)
    % The trivial linear triangle case

  elseif (rule == 3)
    % The following points correspond to a 3 point rule
    r    = zeros(3,1);  s    = zeros(3,1);
    r(1) = 2/3;         s(1) = 1/6;
    r(2) = 1/6;         s(2) = 2/3;
    r(3) = 1/6;         s(3) = 1/6;

    w    = zeros(3,1);
    w(1) = 1/6;
    w(2) = w(1);
    w(3) = w(1);
   
  elseif (rule == 7)
    % The following points correspond to a 7 point rule,
    % see Dunavant, IJNME, v. 21, pp. 1129-1148, 1995.
    % or Braess, p. 95.

    t1 = 1/3;    t2 = (6+sqrt(15))/21;   t3 = 4/7 - t2;
   
    r    = zeros(7,1);  s    = zeros(7,1);
    r(1) = t1;          s(1) = t1;
    r(2) = t2;          s(2) = t2;
    r(3) = 1-2*t2;      s(3) = t2;
    r(4) = t2;          s(4) = r(3);
    r(5) = t3;          s(5) = t3;
    r(6) = 1-2*t3;      s(6) = t3;
    r(7) = t3;          s(7) = r(6);
   
    t1 = 9/80;    t2 = ( 155+sqrt(15))/2400;  t3 = 31/240 - t2;
     
    w     = zeros(7,1);
    w(1)  = t1;
    w(2)  = t2;
    w(3)  = t2;
    w(4)  = t2;
    w(5)  = t3;
    w(6)  = t3;
    w(7)  = t3;

  elseif (rule == 13)
    r     = zeros(13,1);      s     = zeros(13,1);
    r(1)  = 0.0651301029022;  s(1)  = r(1);
    r(2)  = 0.8697397941956;  s(2)  = r(1);
    r(3)  = r(1);             s(3)  = r(2);
    r(4)  = 0.3128654960049;  s(4)  = 0.0486903154253;
    r(5)  = 0.6384441885698;  s(5)  = r(4);
    r(6)  = s(4);             s(6)  = r(5);
    r(7)  = r(5);             s(7)  = r(6);
    r(8)  = r(4);             s(8)  = r(5);
    r(9)  = r(6);             s(9)  = r(4);
    r(10) = 0.2603459660790;  s(10) = r(10);
    r(11) = 0.4793080678419;  s(11) = r(10);
    r(12) = r(10);            s(12) = r(11);
    r(13) = 0.3333333333333;  s(13) = r(13);

    w     = zeros(13,1);
    w(1)  = 0.0533472356088;
    w(2)  = w(1);
    w(3)  = w(1);
    w(4)  = 0.0771137608903;
    w(5)  = w(4);
    w(6)  = w(4);
    w(7)  = w(4);
    w(8)  = w(4);
    w(9)  = w(4);
    w(10) = 0.1756152574332;
    w(11) = w(10);
    w(12) = w(10);
    w(13) =-0.1495700444677;
    
    w = w/2;
  else
    error('quadrature rules other than 1, 3, 7 or 13 are not supported\n');
    keyboard
  end
