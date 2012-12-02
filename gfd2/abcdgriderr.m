function[relerr]= abcdgriderr(igrid,tx,ty,Rodx,Rody) ;

%*****************************************************************************80
%
%% ABCDGRIDERR ?
%
%  Discussion:
%
%    This function is discussed in chapter 9 of the reference.
%
%  Modified:
%
%    01 December 2009
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
% igrid=A : A-Grid
% igrid=B : B-grid
% igrid=C : C-grid
% igrid=D : D-grid
%
% tx   = kx Deltax /2  from 0 to Pi/2 (for 2 Delta x wave)
%
% ty   = ky Deltay/2
%
% Rodx = Deformation radius divided by Deltax
%
% Rody = Deformation radius divided by Deltay
%
  switch lower(igrid)
  case{'a'}
    alpha=1;
    txalphax=sin(2*tx)/2;
    tyalphay=sin(2*ty)/2;
  case{'b'}
    alpha=1;
    txalphax=sin(tx)*cos(ty);
    tyalphay=sin(ty)*cos(tx);
  case{'c'}
    alpha=cos(tx)*cos(ty);
    txalphax=sin(tx);
    tyalphay=sin(ty);
  case{'d'}
    alpha=cos(tx)*cos(ty);
    txalphax=sin(tx)*cos(ty)*cos(tx);
    tyalphay=sin(ty)*cos(tx)*cos(ty);
  end

  relerr=((1-alpha*alpha)+Rodx*Rodx*4*(tx*tx-txalphax*txalphax)+Rody*Rody*4*(ty*ty-tyalphay*tyalphay));

  relerr = relerr / ( 1 + 4 * Rodx^2 * tx^2 + 4 * Rody^2 * ty^2 );

  end

  return
end
