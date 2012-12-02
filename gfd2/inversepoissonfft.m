function [a] = inversepoissonfft(omfft,LX,LY)

%*****************************************************************************80
%
%% INVERSEPOISSONFFT ?
%
%  Discussion:
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
  val = size ( omfft );

  M = val(1);
  N = val(2);

  [ kx ky ] = kxkyfft ( omfft, LX, LY );

  for ic = 1 : M
    for jc = 1 : N
      if ic + jc == 2
        a(ic,jc) = 0;
      else
        a(ic,jc) = - omfft(ic,jc) / ( kx(ic) * kx(ic) + ky(jc) * ky(jc) );
      end
    end
  end

  return
end
