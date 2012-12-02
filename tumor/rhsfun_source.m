function rhs = rhsfun_source ( x, t, bb, nuk )

%% RHSFUN_SOURCE evaluates the source term for each equation.
%
%  Modified:
%
%    14 November 2005
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
