%% PGERROR computes the pressure-gradient error.
%
%  Discussion:
%
%    This script computes the pressure-gradient error for a fixed
%    density anomaly depending only on Z.
%
%    This script is discussed in chapter 20 of the reference.
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
  clear all;
  close all;

  M=50;
  N=100;
  HM=200;
  L=500000;
  dx=L/N;
  D=10;  
  W=20;

  for i=1:N
    for k=1:M
        x(i)=(i-N/2)*dx;
        xpl(i,k)=x(i);
    end
  end

  for i=1:N
    H(i)=HM+150*tanh(x(i)/L*20);
    for k=1:M
        s=(k-0.5)/M;
        z(i,k)=-H(i)+s*H(i);
        rho(i,k)=5*tanh((z(i,k)+D)/W);
    end
  end

  [pg,xpg,zpg]=bcpgr(rho,x,z);

  xplb=xpl;
  for k=1:M
    for i=1:N
        xplb(i,k)=xpg(i);
    end
  end
%
%  Graphics.
%
  pg=pg/0.0001/1024;
  pgmax=max(max(abs(pg)));
  pcolor(xplb',zpg',pg');
  shading interp;
  br=bluered(64);
  colormap(br);
  caxis([-pgmax pgmax]);
  colorbar;
  hold on;
  plot(x,-H);
