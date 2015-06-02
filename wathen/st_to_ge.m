function a = st_to_ge ( I, J, X )

%*****************************************************************************80
%
%% ST_TO_GE converts a sparse tripet (ST) matrix to general (GE) storage.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I(ntriplets), J(ntriplets), the row and column indices.
%
%    Input, real X(ntriplets), the nonzero matrix values.
%
%    Output, real A(M,N), the corresponding full storage matrix.
%

%
%  Guess the number of rows and columns.
%
  m = max ( I );
  n = max ( J );
%
%  Copy the data as a vector.
%
  a(I+(J-1)*m) = X;
%
%  Reshape as a matrix.
%
  a = reshape ( a, m, n );

  return
end

