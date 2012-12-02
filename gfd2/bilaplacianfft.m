function [ lapfft ] = bilaplacianfft ( p, LX, LY )

%*****************************************************************************80
%
%% BILAPLACIANFFT ?
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
  val=size(p);

  M=val(1);
  N=val(2);

  lapfft = zeros(M,N);
  [kx ky] = kxkyfft ( p, LX, LY );

  for ic = 1 : M
    for jc = 1 : N
      lapfft(ic,jc) = ( kx(ic)^2 + ky(jc)^2 )^2 * p(ic,jc);
    end
  end

  return
end
