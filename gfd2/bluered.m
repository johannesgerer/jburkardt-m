function [blue] = bluered(n)

%*****************************************************************************80
%
%% BLUERED returns a nice set of values for colorbars.
%
%  Discussion:
%
%    This function is discussed in chapter 1 of the reference.
%
%  Modified:
%
%    02 December 2009
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
  nd=n/2;
  nq=n/4;
  val0=zeros(nq-1,1);
  vali=[0.5:0.5/(nq-2):1].';
  vald=[1:-0.5/(nq-2):0.5].';
  values = [0.:(1-0.)*1/(nd-1):1].';
  valuesb = [1:-(1-0.)*1/(nd-1):0.].';
  valuesd=ones(nd,1);
  valuesc=zeros(n,1);
  gray = [values values values];
  %bluered=[[vali' valuesd' valuesb' val0']' [val0' values' valuesb' val0']' [val0' values' valuesd' vald']']
  blue=[ [val0' values' valuesd' vald']' [val0' values' valuesb' val0']' [vali' valuesd' valuesb' val0']'];

  return
end
