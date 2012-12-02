function [ xmax, index ] = i4vec_max ( n, x )

%*****************************************************************************80
%
%% I4VEC_MAX returns the maximum value in an I4VEC.
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
%    Output, integer XMAX, the value of the largest entry.
%
%    Output, integer INDEX, the index of the largest entry.
%
  if ( n <= 0 )

    index = 0;
    xmax = 0.0;

  else

    index = 1;
    xmax = x(1);

    for i = 2 : n
      if ( xmax < x(i) )
        xmax = x(i);
        index = i;
      end
    end

  end

  return
end
