function[nu , kappa]= nukappa(tke,eps,NS,MS) 

%*****************************************************************************80
%
%% NUKAPPA ?
%
%  Discussion:
%
%    This function is discussed in chapter 14 of the reference.
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
  vv=size(tke);
  M=vv(2);
%
%  Compute AlphaN and AlphaM.
%
  for k=2:M
    val=tke(k)^2/eps(k)^2;
    alphaN(k)=val*NS(k);
    alphaM(k)=val*MS(k);
  end
%
%  Compute CMU and CMUp.
%
  for k=2:M
    [cmu(k), cmup(k)] = stabfunction ( alphaN(k), alphaM(k) );
  end
%
%  Compute NU and KAPPA.
%
  numax = 1.0;
  kappamax = 1.0;

  for k=2:M

    val=tke(k)^2/eps(k);
    nu(k)=cmu(k)*val+10^(-6);
    kappa(k)=cmup(k)*val+10^(-7);
    %kappa(k)=0.001;

    if nu(k) > numax
      nu(k)=numax;
    end

    if kappa(k)>kappamax
      kappa(k)=kappamax;
    end

  end

  nu(1)=nu(2);
  kappa(1)=kappa(2);

  return
end
