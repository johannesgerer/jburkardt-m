function[err]= spectralekman(N)

%*****************************************************************************80
%
%% SPECTRALEKMAN ?
%
%  Discussion:
%
%    This function is discussed in chapter 8 of the reference.
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
  nu=0.01;
  h=100;
  f=0.0001;
  tauy=0;
  taux=10^(-6)*10*10*0;
  pressy=9.81*1/1000000;
  pressx=0;
  KM=400;
  dek=sqrt(2*nu/f);

% RESOLUTION and PLOT

  for j=1:N
    s(j)=2*sqrt(2*h)/(pi*(2*j-1));
    phih(j)=sqrt(2/h)*(-1)^(j-1);
    eigen(j)=(2*j-1)^2*pi*pi*nu/(4*h*h);
    FX(j)=-pressx*s(j)+taux*phih(j);
    FY(j)=-pressy*s(j)+tauy*phih(j);
    a(j)=(eigen(j)*FX(j)+f*FY(j))/(eigen(j)^2+f^2);
    b(j)=(eigen(j)*FY(j)-f*FX(j))/(eigen(j)^2+f^2);
  end

  for k=1:KM
    U(k)=0;
    V(k)=0;
  end

  for k=1:KM
    z(k)=(k-1)*h/(KM-1);
    U(k)=0;
    V(k)=0;
    uex(k)=0;
    vex(k)=0;
    for j=N:-1:1
      U(k)=U(k)+a(j)*sqrt(2/h)*sin( (2*j-1)*pi/2*z(k)/h);
      V(k)=V(k)+b(j)*sqrt(2/h)*sin( (2*j-1)*pi/2*z(k)/h);
    end
  end

% plot(U,z,V,z)
% pause
% plot(U,V)
% axis equal
% pause
% exaxt?

  for k=1:KM
    [uex(k),vex(k)]=ekmanh(h/dek,z(k)/dek);
    %uex(k)=uex(k)*taux/nu*dek;
    %vex(k)=vex(k)*taux/nu*dek;
    uex(k)=-(1+uex(k))*pressy/f;
    vex(k)=-vex(k)*pressy/f;
  end

  plot(uex,z,vex,z,U,z,'-.',V,z,'-.')
  xlabel('velocity');
  ylabel('z');

  pause

  err=0;
  for k=1:KM
    err=err+(U(k)-uex(k))^2+(V(k)-vex(k))^2;
  end
  err=sqrt(err/KM);
  for kk=1:N;
    aa(kk)=log(a(kk)*a(kk));
    xx(kk)=log(kk);
  end
  bar(xx,aa+40);
  xlabel('log(j)');
  ylabel('log(a_j^2)');

  pause

  return
end


