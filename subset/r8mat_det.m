function det = r8mat_det ( n, a )

%*****************************************************************************80
%
%% R8MAT_DET finds the determinant of an R8MAT.
%
%  Discussion:
%
%    A brute force calculation is made.
%
%    This routine should only be used for small matrices, since this
%    calculation requires the summation of N! products of N numbers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of A.
%
%    Input, real A(N,N), the matrix whose determinant is desired.
%
%    Output, real DET, the determinant of the matrix.
%
  b = [];
  more = 0;
  even = [];
  det = 0.0;

  while ( 1 )

    [ b, more, even ] = perm_next ( n, b, more, even );

    if ( even )
      term = 1.0;
    else
      term = -1.0;
    end

    for i = 1 : n
      term = term * a(i,b(i));
    end

    det = det + term;

    if ( ~more )
      break
    end

  end

  return
end
