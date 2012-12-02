function [cmu,cmup] = stabfunction(alphaNt,alphaMt) 

%*****************************************************************************80
%
%% STABFUNCTION ?
%
%  Discussion:
%
%    This function is discussed in chapter 14 of the reference.
%
%  Modified:
%
%    04 December 2009
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
  alphaM = alphaMt;
  alphaN = alphaNt;
%
%  Compute FACT.
%
  d1=0.25547;
  d2=0.0287163;
  d3=0.0052224;
  d4=0.0086776;
  d5=-0.000033722;
  fact=1/(1+d1*alphaN+d2*alphaM+d4*alphaN*alphaN+d3*alphaN*alphaM+d5*alphaM*alphaM);
%
%  Set CMU.
%
  s0=0.106666; 
  s1=0.01733966;
  s2=-.0001205188;

  cmu=(s0+s1*alphaN+s2*alphaM)*fact;

  if cmu < 0
    cmu = 1000;
  end

  if cmu > 1000
    cmu=1000;
  end
%
%  Set CMUP.
%
  s4=0.1120448;
  s5=0.00451945;
  s6=0.00088713;

  cmup=(s4+s5*alphaN+s6*alphaM)*fact;

  if cmup < 0
    cmup=1000;
  end

  if cmup > 1000
    cmup=1000;
  end

  return
end
