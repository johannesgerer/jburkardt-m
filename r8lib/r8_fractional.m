function value = r8_fractional ( x )

%*****************************************************************************80
%
%% R8_FRACTIONAL returns the fractional part of an R8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the fractional part of X.
%
  value = abs ( x ) - real ( floor ( abs ( x ) ) );

  return
end
