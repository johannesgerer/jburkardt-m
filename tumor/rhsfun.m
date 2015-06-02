function f = rhsfun ( x )

%*****************************************************************************80
%
%% RHSFUN evaluates the right hand side or forcing term in the equation.
%
%  Discussion:
%
%    This right hand side is chosen so that the solution of 
%
%      - Uxx + U = F
%      U'(0) = U'(1) = 0
%
%    is exactly 
%
%      U(x) = cos ( pi * x ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2005
%
%  Parameters:
%
%    Input, real X(*), the evaluation points.
%
%    Output, real F(*), the value of the right hand side at the 
%    evaluation points.
%
  u = cos ( pi * x );
  uxx = -pi * pi * u;

  f = - uxx + u;
  
  return
end
