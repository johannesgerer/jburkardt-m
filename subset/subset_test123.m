function test123 ( )

%*****************************************************************************80
%
%% TEST123 tests RATMAT_DET.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST123\n' );
  fprintf ( 1, '  RATMAT_DET: determinant of a rational matrix.\n' );
  fprintf ( 1, '\n' );
 
  k = 0;
  for i = 1 : n3
    for j = 1 : n3
      k = k + 1;
      a3(i,j) = k;
    end
  end

  b3(1:n3,1:n3) = 1;
 
  ratmat_print ( n3, n3, a3, b3, '  The 123/456/789 matrix:' );

  [ idtop, idbot ] = ratmat_det ( n3, a3, b3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of the 123/456/789 matrix = %d / %d\n', idtop, idbot );
 
  for i = 1 : n3
    for j = 1 : n3
      a3(i,j) = 1;
      b3(i,j) = i + j;
    end
  end
 
  ratmat_print ( n3, n3, a3, b3, '  The Hilbert matrix:' );

  [ idtop, idbot ] = ratmat_det ( n3, a3, b3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of the Hilbert matrix = %d / %d\n', idtop, idbot );
 
  for i = 1 : n3
    for j = 1 : n3
      if ( i == j )
        a3(i,j) = 2;
      elseif ( i == j+1 | i == j-1 )
        a3(i,j) = -1;
      else
        a3(i,j) = 0;
      end
      b3(i,j) = 1;
    end
  end
 
  ratmat_print ( n3, n3, a3, b3, '  The -1 2 -1 matrix:' );

  [ idtop, idbot ] = ratmat_det ( n3, a3, b3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of the -1,2,-1 matrix = %d / %d\n', idtop, idbot );

  return
end
