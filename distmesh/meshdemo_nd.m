function meshdemo_nd

%*****************************************************************************80
%
%% MESHDEMO_ND runs some N-dimensional examples of the use of DISTMESH.
%
%  Licensing:
%
%    (C) 2004 Per-Olof Persson. 
%    See COPYRIGHT.TXT for details.
%
%  Modified:
%
%    14 December 2004
%
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%

%
%  Put the random number generator into a fixed initial state.
%
  rand ( 'state', 111 );
%
%  Set the rendering method for the current figure to OpenGL.
%
  set ( gcf, 'rend', 'opengl' );

  disp ( '(9) 3-D Unit ball' )
  fd = inline('sqrt(sum(p.^2,2))-1','p');
  [p,t] = distmesh_nd(fd,@huniform,0.2,[-1,-1,-1;1,1,1],[]);
  post_nd ( p, t )

  disp ( '(10) Cylinder with hole' )
  [p,t] = distmesh_nd(@p10_fd,@p10_fh,0.1,[-1,-1,-1;1,1,1],[]);
  post_nd ( p, t )

  return
end
function post_nd ( p, t )

%*****************************************************************************80
%
  disp ( sprintf ( '   (press any key)' ) )
  disp ( ' ' )
  pause

  return
end
function d = fd10 ( p )

%*****************************************************************************80
%
  r=sqrt(p(:,1).^2+p(:,2).^2);
  z=p(:,3);

  d1=r-1;
  d2=z-1;
  d3=-z-1;
  d4=sqrt(d1.^2+d2.^2);
  d5=sqrt(d1.^2+d3.^2);
  d=dintersect(dintersect(d1,d2),d3);
  ix=d1>0 & d2>0;
  d(ix)=d4(ix);
  ix=d1>0 & d3>0;
  d(ix)=d5(ix);

  d=ddiff(d,dsphere(p,0,0,0,0.5));

  return
end
function h=fh10(p)

%*****************************************************************************80
%
  h1=4*sqrt(sum(p.^2,2))-1;
  h=min(h1,2);

  return
end
