function [] = oned_plot_hermite(fig_num,x,e_conn,w,wp)

%*****************************************************************************80
%
  w = w(:);
  wp = wp(:);
  figure(fig_num)
  hold on
  [n_elements, tmp] = size(e_conn);
  
  r = linspace(-1,1,11);  wt = zeros(size(r));
  for n_el=1:n_elements
    nodes_local            = e_conn(n_el,:);
    x_local                = x(nodes_local,:);
    [x_g,w_g,phi0,phi1,p0_x,p1_x,p0_xx,p1_xx] = ...
                                           oned_shapeherm(x_local,r,wt);
    
    w_plot = phi0*w(nodes_local) + phi1*wp(nodes_local);
    plot(x_g,w_plot)
  end
  hold off
  %         up_plot = p0_x*u(nodes_local)' + p1_x*up(nodes_local)';
%         plot(x_g,up_plot,'r')
%     
%         upp_plot = p0_xx*u(nodes_local)' + p1_xx*up(nodes_local)';
%         plot(x_g,upp_plot,'g')

  return
end

