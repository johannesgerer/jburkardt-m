function q = q_exact ( x, y, Nd, L )

%*****************************************************************************80
%
%% Q_EXACT evaluates the exact control coefficient function.
%
%  Discussion:
%
%    That is,
%
%      ( q(x) u_x(x) )_x = f(x)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Parameters:
%
%    Input, x, physical space point of length one
%
%    Input, y, stochastic vector of length Nd
%
%    Input, Nd, dimension of the probability space for q
%
%    Input, L, the correlation length of the random variables
%
  [ n_nodes, dim ] = size ( x );

  q = zeros ( n_nodes, 1 );

  for n = 1 : Nd

  	q = q + qn ( n ) .* an ( x, n, L ) .*  pn ( y, n );

  end

  return
end
function p_n = pn ( y, n )

%*****************************************************************************80
%
%% PN
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
  p_n = y(n);

  return
end
function a_n = an ( x, n, L )

%*****************************************************************************80
%
%% AN ?
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
  a_n = cos ( ( n * pi * x ) / L );

  return
end
function q_n = qn ( n )

%*****************************************************************************80
%
%% QN ?
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
  q_n = 1;

  return
end
