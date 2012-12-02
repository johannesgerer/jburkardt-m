%% TESTTHOMAS demonstrates the THOMAS function.
%
%  Discussion:
%
%    This script is discussed in chapter 6 of the reference.
%
%  Modified:
%
%    01 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
  clear all;

% PARAMETERS

  M=100;
  for i=1:M
    a(i)=1+i/100.;
    b(i)=0.1*(sin(i-M))*5;
    c(i)=-0.23*(i-M/2)/10;
    f(i)=i;
  end

% TEST

  x = thomas ( b, a, c, f );

% RESULTS

  for i=3:M-2
    diff(i) = ( b(i) * x(i-1) + a(i) * x(i) + c(i) * x(i+1) - f(i) ) / f(i);
  end

  diff'
