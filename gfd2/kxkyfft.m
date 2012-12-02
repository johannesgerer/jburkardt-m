function[kx, ky]=kxkyfft(p,LX,LY)

%*****************************************************************************80
%
%% KXKYFFT ?
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

  kx = ( 2 * pi / LX ) * [0:(M/2-1) (-M/2):-1];
  ky = ( 2 * pi / LY ) * [0:(N/2-1) (-N/2):-1];

  return
end
