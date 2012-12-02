function [u,v] = vorttovel(ip,KM,x,y,omofp);

%*****************************************************************************80
%
%% VORTTOVEL ?
%
%  Discussion:
%
%    This function is discussed in chapter 10 of the reference.
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

%
%  Initialize.
%
  for k=1:KM
    for i=1:ip
      u(i,k)=0;
      v(i,k)=0;
      myi(i,k)=0;
      myj(i,k)=0;
    end
  end

  for i=1:ip
    xx(i)=0;
    yy(i)=0;
    zz(i)=0;
    ww(i)=0;
  end
%
%  Set up interval lengths and midpoints for contour integration.
%
  for k=1:KM
    [xx yy zz ww] = contourintdef(ip,x(:,k),y(:,k)); 
    for i = 1 : ip
      xm(i,k) = xx(i);
      ym(i,k) = yy(i);
      dx(i,k) = zz(i);
      dy(i,k) = ww(i);
    end
  end

  for k=1:KM

    for m=1:KM
      for i=1:ip
        [myi(i,m) myj(i,m) ]=contourint(ip,xm(:,m),ym(:,m),dx(:,m),dy(:,m),x(i,k),y(i,k));
      end
    end

    for m=1:KM
      for i=1:ip
        u(i,k) = u(i,k) - omofp(m) * myi(i,m);
        v(i,k) = v(i,k) - omofp(m) * myj(i,m);
      end
    end

  end

  return
end
