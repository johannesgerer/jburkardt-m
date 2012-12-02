function aminz_index = i4vec_aminz_index ( n, a )

%*****************************************************************************80
%
%% I4VEC_AMINZ_INDEX returns the smallest nonzero magnitude in an I4VEC.
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
%    04 November 2005
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
%    Output, integer AMINZ_INDEX, the entry of the smallest nonzero magnitude.
%    If all entries are zero, AMINZ_INDEX is 0.
%
  aminz = 0;
  aminz_index = 0;

  for i = 1 : n

    if ( a(i) ~= 0 )

      if ( aminz_index == 0 | abs ( a(i) ) < aminz )
        aminz = abs ( a(i) );
        aminz_index = i;
      end

    end

  end

  return
end
