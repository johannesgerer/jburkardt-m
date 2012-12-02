function x = r8but_sl ( n, mu, a, b, job )

%*****************************************************************************80
%
%% R8BUT_SL solves a R8BUT system.
%
%  Discussion:
%
%    The R8BUT storage format is used for a banded upper triangular matrix.
%    The matrix is assumed to be zero above the MU-th superdiagonal.
%    The matrix is stored in an MU+1 by N array.
%    Columns are preserved.
%
%    The diagonal is stored in row MU+1 of the array.
%    The first superdiagonal in row MU, columns 2 through N.
%    The second superdiagonal in row MU-1, columns 3 through N.
%    The MU-th superdiagonal in row 1, columns MU+1 through N.
%
%  Example:
%
%    N = 5, MU = 2
%
%    A11 A12 A13   0   0
%      0 A22 A23 A24   0
%      0   0 A33 A34 A35
%      0   0   0 A44 A45
%      0   0   0   0 A55
%                --- ---
%                    ---
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer MU, the upper bandwidth.
%
%    Input, real A(MU+1,N), the R8BUT matrix.
%
%    Input, real B(N), the right hand side.
%
%    Input, integer JOB, is 0 to solve the untransposed system,
%    nonzero to solve the transposed system.
%
%    Output, real X(N), the solution vector.
%
  x(1:n) = b(1:n);

  if ( job == 0 )

    for j = n : -1 : 1
      x(j) = x(j) / a(j-j+mu+1,j);
      jlo = max ( 1, j - mu );
      x(jlo:j-1) = x(jlo:j-1) - a(jlo-j+mu+1:j-1-j+mu+1,j)' * x(j);
    end

  else

    for j = 1 : n
      x(j) = x(j) / a(j-j+mu+1,j);
      ihi = min ( n, j + mu );
      for i = j + 1 : ihi
        x(i) = x(i) - a(j-i+mu+1,i) * x(j);
      end
    end

  end

  return
end
