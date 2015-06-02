function value = i4_abs ( a )

%*****************************************************************************80
%
%% I4_ABS returns the absolute value of an I4s.
%
%  Discussion:
%
%    An I4 is an integer value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the value.
%
%    Output, real VALUE, the absolute value.
%
  a = floor ( a );

  if ( a < 0 )
    value = - a;
  else
    value = a;
  end

  return
end
