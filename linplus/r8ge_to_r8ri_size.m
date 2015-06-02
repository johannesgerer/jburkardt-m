function nz = r8ge_to_r8ri_size ( n, a )

%*****************************************************************************80
%
%% R8GE_TO_R8RI_SIZE determines the size of an R8RI matrix.
%
%  Discussion:
%
%    N spaces are always used for the diagonal entries, plus a dummy.
%    The remaining spaces store off-diagonal nonzeros.
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
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the matrix stored in GE 
%    or "general" format.
%
%    Output, integer NZ, the size required for the RI
%    or "row indexed" sparse storage.
%
  nz = n + 1;

  for i = 1 : n
    for j = 1 : n
      if ( i ~= j )
        if ( a(i,j) ~= 0.0 )
          nz = nz + 1;
        end
      end
    end
  end

  return
end
