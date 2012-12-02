function [ xmin, index ] = i4vec_min ( n, x )

%*****************************************************************************80
%
%% I4VEC_MIN returns the minimum value of an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, integer X(N), the array.
%
%    Output, integer XMIN, the value of the smallest entry.
%
%    Output, integer INDEX, the index of the smallest entry.
%
  if ( n <= 0 )

    index = 0;
    xmin = 0.0;

  else

    xmin = x(1);
    index = 1;
    for i = 2 : n
      if ( x(i) < xmin )
        xmin = x(i);
        index = i;
      end 
    end

  end

  return
end
