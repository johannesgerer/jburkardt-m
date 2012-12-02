function [SN] = diffusionstep(S,ntmh,dt,dz,alpha,source,sink,BCB,BCS,iflag)

%*****************************************************************************80
%
%% DIFFUSIONSTEP ?
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
  MM=size(S);
  M=MM(2);
% For u
  dd=dt/dz^2;

  for k=2:M-1
    bt(k)=-alpha*ntmh(k)*dd;
    ct(k)=-alpha*ntmh(k+1)*dd;
    at(k)=1-bt(k)-ct(k)+dt*sink(k)/(S(k)+10^(-30));
    ft(k)=S(k)+source(k)*dt+ (1-alpha)*ntmh(k+1)*dd*(S(k+1)-S(k))-(1-alpha)*ntmh(k)*dd*(S(k)-S(k-1));
  end

  if iflag==0
    % Dirichlet in k=1 and k=M
    bt(1)=0;
    bt(M)=0;
    at(1)=1;
    at(M)=1;
    ct(1)=0;
    ct(M)=0;
    ft(1)=BCB;
    ft(M)=BCS;
  end

  if iflag==1
    % Neumann on diffusive flux in k=1+1/2 and k=M-1/2
    bt(1)=0;
    bt(M)=0;
    at(1)=1;
    at(M)=1;
    ct(1)=0;
    ct(M)=0;
    ft(1)=0;
    ft(M)=0;
    k=2;
    ft(k)=S(k)+source(2)*dt+ (1-alpha)*ntmh(k+1)*dd*(S(k+1)-S(k))+dt/dz*BCB;
    bt(k)=0;
    at(k)=1-bt(k)-ct(k);
    k=M-1;
    ct(k)=0;
    ft(k)=S(k)+source(k)*dt -dt/dz*BCS-(1-alpha)*ntmh(k)*dd*(S(k)-S(k-1));
    at(k)=1-bt(k)-ct(k);
  end

  SN=thomas(bt,at,ct,ft);

  return
end
