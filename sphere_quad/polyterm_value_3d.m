function f = polyterm_value_3d ( n, x )

%*****************************************************************************80
%
%% POLYTERM_VALUE_3D evaluates a single polynomial term in 3D.
%
%  Discussion:
%
%    The polynomial term has the form:
%
%      F(X) = X(1)^E(1) * X(2)^E(2) * X(3)^E(3)
%
%    The exponents E(1:3) are set by calling POLYTERM_EXPONENT_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(3,N), the points where the polynomial term 
%    is to be evaluated.
%
%    Output, real F(N), the value of the polynomial term.
%
  e = [];
  e = polyterm_exponent ( 'GET', e );

  f(1:n,1) = 1.0;

  for i = 1 : 3

    if ( e(i) ~= 0 )
      f(1:n,1) = f(1:n,1) .* ( x(i,1:n).^e(i) )';
    end

  end
  
  return
end
