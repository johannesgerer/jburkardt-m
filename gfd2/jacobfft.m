function [a] = jacobfft(omfft,psifft,LX,LY)

%*****************************************************************************80
%
%% JACOBFFT ?
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
  val=size(omfft);
  M=val(1);
  N=val(2);

  [ kx ky ] = kxkyfft(omfft,LX,LY);

  for ic = 1 : M
    for jc = 1 : N
      dxomfft(ic,jc) = kx(ic)*i*omfft(ic,jc);
      dyomfft(ic,jc) = ky(jc)*i*omfft(ic,jc);
      dxpsifft(ic,jc) = kx(ic)*i*psifft(ic,jc);
      dypsifft(ic,jc) = ky(jc)*i*psifft(ic,jc);
    end
  end

  psiphys = real(ifft2(psifft));
  EEE = norm(real(dxpsifft).^2,'fro')+norm(real(dypsifft).^2,'fro')/(N*M)
%
%  Padding so as to subsapmple with higher frequency in physical domain
%
  dxpsiphys = real(ifft2(mypadding(dxpsifft)));
  dypsiphys = real(ifft2(mypadding(dypsifft)));
  dxomphys = real(ifft2(mypadding(dxomfft)));
  dyomphys = real(ifft2(mypadding(dyomfft)));

  val = size(dxomphys);
  mpad = val(1);
  npad = val(2);
  for ic = 1 : mpad
    for jc = 1 : npad
      jacobphys(ic,jc) = -dxomphys(ic,jc)*dypsiphys(ic,jc)+dyomphys(ic,jc)*dxpsiphys(ic,jc);
    end
  end

  a = myunpadd ( fft2(jacobphys) );

  return
end
