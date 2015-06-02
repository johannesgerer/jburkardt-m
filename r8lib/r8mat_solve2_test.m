function r8mat_solve2_test ( )

%*****************************************************************************80
%
%% R8MAT_SOLVE2_TEST tests R8MAT_SOLVE2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 4;

  a1 = [ ...
    1.0, 3.0; ...
    2.0, 4.0 ]';
  a2 = [ ...
    2.0, 1.0, 1.0; ...
    1.0, 1.0, 0.0; ...
    1.0, 0.0, 1.0 ]';
  a3 = [ ...
    1.0, 2.0, 1.0, 3.0; ...
    0.0, 1.0, 2.0, 1.0; ...
    0.0, 0.0, 3.0, 2.0; ...
    1.0, 3.0, 0.0, 1.0 ]';
  a4 = [ ...
    2.0, 1.0, 3.0; ...
    4.0, 2.0, 6.0; ...
    1.0, 4.0, 5.0 ]';
  b1 = [ 5.0, 11.0 ];
  b2 = [ 4.0, 2.0, 2.0 ];
  b3 = [ 5.0, 11.0, 16.0, 15.0 ];
  b4 = [ 13.0, 17.0, 20.0 ];
  n_test = [ 2, 3, 4, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_SOLVE2_TEST\n' );
  fprintf ( 1, '  R8MAT_SOLVE2 is a linear solver.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
 
    n = n_test ( test );

    if ( test == 1 )
      a(1:n,1:n) = a1(1:n,1:n);
      b(1:n) = b1(1:n);
    elseif ( test == 2 )
      a(1:n,1:n) = a2(1:n,1:n);
      b(1:n) = b2(1:n);
    elseif ( test == 3 )
      a(1:n,1:n) = a3(1:n,1:n);
      b(1:n) = b3(1:n);
    elseif ( test == 4 )
      a(1:n,1:n) = a4(1:n,1:n);
      b(1:n) = b4(1:n);
    end 

    r8vec_print ( n, b, '  Right hand side:' );
 
    [ x, ierror ] = r8mat_solve2 ( n, a, b );
 
    fprintf ( 1, '\n' );
    if ( ierror == 0 )
      fprintf ( 1, '  The system is nonsingular.\n' );
    elseif ( ierror == 1 )
      fprintf ( 1, '  The system is singular, but consistent.\n' );
    elseif ( ierror == 2 )
      fprintf ( 1, '  The system is singular and inconsistent.\n' );
    end
   
    r8vec_print ( n, x, '  Computed solution:' );
 
  end
 
  return
end
