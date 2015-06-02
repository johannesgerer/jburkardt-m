function a = r8ri_to_r8ge ( nz, ija, sa, n )

%*****************************************************************************80
%
%% R8RI_TO_R8GE converts an R8RI matrix to R8GE form.
%
%  Discussion:
%
%    An R8RI matrix is in row indexed sparse storage form.
%
%    A R8GE matrix is in general storage.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Press, Brian Flannery, Saul Teukolsky, William Vetterling,
%    Numerical Recipes in FORTRAN: The Art of Scientific Computing,
%    Third Edition,
%    Cambridge University Press, 2007,
%    ISBN13: 978-0-521-88068-8,
%    LC: QA297.N866.
%
%  Parameters:
%
%    Input, integer NZ, the size required for the RI
%    or "row indexed" sparse storage.
%
%    Input, integer IJA(NZ), the index vector.
%
%    Input, real SA(NZ), the value vector.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix stored in GE 
%    or "general" format.
%
  a = zeros ( n, n );

  for k = 1 : n
    i = k;
    j = k;
    a(i,j) = sa(k);
  end

  for i = 1 : n
    for k = ija(i) : ija(i+1) - 1
      j = ija(k);
      a(i,j) = sa(k);
    end
  end

  return
end
