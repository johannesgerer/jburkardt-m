function imin = i4vec_imin ( n, a )

%*****************************************************************************80
%
%% I4VEC_IMIN computes the index of the minimum element of an I4VEC.
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
%    Input, integer N, the number of entries in the array.
%
%    Input, integer A(N), the array.
%
%    Output, integer IMIN, the index of the smallest entry.
%
  if ( n <= 0 )

    imin = 0;

  else

    amin = a(1);
    imin = 1;

    for i = 2 : n

      if ( a(i) < amin )
        amin = a(i);
        imin = i;
      end

    end

  end

  return
end
