function amin_index = r8vec_amin_index ( n, a )

%*****************************************************************************80
%
%% R8VEC_AMIN_INDEX returns the index of the minimum absolute value in an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), the array.
%
%    Output, integer AMIN_INDEX, the index of the entry of smallest magnitude.
%
  if ( n <= 0 )

    amin_index = 0;

  else

    amin_index = 1;
    amin = abs ( a(1) );

    for i = 2 : n
      if ( abs ( a(i) ) < amin )
        amin_index = i;
        amin = abs ( a(i) );
      end
    end

  end

  return
end
