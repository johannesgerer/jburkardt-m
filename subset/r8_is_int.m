function value = r8_is_int ( r )

%*****************************************************************************80
%
%% R8_IS_INT determines if an R8 represents an integer value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the number to be checked.
%
%    Output, logical VALUE, is TRUE if R is an integer value.
%
  value = ( r == round ( r ) );

  return
end
