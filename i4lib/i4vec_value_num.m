function value_num = i4vec_value_num ( n, a, value )

%*****************************************************************************80
%
%% I4VEC_VALUE_NUM counts entries equal to a given value in an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of I4's.
%
%    In MATLAB, a better procedure would be
%
%    value_num = length ( find ( a == value ) );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects.
%
%    Input, integer A(N), the array to be indexed.
%
%    Input, integer VALUE, a value to be searched for.
%
%    Input, integer VALUE_NUM, the number of times the
%    value occurs.
%
  value_num = 0;

  for i = 1 : n

    if ( a(i) == value )
      value_num = value_num + 1;
    end

  end

  return
end
