function x = r85_np_fs ( n, a, b, x )

%*****************************************************************************80
%
%% R85_NP_FS factors and solves a R85 linear system.
%
%  Discussion:
%
%    The R85 storage format represents a pentadiagonal matrix as a 5 
%    by N array, in which each row corresponds to a diagonal, and 
%    column locations are preserved.  Thus, the original matrix is 
%    "collapsed" vertically into the array.
%
%    The factorization algorithm requires that each diagonal entry be nonzero.
%
%    No pivoting is performed, and therefore the algorithm may fail
%    in simple cases where the matrix is not singular.
%
%  Example:
%
%    Here is how a R85 matrix of order 6 would be stored:
%
%       *   *  A13 A24 A35 A46
%       *  A12 A23 A34 A45 A56
%      A11 A22 A33 A44 A55 A66
%      A21 A32 A43 A54 A65  *
%      A31 A42 A53 A64  *   *
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Cheney and Kincaid,
%    Numerical Mathematics and Computing,
%    1985, pages 233-236.
%
%  Parameters:
%
%    Input, integer N, the order of the linear system.
%
%    Input/output, real A(5,N),
%    On input, the pentadiagonal matrix.
%    On output, the data has been overwritten by factorization information.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution of the linear system.
%
  for i = 1 : n
    if ( a(3,i) == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R85_NP_FS - Fatal error!\n' );
      fprintf ( 1, '  A(3,%d) = 0.\n', i );
      return;
    end
  end

  for i = 2 : n-1

    xmult = a(2,i) / a(3,i-1);
    a(3,i) = a(3,i) - xmult * a(4,i-1);
    a(4,i) = a(4,i) - xmult * a(5,i-1);

    b(i) = b(i) - xmult * b(i-1);

    xmult = a(1,i+1) / a(3,i-1);
    a(2,i+1) = a(2,i+1) - xmult * a(4,i-1);
    a(3,i+1) = a(3,i+1) - xmult * a(5,i-1);

    b(i+1) = b(i+1) - xmult * b(i-1);

  end

  xmult = a(2,n) / a(3,n-1);
  a(3,n) = a(3,n) - xmult * a(4,n-1);

  x(n) = ( b(n) - xmult * b(n-1) ) / a(3,n);
  x(n-1) = ( b(n-1) - a(4,n-1) * x(n) ) / a(3,n-1);

  for i = n-2 : -1 : 1
    x(i) = ( b(i) - a(4,i) * x(i+1) - a(5,i) * x(i+2) ) / a(3,i);
  end

  return
end
