function [ y, next ] = p31_equil ( neqn, next )

%*****************************************************************************80
%
%% P31_EQUIL returns equilibrium solutions of problem p31.
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
  a = p31_param ( 'GET', 'A' );
  b = p31_param ( 'GET', 'B' );
  c = p31_param ( 'GET', 'C' );
  d = p31_param ( 'GET', 'D' );

  if ( next == 0 )
    next = 1;
    y(1:neqn,1) = [ 0.0; 0.0 ];
  elseif ( next == 1 & c ~= 0.0 & d ~= 0.0 )
    next = 2;
    y(1:neqn,1) = [ d / c; a / b ];
  else
    next = 0;
    y = [];
  end

  return
end

