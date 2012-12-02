function [ftpadded] = mypadding(ft)

%*****************************************************************************80
%
%% MYPADDING performs two dimensional padding with zeros.
%
%  Discussion:
%
%    The padding is done to avoid aliasing in products.
%
%    This function is discussed in chapter 18 of the reference.
%
%  Modified:
%
%    30 November 2009
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
  val=size(ft);
  M=val(1);
  N=val(2);
  p=3*M/2;
  q=3*N/2;
% larger padding (need to adapt myunpadd}
%p=2*M;
%q=2*N;

  ftpadded=zeros(p,q);
  pn=(p-M)/2+1;
  po=pn+M-1;
  qn=(q-N)/2+1;
  qo=qn+N-1;
  ftpadded(pn:po,qn:qo)=fftshift(ft);
  ftpadded=fftshift(p/M*q/N*ftpadded);

  return
end
