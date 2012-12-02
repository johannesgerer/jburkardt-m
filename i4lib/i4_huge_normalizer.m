function value = i4_huge_normalizer ( )

%*****************************************************************************80
%
%% I4_HUGE_NORMALIZER returns the "normalizer" for I4_HUGE.
%
%  Discussion:
%
%    The value returned is 1 / ( I4_HUGE + 1 ).
%
%    For any I4, it should be the case that
%
%     -1 < I4 * I4_HUGE_NORMALIZER < 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real I4_HUGE_NORMALIZER, the "normalizer"
%    for I4_HUGE.
%
  value = 4.656612873077392578125E-10;

  return
end
