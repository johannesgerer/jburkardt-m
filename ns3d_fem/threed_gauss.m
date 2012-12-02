function [r,s,t,w] = threed_gauss(rule)
%-----------------------------------------------------------------------
%  threed_gauss.m - calculate Gauss integration points for tetrahedral
%                   elements
%
%  Copyright (c) 2002, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [r,s,t,w] = threed_gauss(rule)
%
%  Variables:     rule
%                        Number of Gauss points:
%                 r
%                        xi coordinate of Gauss points
%                 s
%                        eta coordinate of Gauss points
%                 t
%                        zeta coordinate of Gauss points
%                 w
%                        Gauss weights corresponding to (r,s,t)
%-----------------------------------------------------------------------

  if (rule == 1)
    % The following points correspond to a 1 point rule
    % Polynomials of degree 1 are integrated exactly
    r(1) = 0.25000000;  s(1) = 0.25000000;  t(1) = 0.25000000;

    w(1) = 0.16666666;  % (the volume of a regular tet is 1/6)

  elseif (rule == 4)
    % The following points correspond to a 4 point rule
    % Polynomials of degree 2 are integrated exactly
    r    = zeros(4,1);  s    = zeros(4,1);  t    = zeros(4,1);
    r(1) = 0.13819660;  s(1) = 0.13819660;  t(1) = 0.13819660;
    r(2) = 0.58541020;  s(2) = 0.13819660;  t(2) = 0.13819660;
    r(3) = 0.13819660;  s(3) = 0.58541020;  t(3) = 0.13819660;
    r(4) = 0.13819660;  s(4) = 0.13819660;  t(4) = 0.58541020;

    w    = 0.041666666667*ones(4,1);

  elseif (rule == 5)
    % The following points correspond to a 5 point rule
    % Polynomials of degree 3 are integrated exactly
    r    = zeros(5,1);  s    = zeros(5,1);  t    = zeros(5,1);
    r(1) = 0.25000000000;  s(1) = 0.25000000000;  t(1) = 0.25000000000;
    r(2) = 0.16666666666;  s(2) = 0.16666666666;  t(2) = 0.16666666666;
    r(3) = 0.50000000000;  s(3) = 0.16666666666;  t(3) = 0.16666666666;
    r(4) = 0.16666666666;  s(4) = 0.50000000000;  t(4) = 0.16666666666;
    r(5) = 0.16666666666;  s(5) = 0.16666666666;  t(5) = 0.50000000000;

    w    = zeros(5,1);
    w(1) =-0.13333333333;
    w(2) = 0.07500000000;
    w(3) = 0.07500000000;
    w(4) = 0.07500000000;
    w(5) = 0.07500000000;

  else
    error('quadrature rules other than 1, 4 or 5 are not supported\n');
    keyboard
  end
