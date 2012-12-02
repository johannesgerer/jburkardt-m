function l = fem_basis_md ( m, i, x )

%*****************************************************************************80
%
%% FEM_BASIS_MD evaluates an arbitrary M-dimensional basis function.
%
%  Discussion:
%
%    This routine evaluates the generalization of the formula used for
%    the 1D, 2D and 3D cases.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer I(M+1), the integer barycentric
%    coordinates of the basis function, 0 <= I(1:M+1).
%    The polynomial degree D = sum(I(1:M+1)).
%
%    Input, real X(M), the evaluation point.
%
%    Output, real L, the value at X of the basis function designated by I.
%

%
%  Augment the X vector.
%
  x(m+1) = 1.0 - sum ( x(1:m) );
%
%  Determine the degree.
%
  d = sum ( i(1:m+1) );

  l = 1.0;

  for q = 1 : m + 1
   for p = 0 : i(q) - 1
      l = l * ( d * x(q) - p ) / ( i(q) - p );
    end
  end

  return
end
