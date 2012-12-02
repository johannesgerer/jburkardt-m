function location = i4vec_find ( n, a, value )

%*****************************************************************************80
%
%% I4VEC_FIND finds the first occurrence of a value in an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, integer A(N), the array.
%
%    Input, integer VALUE, the value being sought.
%
%    Output, integer LOCATION, the first location in A where 
%    VALUE occurs, or -1 if VALUE never occurs.
%
  location = -1;

  for i = 1 : n

    if ( a(i) == value )
      location = i;
      return
    end

  end

  return
end
