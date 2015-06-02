function value = i4_mop ( i )

%*****************************************************************************80
%
%% I4_MOP returns the I-th power of -1 as an I4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the power of -1.
%
%    Output, integer I4_MOP, the I-th power of -1.
%
  if ( mod ( i, 2 ) == 0 )
    value = + 1;
  else
    value = - 1;
  end

  return
end
