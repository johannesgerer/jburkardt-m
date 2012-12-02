function value = func_set ( action, i )

%*****************************************************************************80
%
%% FUNC_SET sets the function to be returned by FUNC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION, the action to be carried out.
%    'COUNT' means the call is made to count the number of functions available.
%    'GET' means the call is made to find out the current function index.
%    'SET' means the call is made to set the current function index.
%
%    Input, integer I.
%    For 'SET', I is the user's new choice for the function.
%    Otherwise, I is ignored.
%
%    Output, integer VALUE;
%    For 'COUNT', VALUE is the number of functions available;
%    For 'GET', VALUE is the currently chosen function;
%    For 'SET', VALUE is the input value of I.
%
  persistent ival;
  
  if ( action(1) == 'C' )
    value = 11;
  elseif ( action(1) == 'G' )
    value = ival;
  elseif ( action(1) == 'S' )
    ival = i;
    value = i;
  else
    value = -1;        
  end

  return
end
