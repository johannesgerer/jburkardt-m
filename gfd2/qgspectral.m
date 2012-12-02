%% QGSPECTRAL ?
%
%  Discussion:
%
%    This script is discussed in chapter 18 of the reference.
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
  clear all;
  close all;


% PARAMETERS

  M=64;  % 16 64 128 256 512
  N=M;
  DX=5000;  % 10000
  LX=2*pi;  % M*DX
  LY=LX;
  AH=0; % 10 0 0.000001/4
  BH=3.125*10^(-8)/400;  % BH=3.125*10^(-7)/4;
  dissrate=0.000000;
  dt=0.5;

% For nice color bars

  val0=zeros(15,1);
  vali=[0.5:0.5/14:1].';
  vald=[1:-0.5/14:0.5].';
  values = [0.:(1-0.)*1/31:1].';
  valuesb = [1:-(1-0.)*1/31:0.].';
  valuesd=ones(32,1);
  valuesc=zeros(64,1);
  gray = [values values values];

%bluered=[[vali' valuesd' valuesb' val0']' [val0' values' valuesb' val0']' [val0' values' valuesd' vald']']

  bluered = [ ...
    [val0' values' valuesd' vald']' ...
    [val0' values' valuesb' val0']' ...
    [vali' valuesd' valuesb' val0']' ];

% time stepping
% istepping=2: Leapfrog
% istepping=4: Runge-Kutta
istepping=4


% RESOLUTION

  for ic=1:M
    for jc=1:M
        x=(ic-M/2)/(M)*2;
        y=(jc-N/2)/(N)*2;
        omphys(ic,jc)=.001*(cos(pi*x)*cos(pi*y))^2;
        yt=0.05+0.005*sin(2*pi*x);
        yb=-.05+0.005*cos(2*pi*x);
       % omphys(ic,jc)=exp(-6*(x-0.5)*(x-0.5)-12*(y-0.5)*(y-.5))*0.001;
        rr=x^2+10*y^2;
        re=0.5^2;
        omphys(ic,jc)=0.001*(1-tanh(3*(sqrt(rr/re)-1)))/2;
        omphys(ic,jc)=-0.001*exp(-10*(max(y-yt,0)+max(yb-y,0)));
    end
  end

% omphys=omphys+random('Normal',0,1,M,M)*0.0000;

  omphys=periodic(omphys);

  omfft=fft2(omphys);
  avrnorm=norm(omfft);
  [kx ky]=kxkyfft(omfft,LX,LY)

% test on random stream function

  for ic=1:M
    for jc=1:N
        kk=sqrt(kx(ic)^2+ky(jc)^2);
        %psifft(ic,jc)=(random('Normal',0,1,1,1))*kk/(1+kk^4/6^4)+i*(random('Normal',0,1,1,1))*kk/(1+kk^4/6^4);
        psifft(ic,jc)=(randn(1,1))*kk/(1+kk^4/6^4)+i*(randn(1,1))*kk/(1+kk^4/6^4);
        %psifft(ic,jc)=(random('Normal',0,1,1,1))*kk^3/(kk+60)^9+i*(random('Normal',0,1,1,1))*kk^3/(kk+60)^9;
    end
  end

  EE=0;
  for ic=1:M
    for jc=1:N
        uuu=real(i*kx(ic)*psifft(ic,jc));
        vvv=real(i*ky(jc)*psifft(ic,jc));
        EE=EE+uuu*uuu+vvv*vvv;
    end
  end

  psifft=psifft/sqrt(EE/(N*M));
  omfft=laplacianfft(psifft,LX,LY);

  t=0;
  for n=0:10000
    t=t+dt
    if istepping==4 
        psifft=inversepoissonfft(omfft,LX,LY);
        rh1=-jacobfft(omfft,psifft,LX,LY)+AH*laplacianfft(omfft,LX,LY)-BH*bilaplacianfft(omfft,LX,LY);
        om1=omfft+dt/2*rh1;
        psifft=inversepoissonfft(om1,LX,LY);
        rh2=-jacobfft(om1,psifft,LX,LY)+AH*laplacianfft(om1,LX,LY)-BH*bilaplacianfft(om1,LX,LY);
        om1=omfft+dt/2*rh2;
        psifft=inversepoissonfft(om1,LX,LY);
        rh3=-jacobfft(om1,psifft,LX,LY)+AH*laplacianfft(om1,LX,LY)-BH*bilaplacianfft(om1,LX,LY);
        om1=omfft+dt*rh3;
        psifft=inversepoissonfft(om1,LX,LY);
        rh4=-jacobfft(om1,psifft,LX,LY)+AH*laplacianfft(om1,LX,LY)-BH*bilaplacianfft(om1,LX,LY);
        omfft=omfft*exp(-dissrate*dt)+dt/6*(rh1+2*rh2+2*rh3+rh4);
    end
    if istepping==2
        if n==0
            omfftold=omfft;
            psifft=inversepoissonfft(omfft,LX,LY);
            rh1=-jacobfft(omfft,psifft,LX,LY)+AH*laplacianfft(omfftold,LX,LY)-BH*bilaplacianfft(omfftold,LX,LY);
            omfft=omfft*exp(-dissrate*dt)+dt*rh1;
        else
            psifft=inversepoissonfft(omfft,LX,LY);
            rh1=-jacobfft(omfft,psifft,LX,LY)+AH*laplacianfft(omfftold,LX,LY)-BH*bilaplacianfft(omfftold,LX,LY);
            rh1=omfftold*exp(-dissrate*2*dt)+2*dt*rh1;
            omfftold=omfft;
            omfft=rh1;
        end
    end
    [kene(n+1),kens(n+1)]=kmean(omfft,psifft,LX,LY);
    
    if mod(n,10)==0
       % title(num2str((t)));
        omphys=real(ifft2(omfft));
        subplot(1,2,1)
        psiphys=real(ifft2(psifft));
        ene=zeros(round(sqrt(M^2+N^2)),1);
        vort=ene;
        kkk=vort;
        for ic=1:M
            for jc=1:N
                ks=sqrt(kx(ic)^2+ky(jc)^2);
                kk=ceil(ks/2)+1;
                kkk(kk)=ks;
                ene(kk)=ene(kk)+(kx(ic)^2+ky(jc)^2)*(abs(psifft(ic,jc)))^2;
                vort(kk)=vort(kk)+abs(omfft(ic,jc)^2);
            end
        end
        %colorbar
        %    subplot(1,2,2)
        %pcolor(real(ifft2(psifft))');
        %caxis([-0.002 0.002])
        %shading('interp')
        %axis equal
        %colorbar
        pcolor(real(omphys)');
        caxis([-0.1 0.1])
        shading('interp')
        axis equal
        axis off
        title 'Vorticity'
        colormap(bluered)
        %colorbar('horiz')
        subplot(1,2,2)
        pcolor(real(psiphys)');
        caxis([-0.005 0.005])
        shading('interp');
        axis equal;
        axis off;
        title 'Streamfunction';
        %colorbar('horiz')
        % subplot(2,3,4)
        % plot(kkk,log(vort))
        % axis([0 M 5 15])
        % subplot(2,3,5)
        % plot(kkk,log(ene))
        % axis([0 M -5 10])
        % subplot(2,3,3)
        % pcolor(real(ifft2(jacobfft(omfft,psifft,LX,LY)))');
        % %caxis([-0.002 0.002])
        % shading('interp')
        % axis equal
        % axis off
        % title 'Jacobian'
        % colorbar('horiz')
        if mod(n,10)==0
            aaaa= [ 'McW' num2str(10000+n) '.png']
            print('-dpng', aaaa)
        end
        pause(0.01)
    end
  end
