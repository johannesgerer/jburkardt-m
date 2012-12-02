%% LEMKE_PRB tests the LEMKE code.
%
%  Modified:
%
%    05 December 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameter:
%
%    Inut, integer N, the order of the system.
%
%    Input, real M(N,N), the matrix.
%
%    Input, real Q(N), the right hand side vector.
%
%    Input, real Z_INIT(N), an initial estimate for the solution.
%
%    Output, real Z(N), the solution as computed by LEMKE.
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEMKE_PRB\n' );
  fprintf ( 1, '  Test LEMKE, which solves a linear complementarity problem.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Given an NxN matrix M and an N vector q,\n' );
  fprintf ( 1, '  we seek a vector z so that:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    0 <= z;\n' );
  fprintf ( 1, '    0 <= M * z + q;\n' );
  fprintf ( 1, '    z'' * ( M * z + q ) = 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Lemke''s algorithm requires an initial estimate for\n' );
  fprintf ( 1, '  the solution vector z.\n' );

  n = 2;
  z_init = rand ( n, 1 );
  M = [ 2.0, 0.0; 0.0, 2.0 ];
  q = [ 1.0, -1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix M:\n' );
  for ( i = 1 : n )
    for ( j = 1 : n )
      fprintf ( '  %8f', M(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Vector q:\n' );
  for ( i = 1 : n )
    fprintf ( 1, '  %2d  %8f\n', i, z_init(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial solution estimate z:\n' );
  for ( i = 1 : n )
    fprintf ( 1, '  %2d  %8f\n', i, z_init(i) );
  end

  [ z_final, error_flag ] = lemke ( M, q, z_init );

  if ( error_flag == 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEMKE Error 1:\n' );
    fprintf ( 1, '  Maximum number of iterations exceeded.\n' );

  elseif ( error_flag == 2 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEMKE Error 2:\n' );
    fprintf ( 1, '  Unbounded ray termination.\n' );

  elseif ( error_flag == 3 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEMKE Error 3:\n' );
    fprintf ( 1, '  Initial basis cannot be computed.\n' );
    fprintf ( 1, '  Try a different initial solution estimate!\n' );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Final solution estimate:\n' );
    for ( i = 1 : n )
      fprintf ( 1, '  %2d  %8f\n', i, z_final(i) );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Check the solution:\n' );
    fprintf ( 1, '\n' );

    t1 = M * z_final + q;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Value of M * z + q:\n' );
    fprintf ( 1, '\n' );
    for ( i = 1 : n )
      fprintf ( 1, '  %2d  %8f\n', i, t1(i) );
    end

    t2 = z_final' * ( M * z_final + q );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Value of z'' * ( M * z + q ) = %f\n', t2 );

  end
