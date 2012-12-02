function value = i4vec_width ( n, a )

%*****************************************************************************80
%
%% I4VEC_WIDTH returns the "width" of an I4VEC.
%
%  Discussion:
%
%    The width of an integer vector is simply the maximum of the widths of
%    its entries.
%
%    The width of a single integer is the number of characters 
%    necessary to print it.
%
%    The width of an integer vector can be useful when the vector is 
%    to be printed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A(N), the vector.
%
%    Output, integer VALUE, the width of the vector.
%
  value = -1;

  for i = 1 : n
    value = max ( value, i4_width ( a(i) ) );
  end

  return
end
