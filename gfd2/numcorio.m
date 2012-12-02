function [ u, v, t ] = numcorio ( f, dt, alpha, t0, tf, u0, v0, dtsol ) 

%*****************************************************************************80
%
%% NUMCORIO
%
%  Discussion:
%
%    This function is discussed in chapter 2 of the reference.
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
%    Input, real F, ?
%
%    Input, real DT, the time step.
%
%    Input, real ALPHA, ?
%
%    Input, real T0, the initial time.
%
%    Input, real TF, the final time.
%
%    Input, real U0, the initial horizontal velocity.
%
%    Input, real V0, the initial vertical velocity.
%
%    Input, real DTSOL, ?
%
%    Output, U(*), V(*), T(*), the horizontal and vertical velocity
%    and time at each step.
%

% disp(['Computing inertial oscillation']);

  u(1)=u0;
  v(1)=v0;
  t(1)=t0;
  time=t0;
  un=u0;
  vn=v0;
  umafdt=(1-alpha)*f*dt;
  afdt=alpha*f*dt;
  det1=1/(1+afdt*afdt);
  n=0;
  nsol=dtsol/dt;
  isol=0;

  while time < tf,

    ru=un+umafdt*vn;
    rv=vn-umafdt*un;
    unp=(ru+afdt*rv)*det1;
    vnp=(rv-afdt*ru)*det1;
    time=time+dt;
    un=unp;
    vn=vnp;
    n=n+1;

    if mod(n,nsol) == 0,
      isol=isol+1;
      t(isol)=time;
      v(isol)=vn;
      u(isol)=un;
    end

  end

  return
end
