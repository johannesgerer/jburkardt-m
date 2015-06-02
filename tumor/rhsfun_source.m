function rhs = rhsfun_source ( x, t, bb, nuk )

%*****************************************************************************80
%
%% RHSFUN_SOURCE evaluates the source term for each equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2005
%
%  Parameters:
%
  global kappa
  global m
  global vzero
            
  if ( nuk == 1 )
    rhs = vzero * kappa * ( 1.0 - cos ( 2 * pi * x ) )^m * exp ( -t ) * bb; 
  elseif ( nuk == 2 ) 
    rhs =  0.0;
  elseif ( nuk == 3 )
    rhs = 0.0;
  elseif ( nuk == 4 )
    rhs = 0.0;
  end

  return
end
