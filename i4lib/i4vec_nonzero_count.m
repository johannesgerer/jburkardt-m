function value = i4vec_nonzero_count ( n, a )

%*****************************************************************************80
%
%% I4VEC_NONZERO_COUNT counts the nonzero entries in an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the input array.
%
%    Input, integer A(N), an array.
%
%    Output, integer VALUE, the number of nonzero entries.
%
  value = 0;

  for i = 1 : n
    if ( a(i) ~= 0 )
      value = value + 1;
    end
  end

  return
end
