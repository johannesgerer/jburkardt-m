function uvplot ( u, v, x, y, scale, istep )

%*****************************************************************************80
%
%% UVPLOT plots a velocity vector field.
%
%  Discussion:
%
%    This function is discussed in chapter 20 of the reference.
%
%  Modified:
%
%    08 December 2009
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
%    Input, real U(M,N), V(M,N), the horizontal and vertical components
%    of velocity.
%
%    Input, real X(M,N), Y(M,N), the coordinates of the  nodes.
%
%    Input, real SCALE, a scale factor for the velocity vectors.
%
%    Input, integer ISTEP, indicates that only every STEP-th velocity
%    is to be plotted.  STEP should be 1 or greater.
%
  val=size(u);
  M=val(1);
  N=val(2);

  for i=round(istep/2+1):istep:M-1
    for j=round(istep/2+1):istep:N-1
      xx(1)=x(i,j);
      yy(1)=y(i,j);
      xx(2)=x(i,j)+(u(i,j)+u(i+1,j))/2*scale;
      yy(2)=y(i,j)+(v(i,j)+v(i,j+1))/2*scale;
      plot(xx,yy,xx(1),yy(1),'o','MarkerSize',2)
      hold on
    end
  end

  return
end
