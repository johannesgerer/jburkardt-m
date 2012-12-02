function [psi1,psi2,nit,relerr] = inversepoissonbc(om1,om2,ps1,ps2,dx,dy,R,nmax,tol,optsur,BCPSI,ibc)

%*****************************************************************************80
%
%% INVERSEPOISSONBC ?
%
%  Discussion:
%
%    This function is discussed in chapter 17 of the reference.
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
  val=size(om1);
  M=val(1);
  N=val(2);
  psi1=ps1;
  psi2=ps2;
  r=zeros(M,N);
%
% Adapt stopping criteria.
%
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
            dx2=(psi1(i+1,j)+psi1(i-1,j)-2*psi1(i,j))/(dx*dx);
            dy2=(psi1(i,j+1)+psi1(i,j-1)-2*psi1(i,j))/(dy*dy);
            err=(om1(i,j)-(dx2+dy2-(psi1(i,j)-psi2(i,j))/(2*R^2)))/(2/(dx*dx)+2/(dy*dy));
            psi1(i,j)=psi1(i,j)-optsur*err;
            errtot=errtot+err*err;
            psitot=psitot+psi1(i,j)*psi1(i,j);
            avrpsi=avrpsi+psi1(i,j);
            dx2=(psi2(i+1,j)+psi2(i-1,j)-2*psi2(i,j))/(dx*dx);
            dy2=(psi2(i,j+1)+psi2(i,j-1)-2*psi2(i,j))/(dy*dy);
            err=(om2(i,j)-(dx2+dy2+(psi1(i,j)-psi2(i,j))/(2*R^2)))/(2/(dx*dx)+2/(dy*dy));
            psi2(i,j)=psi2(i,j)-optsur*err;
            errtot=errtot+err*err;
            psitot=psitot+psi2(i,j)*psi2(i,j);
            avrpsi=avrpsi+psi2(i,j);
        end
    end

    psi1=bcpert(psi1);
    psi2=bcpert(psi2);
    
    if ibc==1
        III1=0;
        III2=0;
        III3=0;
        III4=0;
        for jjj=2:M-1
            III1=III1+psi1(jjj,N-1);
            III2=III2+psi1(jjj,2);
            III3=III3+psi2(jjj,N-1);
            III4=III4+psi2(jjj,2);
        end
        for i=1:M
            psi1(i,N)=III1/(M-2);
            psi1(i,1)=III2/(M-2);
            psi2(i,N)=III3/(M-2);
            psi2(i,1)=III4/(M-2);
        end
    end

    %psin(:,1)=0;
    %psin(:,N)=0;
    errtot=errtot/(N-2)/(M-2);
    psitot=psitot/2/(N-2)/(M-2)-(avrpsi/2/(N-2)/(M-2))^2;
    relerr=sqrt(errtot/psitot)
    %psin(2,2)=0;

  end

  nit=n;

  return
end

