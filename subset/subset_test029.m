function subset_test029 ( )

%*****************************************************************************80
%
%% TEST029 tests DECMAT_DET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n3 = 3;
  n4 = 4;
  dec_digit = 10;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST029\n' );
  fprintf ( 1, '  DECMAT_DET: determinant of a decimal matrix.\n' );
  fprintf ( 1, '\n' );
 
  k = 0;
  for i = 1 : n3
    for j = 1 : n3
      k = k + 1;
      a3(i,j) = k;
    end
  end

  b3(1:n3,1:n3) = 0;
 
  decmat_print ( n3, n3, a3, b3, '  The 123/456/789 matrix:' );

  [ dtop, dbot ] = decmat_det ( n3, a3, b3, dec_digit );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of the 123/456/789 matrix\n' );
  fprintf ( 1, '  %d*10^%d\n', dtop, dbot );
 
  for i = 1 : n4
    for j = 1 : n4
      r = 1.0 / ( i + j );
      [ a4(i,j), b4(i,j) ] = r8_to_dec ( r, dec_digit );
    end
  end
 
  decmat_print ( n4, n4, a4, b4, '  The Hilbert matrix:' );

  [ dtop, dbot ] = decmat_det ( n4, a4, b4, dec_digit  );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of the Hilbert matrix:\n' );
  fprintf ( 1, '  %d*10^%d\n', dtop, dbot );

  for i = 1 : n3
    for j = 1 : n3
      if ( i == j )
        a3(i,j) = 2;
      elseif ( i == j+1 | i == j-1 )
        a3(i,j) = -1;
      else
        a3(i,j) = 0;
      end
      b3(i,j) = 0;
    end
  end
 
  decmat_print ( n3, n3, a3, b3, '  The -1,2,-1 matrix:' );

  [ dtop, dbot ] = decmat_det ( n3, a3, b3, dec_digit );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of the -1,2,-1 matrix:\n' );
  fprintf ( 1, '  %d*10^%d\n', dtop, dbot );

  return
end
