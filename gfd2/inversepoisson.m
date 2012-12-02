function [psif,nit,relerr,r] = inversepoisson(om,psistart,dx,dy,nmax,tol,optsur)

%*****************************************************************************80
%
%% INVERSEPOISSON ?
%
%  Discussion:
%
%    This function is discussed in chapter 16 of the reference.
%
%  Modified:
%
%    02 December 2009
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
  val=size(om);
  M=val(1);
  N=val(2);
  psi=psistart;
  psin=psi;
  r=zeros(M,N);

% Adapt stopping criteria

  n=0;
  relerr=1;
  err=zeros(M,N);

  while n < nmax && relerr > tol
    
    n=n+1;
    errtot=0;
    psitot=0;
    avrpsi=0;
    
    for i=2:M-1
        for j=2:N-1
            dx2=(psi(i+1,j)+psi(i-1,j)-2*psi(i,j))/(dx*dx);
            dy2=(psi(i,j+1)+psi(i,j-1)-2*psi(i,j))/(dy*dy);
            err(i,j)=(om(i,j)-(dx2+dy2))/(2/(dx*dx)+2/(dy*dy));
            % psin(i,j)=psi(i,j)-optsur*err(i,j);
            psi(i,j)=psi(i,j)-optsur*err(i,j);
            errtot=errtot+err(i,j)*err(i,j);
            psitot=psitot+psi(i,j)*psi(i,j);
            avrpsi=avrpsi+psi(i,j);
        end
    end
    
    % psin(:,1)=0;
    % psin(:,N)=0;
    errtot=errtot/(N-2)/(M-2);
    psitot=psitot/(N-2)/(M-2)-(avrpsi/(N-2)/(M-2))^2;
    relerr=sqrt(errtot/psitot);
    % psin(2,2)=0;
    psi=periodic(psi);
    % psi=psin;
    psi(:,1)=0;
    psi(:,N)=0;
    % keep initial value of psi
    psi(:,1)=psistart(:,1);
    psi(:,N)=psistart(:,N);
    % psi(1,:)=0;
    % psi(M,:)=0;
    % subplot(2,1,1)
    % pcolor(err');
    % colorbar
    % subplot(2,1,2)
    % pcolor(psi');
    % colorbar
    
    % pause(0.01);
    avrpsi=avrpsi/(N-2)/(M-2);
    % psi=psi-avrpsi;
    
    x=psi(2,10);
    y=psi(3,10)-x;
    
  end

% psin=psi;

  nit=n;
  psif=psi;
  r=periodic(err);

  return
end
