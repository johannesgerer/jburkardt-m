function amin_index = i4vec_amin_index ( n, a )

%*****************************************************************************80
%
%% I4VEC_AMIN_INDEX returns the index of the smallest magnitude in an I4VEC.
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
%    Input, integer N, the number of entries to be checked.
%
%    Input, integer A(N), the vector to be checked.
%
%    Output, integer AMIN_INDEX, the entry of the smallest magnitude.
%
  if ( n <= 0 )

    amin_index = 0;

  else

    aamin = a(1);
    amin_index = 1;

    for i = 2 : n

      if ( abs ( a(i) ) < aamin )
        aamin = abs ( a(i) );
        amin_index = i;
      end

    end

  end

  return
end
