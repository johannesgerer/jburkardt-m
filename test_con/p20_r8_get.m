function value = p20_r8_get ( name, value )

%*****************************************************************************80
%
%% P20_R8_GET returns the value of a real parameter for problem 20.
%
%  Discussion:
%
%    The only legal input name is 'hold_value', which indicates the
%    value of the variable to be held fixed.
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
%    Output, real VALUE, the value of the variable.
%
  value = [];

  value = p20_r8_store ( 'get', name, value );

  return
end
