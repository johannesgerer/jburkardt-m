function [ a_lu, info ] = r83_np_fa ( n, a )

%*****************************************************************************80
%
%% R83_NP_FA factors a R83 matrix without pivoting.
%
%  Discussion:
%
%    The R83 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%    Because this routine does not use pivoting, it can fail even when
%    the matrix is not singular, and it is liable to make larger
%    errors.
%
%    R83_NP_FA and R83_NP_SL may be preferable to the corresponding
%    LINPACK routine SGTSL for tridiagonal systems, which factors and solves
%    in one step, and does not save the factorization.
%
%  Example:
%
%    Here is how a R83 matrix of order 5 would be stored:
%
%       *  A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54  *
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 2.
%
%    Input, real A(3,N), the tridiagonal matrix.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
%    Output, real A_LU(3,N), factorization information.
%
  info = 0;

  a_lu(1:3,1:n) = a(1:3,1:n);

  for i = 1 : n-1

    if ( a_lu(2,i) == 0.0E+00 )
      info = i;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R83_NP_FA - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      return;
    end
%
%  Store the multiplier in L.
%
    a_lu(3,i) = a_lu(3,i) / a_lu(2,i);
%
%  Modify the diagonal entry in the next column.
%
    a_lu(2,i+1) = a_lu(2,i+1) - a_lu(3,i) * a_lu(1,i+1);

  end

  if ( a_lu(2,n) == 0.0E+00 )
    info = n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R83_NP_FA - Fatal error!\n' );
    fprintf ( 1, '  Zero pivot on step %d\n', info );
    return;
  end

  return
end
