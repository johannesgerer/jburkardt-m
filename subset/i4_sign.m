function value = i4_sign ( x )

%*****************************************************************************80
%
%% I4_SIGN returns the sign of an integer.
%
%  Discussion:
%
%    I4_SIGN is +1 if the number is positive or zero, and it is -1 otherwise.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the number whose sign is desired.
%
%    Output, real VALUE, the sign of X.
%
  if ( 0 <= x )
    value = +1;
  else
    value = -1;
  end

  return
end
