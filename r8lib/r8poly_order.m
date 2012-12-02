function order = r8poly_order ( na, a )

%*****************************************************************************80
%
%% R8POLY_ORDER returns the order of a polynomial in power sum form.
%
%  Discussion:
%
%    The order of a constant polynomial is 1.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NA, the number of coefficients.
%
%    Input, real A(1:NA), the coefficients of the polynomials.
%
%    Output, integer ORDER, the order of the polynomial.
%
  order = na;

  while ( 1 < order )

    if ( a(order) ~= 0.0 )
      return
    end

    order = order - 1;

  end

  return
end
