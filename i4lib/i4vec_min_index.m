function min_index = i4vec_min_index ( n, a )

%*****************************************************************************80
%
%% I4VEC_MIN_INDEX returns the index of the smallest entry in an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of integer values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A(N), the vector to be searched.
%
%    Output, integer MIN_INDEX, the index of the smallest entry.
%
  if ( n <= 0 )

    min_index = 0;

  else

    amin = a(1);
    min_index = 1;

    for i = 2 : n

      if ( a(i) < amin )
        amin = a(i);
        min_index = i;
      end

    end

  end

  return
end
