function [kene,kens] = kmean(omfft,psifft,LX,LY)

%*****************************************************************************80
%
%% KMEAN ?
%
%  Discussion:
%
%    This function is discussed in chapter 18 of the reference.
%
%  Modified:
%
%    03 December 2009
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
  val = size ( omfft );
  M = val(1);
  N = val(2);
  [ kx ky ] = kxkyfft ( omfft, LX, LY );

  ene = 0.0;
  ens = 0.0;

  kene = 0.0;
  kens = 0.0;

  for ic = 1 : M
    for jc = 1 : N

      ks = kx(ic)^2 + ky(jc)^2;

      eee = ks * abs ( psifft(ic,jc) )^2;
      ees = abs ( omfft(ic,jc) )^2;

      ene = ene + eee;
      ens = ens + ees;

      kene = kene + sqrt ( ks ) * eee;
      kens = kens + sqrt ( ks ) * ees;

    end
  end

  kene = kene / ene;
  kens = kens / ens;

  return
end
