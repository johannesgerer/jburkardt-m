function twod_plotc(fig_num,x,e_conn,u,cval)
%-----------------------------------------------------------------------
%  twod_plotc.m - Produces a filled contour plot of triangular 
%                 finite element data.
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [] = twod_plotc(fig_num,x,e_conn,u,cval)
%
%  Variables:     fig_num
%                        Makes figure fig_num active     
%                 x 
%                        Nodal coordinates
%                 e_conn
%                        Element connectivities
%                 u
%                        Nodal data to be plotted
%                 cval
%                        max and min contour values (optional)
%-----------------------------------------------------------------------
  figure(fig_num)
  hold on

  [n_elems,ndof] = size(e_conn);
  [n_nodes,ndim] = size(x);
  


if (nargin<5)
     umin = min(u);
     umax = max(u);
%    % the following line is a kludge to get the color range right
%     patch([0 .001 0]',[0 0 0.001]',[(umin+umax)/2 umin umax]','EdgeColor','none')

 if (ndof == 3)
    colormap('jet')
    x3 = x;  x3(end,3) = 0;
%    u = (u-umin)/(umax-umin);
%    e_conn = [e_conn(:,1) e_conn(:,3) e_conn(:,2)];
    patch('Faces',e_conn,'Vertices',x3,'FaceVertexCData',u,'FaceColor','interp','EdgeColor','none')
  end
else
    umin = cval(1);
    umax = cval(2);
   % the following line is a kludge to get the color range right
    patch([0 .001 0]',[0 0 0.001]',[(umin+umax)/2 umin umax]','EdgeColor','none')
 if (ndof == 3)
    colormap('jet')
    x3 = x;  x3(end,3) = 0;
    
    x3(end+1:end+3,:) = [0 0 0;0.001 0 0;0 0.001 0];
    e_conn(n_elems+1,:) = [n_nodes+1 n_nodes+2 n_nodes+3];
    u = (u-umin)/(umax-umin);
    u(end+1:end+3) = [(umin+umax)/2 umin umax]';
%    e_conn = [e_conn(:,1) e_conn(:,3) e_conn(:,2)];
    patch('Faces',e_conn,'Vertices',x3,'FaceVertexCData',u,'FaceColor','interp','EdgeColor','none')
 end
end
%  
%   if (ndof == 3)
%     for i=1:n_elems
%       n1 = e_conn(i,1);  n2 = e_conn(i,2);  n3 = e_conn(i,3);
%  
%       x1 = x(n1,1); y1 = x(n1,2); u1 = u(n1);
%       x2 = x(n2,1); y2 = x(n2,2); u2 = u(n2);
%       x3 = x(n1,1); y3 = x(n1,2); u3 = u(n1);
%       x4 = x(n3,1); y4 = x(n3,2); u4 = u(n3);
% %     contourf([x1 x2; x3 x4],[y1 y2; y3 y4],[u1 u2; u3 u4],cval)
%       patch([x1 x2 x4],[y1 y2 y4],[u1 u2 u4]','EdgeColor','interp')
%     end
%   end
  
  if (ndof == 6)
    for i=1:n_elems
      n1 = e_conn(i,1);  n2 = e_conn(i,2);  n3 = e_conn(i,3);
      n4 = e_conn(i,4);  n5 = e_conn(i,5);  n6 = e_conn(i,6);

      x1 = x(n1,1); y1 = x(n1,2); u1 = u(n1);
      x2 = x(n2,1); y2 = x(n2,2); u2 = u(n2);
      x3 = x(n3,1); y3 = x(n3,2); u3 = u(n3);
      x4 = x(n4,1); y4 = x(n4,2); u4 = u(n4);
      x5 = x(n5,1); y5 = x(n5,2); u5 = u(n5);
      x6 = x(n6,1); y6 = x(n6,2); u6 = u(n6);
         
%     contourf([x1 x4; x1 x6],[y1 y4; y1 y6],[u1 u4; u1 u6],cval)
      patch([x1 x4 x6]',[y1 y4 y6]',[u1 u4 u6]','EdgeColor','interp')
%     contourf([x4 x2; x4 x5],[y4 y2; y4 y5],[u4 u2; u4 u5],cval)
      patch([x4 x2 x5]',[y4 y2 y5]',[u4 u2 u5]','EdgeColor','interp')
%     contourf([x6 x5; x6 x3],[y6 y5; y6 y3],[u6 u5; u6 u3],cval)
      patch([x6 x5 x3]',[y6 y5 y3]',[u6 u5 u3]','EdgeColor','interp')
%     contourf([x4 x5; x4 x6],[y4 y5; y4 y6],[u4 u5; u4 u6],cval)
      patch([x4 x5 x6]',[y4 y5 y6]',[u4 u5 u6]','EdgeColor','interp')
    end
  end

  axis equal;