function test125 ( )

%*****************************************************************************80
%
%% TEST125 tests R8MAT_DET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n3 = 3;
  n4 = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST125\n' );
  fprintf ( 1, '  R8MAT_DET: determinant of a real matrix.\n' );
  fprintf ( 1, '\n' );
 
  k = 0;
  for i = 1 : n3
    for j = 1 : n3
      k = k + 1;
      a3(i,j) = k;
    end
  end
 
  r8mat_print ( n3, n3, a3, '  The 123/456/789 matrix:' );

  det = r8mat_det ( n3, a3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of the 123/456/789 matrix is %f\n', det );
 
  for i = 1 : n4
    for j = 1 : n4
      a4(i,j) = 1.0 / ( i + j );
    end
  end
 
  r8mat_print ( n4, n4, a4, '  The Hilbert matrix:' );

  det = r8mat_det ( n4, a4 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of the Hilbert matrix is %f\n', det );
 
  for i = 1 : n3
    for j = 1 : n3
      if ( i == j )
        a3(i,j) = 2.0;
      elseif ( i == j+1 | i == j-1 )
        a3(i,j) = -1.0;
      else
        a3(i,j) = 0.0;
      end
    end
  end
 
  r8mat_print ( n3, n3, a3, '  The -1,2,-1 matrix:' );

  det = r8mat_det ( n3, a3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of the -1,2,-1 matrix is %f\n', det );
 
  return
end
