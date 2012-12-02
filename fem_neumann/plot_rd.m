function plot_rd ( T, X, W, ca )

%*****************************************************************************80
%
%% PLOT_RD makes two plots of the reaction-diffusion solution.
%
%  Discussion:
%
%    This function makes a "surface plot" of W(T,X), and
%    a plot of the spatial L2 norm of the solution over time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2011
%
%  Author:
%
%   Eugene Cliff
%
%  Reference:
%
%    Jeffrey Borggaard, John Burkardt, John Burns, Eugene Cliff,
%    Working Notes on a Reaction Diffusion Model: a Finite Element Formulation.
%
%  Parameters:
%
%    T - array of time values    (nt)
%
%    X - array of spatial values (nx)
%
%    W - solution array (nt \times nx)
%
%    ca- coef in nonlinear polynomial (used to label plot)
%

% plot at most 100 time points

  it = ceil(length(T)/100);
  figure; 
  surf ( X, T(1:it:end), W(1:it:end,:) );
  xlabel('\bf axial location'); 
  ylabel('\bf time');
  zlabel('\bf w')
  vv = axis; 
  axis([X([1 end]) T([1 end]) vv([5 6])]);
 
  title_cell = cell(2,1); % Holds strings for two-line title
  title_cell{1} = ['\bf Reaction Diffusion: n = ' int2str(length(X)-1)];
  title_cell{2} = [' \bf Reaction Function: ' ...
                      fix_sign(ca(1),0)  ...
                      fix_sign(ca(2),1)  ...
                      fix_sign(ca(3),2)  ...
                      fix_sign(ca(4),3)];                           
  title(title_cell)
%
%  Compute and plot time history of solution norm 
%
  temp = zeros(ceil(length(T)/it),1);
  wtmp = W(1:it:end,:);
  for ii=1:length(temp)
    temp(ii) = l2_norm(wtmp(ii,:));
  end

  figure; 
  plot ( T(1:it:end), temp, 'r', 'LineWidth', 2 );
  grid on
  xlabel('time'); 
  ylabel('|| w ||^2'); 
  title(title_cell)
 
  return
end
function val = l2_norm(f)

%*****************************************************************************80
%
%% L2_NORM estimates the L2 norm of F using the trapezoidal rule.
%
%  Discussion:
%
%    The vector F is assumed to contain the values of a function at
%    equally spaced points in the interval [0,1].  In that case,
%    the L2 norm of F can be estimated by the trapezoidal rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2011
%
%  Author:
%
%   Eugene Cliff
%
  n = length ( f ) - 1;

  val = ( 0.5 * f(1)^2 + sum ( f(2:end-1).^2 ) + 0.5 * f(end)^2 ) / n;

  return
end
function str_out = fix_sign(c, p)

%*****************************************************************************80
%
% Assemble a string consisting of sign(ca) * abs(ca) w**p
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2011
%
%  Author:
%
%   Eugene Cliff
%
  ps = int2str(p);

  if abs(c) <= eps
    str_out  =  '';
  elseif c > 0 
    str_out = [' + ' num2str(c)  ' w**' ps];
  else
    str_out = [' - ' num2str(-c) ' w**' ps];
  end

  return
end
