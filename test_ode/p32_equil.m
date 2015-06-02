function [ y, next ] = p32_equil ( neqn, next )

%*****************************************************************************80
%
%% P32_EQUIL returns equilibrium solutions of problem p32.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NEQN, the number of equations.
%
%    Input, integer NEXT, the index of the previous
%    equilibrium, which should be 0 on first call.
%
%    Output, real Y(NEQN), the "next" equilibrium solution, if any.
%
%    Output, integer NEXT, the index of the current equilibrium, 
%    or 0 if there are no more.
%
  beta = p32_param ( 'GET', 'BETA' );
  rho = p32_param ( 'GET', 'RHO' );
  sigma = p32_param ( 'GET', 'SIGMA' );

  if ( next == 0 )
    next = 1;
    y(1:neqn,1) = [ 0.0, 0.0, 0.0 ];
  elseif ( rho <= 1.0 )
    next = 0;
    y = [];
  elseif ( next == 1 )
    next = 2;
    t = rho - 1.0;
    s = sqrt ( beta * ( rho - 1.0 ) );
    y(1:neqn,1) = [ s; s, t ];
  elseif ( next == 2 )
    next = 3;
    t = rho - 1.0;
    s = sqrt ( beta * ( rho - 1.0 ) );
    y(1:neqn,1) = [ -s; -s; t ];
  else
    next = 0;
    y = [];
  end

  return
end

