function r8vecs_print ( m, nvec, na, a, title )

%*****************************************************************************80
%
%% R8VECS_PRINT prints a packed R8VEC.
%
%  Example:
%
%    M = 5
%    NVEC = (/ 1, 4, 6, 11, 13, 14 /)
%    A = (/ 11, 12, 13, 21, 22, 31, 32, 33, 34, 35, 41, 42, 51 /)
%
%    11 12 13
%    21 22
%    31 32 33 34 35
%    41 42
%    51
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of vectors packed into A.
%
%    Input, integer NVEC(M+1), pointers to the first entry 
%    in each vector.
%
%    Input, integer NA, the number of entries in A.
%
%    Input, real A(NA), the packed vector.  The I-th vector
%    extends from A(NVEC(I)) to A(NVEC(I+1)-1).
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  khi = 0;

  for i = 1 : m

    n = nvec(i+1) - nvec(i);

    for jlo = 1 : 5 : n
      jhi = min ( jlo + 5 - 1, n );
      klo = khi + 1;
      khi = klo + ( jhi - jlo );
      if ( jlo == 1 )
        fprintf ( 1, '  %3d  ', i )
      else
        fprintf ( 1, '       ' );
      end
      for k = klo : khi
        fprintf ( 1, '%14.6g', a(k) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
