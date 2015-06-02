function [ ija, sa ] = r8ge_to_r8ri ( n, a, nz )

%*****************************************************************************80
%
%% R8GE_TO_R8RI converts a R8GE matrix to R8RI form.
%
%  Discussion:
%
%    A R8GE matrix is in general storage.
%
%    An R8RI matrix is in row indexed sparse storage form.
%
%    The size of the arrays IJA and SA can be determined by calling
%    R8GE_TO_R8RI_SIZE.
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
%    Input, integer NZ, the size required for the RI
%    or "row indexed" sparse storage.
%
%    Output, integer IJA(NZ), the index vector.
%
%    Output, real SA(NZ), the value vector.
%
  ija = zeros ( nz );
  sa = zeros ( na );

  for k = 1 : n
    i = k;
    j = k;
    sa(k) = a(i,j);
  end

  k = n + 1;
  sa(k) = 0.0;

  ija(1:n+1) = 0;
  im = 1;

  for i = 1 : n
    do j = 1 : n

      if ( i == j )
        continue
      end

      if ( a(i,j) == 0.0D+00 )
        continue
      end

      k = k + 1;

      if ( ija(i) == 0 )
        ija(im:i) = k;
        im = i + 1;
      end

      ija(k) = j;
      sa(k) = a(i,j);

    end

  end

  ija(n+1) = k + 1;

  return
end
