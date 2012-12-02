function value = p20_i4_get ( name )

%*****************************************************************************80
%
%% P20_I4_GET returns the value of an integer parameter for problem 20.
%
%  Discussion:
%
%    The only legal input name is 'hold_index', which indicates the
%    index of the variable to be held fixed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NAME, the name of the variable.
%
%    Output, integer VALUE, the value of the variable.
%
  value = [];
  value = p20_i4_store ( 'get', name, value );

  return
end
