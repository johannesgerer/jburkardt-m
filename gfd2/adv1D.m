function [ cp ] = adv1D ( u, c, dt, dx, M )

%*****************************************************************************80
%
%% ADV1D solves the 1D advection equation.
%
%  Discussion:
%
%    This function is discussed in chapter 6, 15, and 20 of the reference.
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
  cp=c;
  fluxl=zeros(1,M);
  cup=zeros(1,M);
  flux=zeros(1,M);
  r=zeros(1,M);

% FLUX

% Point 1 and M are boundary values
% flux(i) is between points i-1 and i
% Therefore fluxes calculated only for i=2:M

  for i=2:M
    % High order flux
    flux(i)=u(i)*(c(i)*(dx(i-1)-u(i)*dt)+c(i-1)*(dx(i)+u(i)*dt))/(dx(i)+dx(i-1));
    % Low order flux
    if u(i) > 0
        fluxl(i)=u(i)*c(i-1);
        cup(i)=c(i-1);
    else
        fluxl(i)=u(i)*c(i);
        cup(i)=c(i);
    end
  end
  fluxl(1)=fluxl(2);
  flux(1)=flux(2);
%
%  LIMITERS
%
  for i=2:M
    %flux(i)= c at interface i i-1
    ip1=min(M,i+1);
    ip2=min(M,i+2);
    if u(i) > 0
        % if  fluxl(ip1)==fluxl(i)
        if cup(ip1) == cup(i)
            r(i)=-1;
        else
            % r(i)=(fluxl(i)-fluxl(i-1))/(fluxl(i+1)-fluxl(i));
            r(i)=(cup(i)-cup(i-1))/(cup(ip1)-cup(i));
            % r(i)=(c(i-1)-c(i-2))/(c(i)-c(i-1));
        end
    else
        % if fluxl(i)==fluxl(i-1)
        if cup(i)==cup(i-1)
            r(i)=-1;
        else
            % r(i)=(fluxl(ip1)-fluxl(i))/(fluxl(i)-fluxl(i-1));
            r(i)=(cup(ip1)-cup(i))/(cup(i)-cup(i-1));       
        end
    end
  end

  for i=2:M
    flux(i)=fluxl(i)+tvdlim(r(i))*(flux(i)-fluxl(i));
  end

% NEW CONCENTRATION

  for i=2:M-1
    cp(i)=c(i)-dt/dx(i)*(flux(i+1)-flux(i));
  end
  cp(1)=c(1);
  cp(M)=c(M);

  return
end

