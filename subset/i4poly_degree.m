function degree = i4poly_degree ( na, a )

%% I4POLY_DEGREE returns the degree of a polynomial.
%
%  Discussion:
%
%    The degree of a polynomial is the index of the highest power
%    of X with a nonzero coefficient.
%
%    The degree of a constant polynomial is 0.  The degree of the
%    zero polynomial is debatable, but this routine returns the
%    degree as 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NA, the dimension of A.
%
%    Input, integer A(1:NA+1), the coefficients of the polynomial.
%
%    Output, integer DEGREE, the degree of A.
%
  degree = na;

  while ( 0 < degree )

    if ( a(degree+1) ~= 0 )
      return
    end

    degree = degree - 1;

  end

  return
end
