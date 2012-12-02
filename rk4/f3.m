function value = f3 ( t, u )

%*****************************************************************************80
%
%% F3 evaluates the right hand side of a particular ODE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T, the current time.
%
%    Input, real U, the current solution value.
%
%    Output, real VALUE, the value of the derivative, dU/dT.
%  
  value = u * cos ( t );
  
  return
end
