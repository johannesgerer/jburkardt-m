function value = r8vec_min_pos ( n, a )

%*****************************************************************************80
%
%% R8VEC_MIN_POS returns the minimum positive value of an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries.
%
%    Input, real A(N), the array.
%
%    Output, real VALUE, the smallest positive entry,
%    or R8_HUGE if no entry is positive.
%
  r8_huge = 1.0E+30;

  value = r8_huge;

  for i = 1 : n
    if ( 0.0 < a(i) )
      value = min ( value, a(i) );
    end
  end

  return
end
