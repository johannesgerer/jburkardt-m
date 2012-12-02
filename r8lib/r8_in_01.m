function value = r8_in_01 ( x )

%*****************************************************************************80
%
%% R8_IN_01 is TRUE if the value is in the range [0,1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the value.
%
%    Output, logical VALUE, is TRUE if 0 <= X <= 1.
%
  if ( x < 0.0 || 1.0 < x )
    value = 0;
  else
    value = 1;
  end

  return
end
