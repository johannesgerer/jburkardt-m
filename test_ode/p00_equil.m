function [ next, y ] = p00_equil ( test, neqn, next )

%*****************************************************************************80
%
%% P00_EQUIL returns equilibrium solutions of any problem.
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
%    Input, integer TEST, the problem number.
%
%    Input, integer NEQN, the number of equations.
%
%    Input, integer NEXT, the index of the previous equilibrium, 
%    or 0 for the first call.
%
%    Output, integer NEXT, the index of the current equilibrium, 
%    or 0 if there are no more.
%
%    Output, real Y(NEQN), the "next" equilibrium solution, if any.
%
  if ( test == 1 )
    [ y, next ] = p01_equil ( neqn, next );
  elseif ( test == 2 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 3 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 4 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    elseif ( next == 1 )
      next = 2;
      y(1:neqn,1) = 20.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 5 )
    next = 0;
  elseif ( test == 6 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = [ 0.0; 0.0 ];
    elseif ( next == 1 )
      next = 2;
      y(1:neqn,1) = [ 1.0; 1.0 ];
    else
      next = 0;
      y = [];
    end
  elseif ( test == 7 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = [ 0.0; 0.0; 0.0 ];
    else
      next = 0;
      y = [];
    end
  elseif ( test == 8 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = [ 0.0; 0.0; 0.0 ];
    else
      next = 0;
      y = [];
    end
  elseif ( test == 9 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = [ 0.0; 0.0; 0.0 ];
    else
      next = 0;
      y = [];
    end
  elseif ( test == 10 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = [ 1.0; 0.0; 0.0 ];
    elseif ( next == 1 )
      next = 2;
      y(1:neqn,1) = [ 0.0; 1.0; 0.0 ];
    elseif ( next == 2 )
      next = 3;
      y(1:neqn,1) = [ 0.0; 0.0; 1.0 ];
    else
      next = 0;
      y = [];
    end
  elseif ( test == 11 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 12 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 13 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 14 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 15 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 16 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 17 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 18 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 19 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 20 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 21 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 22 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 23 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 24 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 25 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 26 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 27 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 28 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0
    else
      next = 0;
      y = [];
    end
  elseif ( test == 29 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 30 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  elseif ( test == 31 )
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
  elseif ( test == 32 )
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
  elseif ( test == 33 )
    if ( next == 0 )
      next = 1;
      y(1:2) = [ 0.0, 0.0 ];
    else
      next = 0;
      y = [];
    end
  elseif ( test == 34 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = [ 0.0; 0.0 ];
    elseif ( next == 1 )
      next = 2;
      y(1:neqn,1) = [ pi; 0.0 ];
    else
      next = 0;
      y = [];
    end
  elseif ( test == 35 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = [ 0.0; 0.0 ];
    else
      next = 0;
      y = [];
    end
  elseif ( test == 36 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = [ 0.0; 0.0 ];
    elseif ( next == 1 )
      next = 2;
      y(1:neqn,1) = [ 1.0; 0.0 ];
    elseif ( next == 2 )
      next = 3;
      y(1:neqn,1) = [ -1.0; 0.0 ];
    else
      next = 0;
      y = [];
    end
  elseif ( test == 37 )
    if ( next == 0 )
      next = 1;
      y(1:neqn,1) = [ 0.0; 0.0 ];
    else
      next = 0;
      y = [];
    end
  elseif ( test == 38 )
    [ y, next ] = p38_equil ( neqn, next );
  elseif ( test == 39 )
    next = 0;
    y = [];
  elseif ( test == 40 )
    if ( next = 0 )
      next = 1;
      y(1:neqn,1) = 0.0;
    else
      next = 0;
      y = [];
    end
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_EQUIL - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_EQUIL - Fatal error!' );
  end

  return
end
