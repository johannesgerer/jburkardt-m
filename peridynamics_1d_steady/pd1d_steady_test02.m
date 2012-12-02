function pd1d_steady_test02 ( problem )

%*****************************************************************************80
%
%% PD1D_STEADY_TEST02 tests with fixed epsilon and decreasing H.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 February 2012
%
%  Author:
%
%    Marta D'Elia
%
%  Parameters:
%
%    Input, PROBLEM, a handle for the function that returns problem data.
%
  epsilon  = 0.01; 
  exponent = 4:8;
  E1       = zeros(length(exponent),1);
  E2       = zeros(length(exponent),1);
  delta    = 1./2.^exponent;

  for i = 1:length(exponent)
    [u,A,l,w,err1,err2]= nonlocal_diffusion(2^(exponent(i)),epsilon,problem);
    E1(i)     = err1; 
    E2(i)     = err2;    
  end
%
%  H1 convergence analysis.
%
  r1    = E1(1:end-1)./E1(2:end);
  rate1 = log ( r1 ) / log ( 2.0 );
  disp('H1 norm convergence rates')
  for i = 1 : length(rate1)
    disp(['N = ', num2str(2^(exponent(i))),': ', num2str(rate1(i))]);
  end

  H1rate = mean ( rate1 );
%
%  L2 convergence analysis.
%
  r2    = E2(1:end-1)./E2(2:end); % ratio between subsequent errors
  rate2 = log(r2)/log(2);         % convergence rate
  disp('L2 norm convergence rates')
  for i = 1:length(rate2)
    disp(['N = ', num2str(2^(exponent(i))),': ', num2str(rate2(i))]);
  end

  L2rate = mean ( rate2 );
%
%  Plot the convergence results.
%
  loglog(delta,delta.^H1rate,'--k',delta,.1*delta.^L2rate,'.-.k',delta,E1,'-sb',delta,E2,'db-','Linewidth',2,'Markersize',7)
  grid
  xlabel('log_{10}h','Fontsize', 16)
  ylabel('log_{10}Error','Fontsize', 16)
  legend(['rate ', num2str(H1rate)],['rate ', num2str(L2rate)],'||u-u_{ex}||_{H^1(\Omega)}','||u-u_{ex}||_{L^2(\Omega)}')
  title ( 'Convergence for fixed epsilon, decreasing H' )
  print ( '-dpng', 'plot2.png' );
  close

  return
end
