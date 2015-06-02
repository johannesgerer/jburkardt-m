function value = i4_sign3 ( i )

%*****************************************************************************80
%
%% I4_SIGN3 returns the three-way sign of an I4.
%
%  Discussion:
%
%    The three-way sign returns a 0 if the argument is 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number whose sign is desired.
%
%    Output, integer VALUE, the sign of I.
%
  if ( i < 0 )
    value = -1;
  elseif ( i == 0 )
    value = 0;
  else
    value = +1;
  end

  return
end
