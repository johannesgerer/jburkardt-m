function p20_i4_set ( name, value )

%*****************************************************************************80
%
%% P20_I4_SET sets the value of an integer parameter for problem 20.
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
%    Input, integer VALUE, the value of the variable.
%
  p20_i4_store ( 'set', name, value );

  return
end
