function linpack_z_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests ZCHUD and ZTRSL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  p = 20;
  ldr = p;
  ldz = p;
  nz = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  Hermitian matrix\n' );
  fprintf ( 1, '  ZCHUD updates a Cholesky decomposition.\n' );
  fprintf ( 1, '  ZTRSL solves a triangular linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we use ZCHUD to solve a\n' );
  fprintf ( 1, '  least squares problem R * b = z.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of equations is P = %d\n', p );
%
%  Initialize.
%
  r(1:p,1:p) = 0.0;
  z(1:p,1:nz) = 0.0;

  for i = 1 : p
    x(i) = complex ( i, mod ( i, 2 ) );
  end
%
%  Use ZCHUD to form R, Z and RHO by adding X and Y a row at a time.
%  X is a row of the least squares matrix and Y the right hand side.
%
  seed = 123456789;

  for i = 1 : p
    [ row, seed ] = c8vec_uniform_01 ( p, seed );
    y(1) = row(1:p) * transpose ( x(1:p) );
    rho(1) = 0.0;
    [ r, z, rho, c, s ] = zchud ( r, ldr, p, row, z, ldz, nz, y, rho );

  end
%
%  Generate the least squares solution, b = inverse ( R ) * Z.
%
  for j = 1 : nz

    b(1:p) = z(1:p,j);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  RHS #%d\n', j );
    fprintf ( 1, '\n' );

    for i = 1 : p
      if ( i <= 5 | p-5 < i )
        fprintf ( 1, '  %8d  (%8f  %8f)\n', i, real ( b(i) ), imag ( b(i) ) );
      end
      if ( i == 5 )
        fprintf ( 1, '  ......  ..............\n' );
      end
    end

    job = 01;

    [ b, info ] = ztrsl ( r, ldr, p, b, job );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Solution vector #%d\n', j );
    fprintf ( 1, '  (Should be (1,1) (2,0), (3,1) (4,0) ...)\n' );
    fprintf ( 1, '\n' );

    for i = 1 : p
      if ( i <= 5 | p-5 < i )
        fprintf ( 1, '  %8d  (%8f  %8f)\n', i, real ( b(i) ), imag ( b(i) ) );
      end
      if ( i == 5 )
        fprintf ( 1, '  ......  ..............\n' );
      end
    end

  end

  return
end
