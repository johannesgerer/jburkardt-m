function f = f_function ( x, y1, y2, Md, Nd, L )

%*****************************************************************************80
%
%% F_FUNCTION: RHS function from exact coefficient Q and the exact solution U.
%
%  Discussion:
%
%    The differential equation has the form:
%
%      ( q(x) u_x(x) )_x = f(x)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Parameters:
%
%    x = physical space point of length one
%
%    y1 = stochastic vector of length Md (from the expansion for u)
%
%    y2 = stochastic vector of length Nd (from the expansion for q)
%
%    Md = dimension of the probability space for u
%
%    Nd = dimension of the probability space for q
%
%    L = the correlation length of the random variables
%
  [n_nodes, dim] = size(x);
  f = zeros( n_nodes, 1 );

  for n=1:Nd

  	for m=1:Md

  	 f = f + qn(n) * um( m ) * pn(y2, n) * pm(y1, m) * ...
  	 ( -(pi/L)^2 * m^2 .* sin((m*pi*x)/L) .* cos((n*pi*x)/L) ...
  	 -n*m * (pi/L)^2 * cos((m*pi*x)/L) .* sin((n*pi*x)/L) );

 	end

  end

  return
end
function p_m = pm( y, m )

%*****************************************************************************80
%
%% PM
%
  p_m = y(m);

  return
end
function p_n = pn( y, n )

%*****************************************************************************80
%
%% PN
%
  p_n = y(n);

  return
end
function q_n = qn( n )

%*****************************************************************************80
%
%% QN
%
  q_n = 1;

  return
end
function u_m = um( m )

%*****************************************************************************80
%
%% UM
%
 u_m = 1;

 return
end
