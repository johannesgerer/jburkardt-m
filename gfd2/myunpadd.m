function [ft] = myunpadd(ftpadded)

%*****************************************************************************80
%
%% MYUNPADD reverses MYPADDING.
%
%  Discussion:
%
%    This function undoes the padding with zeros performed by MYPADDING.
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
  val=size(ftpadded);
  p=val(1);
  q=val(2);
  M=2*p/3;
  N=2*q/3;
% larger unpadding, need to adapt mypadding
%M=p/2;
%N=q/2;
  pn=(p-M)/2+1;
  po=pn+M-1;
  qn=(q-N)/2+1;
  qo=qn+N-1;

  ftshifted=fftshift(ftpadded);
  ft=ftshifted(pn:po,qn:qo);
  ft=fftshift(M/p*N/q*ft);

  return
end
