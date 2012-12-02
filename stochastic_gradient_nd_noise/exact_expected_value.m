function [ E_u_hat, E_q_exact ] = exact_expected_value ( x, Md, Nd, L )

%*****************************************************************************80
%
%% EXACT_EXPECTED_VALUE: the exact expected value of the solution and control.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
  [ n_nodes, dim ] = size ( x );

  E_u_hat = zeros ( n_nodes, 1 );

  E_q_exact = zeros ( n_nodes, 1 );

  for m = 1 : Md

  	E_u_hat = E_u_hat + um( m ) .* cm( x, m, L );

  end

  E_u_hat = E_u_hat .* (1/2)^Md

  for n=1:Nd

  	E_q_exact = E_q_exact + qn( n ) .* an( x, n, L );

  end

  E_q_exact = E_q_exact .* (1/2)^Nd

  return
end
function c_m = cm( x, m, L )

%*****************************************************************************80
%
%% CM
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
  c_m = sin((m*pi*x)/L);

  return
end
function u_m = um( m )

%*****************************************************************************80
%
%% UM
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
 u_m = 1;

  return
end
function a_n = an( x, n, L )

%*****************************************************************************80
%
%% AN
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
  a_n = cos((n*pi*x)/L);

  return
end
function q_n = qn( n )

%*****************************************************************************80
%
%% QN
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
 q_n = 1;

 return
end
