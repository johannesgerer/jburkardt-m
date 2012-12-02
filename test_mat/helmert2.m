function a = helmert2 ( n, x )

%*****************************************************************************80
%
%% HELMERT2 returns a Helmert matrix based on a given vector.
%
%  Formula:
%
%    Row 1 = the vector, divided by its L2 norm.
%
%    Row 2 is computed by the requirements that it be orthogonal to row 1,
%    be nonzero only from columns 1 to 2, and have a negative diagonal.
%
%    Row 3 is computed by the requirements that it be orthogonal to
%    rows 1 and 2, be nonzero only from columns 1 to 3, and have a
%    negative diagonal, and so on.
%
%  Properties:
%
%    The first row of A should be the vector X, divided by its L2 norm.
%
%    A is orthogonal: A' * A = A * A' = I.
%
%    A is not symmetric: A' ~= A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    HO Lancaster,
%    The Helmert Matrices,
%    American Mathematical Monthly,
%    Volume 72, 1965, pages 4-12.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the vector that defines the first row.
%    X must not have 0 L2 norm, and its first entry must not be 0.
%
%    Output, real A(N,N), the matrix.
%
  a(1:n,1:n) = 0.0;

  x_norm_l2 = r8vec_norm_l2 ( n, x );

  if ( x_norm_l2 == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HELMERT2 - Fatal error!\n' );
    fprintf ( 1, '  Input vector has zero L2 norm.\n' );
    error ( 'HELMERT2 - Fatal error!' );
  end

  if ( x(1) == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HELMERT2 - Fatal error!\n' );
    fprintf ( 1, '  Input vector has X(1) = 0.\n' );
    error ( 'HELMERT2 - Fatal error!' );
  end

  w(1:n) = x(1:n);
  w(1:n) = w(1:n) / x_norm_l2;
  w(1:n) = w(1:n).^2;

  a(1,1:n) = sqrt ( w(1:n) );

  for i = 2 : n
    for j = 1 : i - 1
      a(i,j) = sqrt ( w(i) * w(j) / ( sum ( w(1:i) ) * sum ( w(1:i-1) ) ) );
    end
    a(i,i) = - sqrt ( sum ( w(1:i-1) ) / sum ( w(1:i) ) );
  end

  return
end
