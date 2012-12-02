function [ xmax, index ] = r8vec_max ( n, x )

%*****************************************************************************80
%
%% R8VEC_MAX returns the maximum value in an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real X(N), the array.
%
%    Output, real XMAX, the value of the largest entry.
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
