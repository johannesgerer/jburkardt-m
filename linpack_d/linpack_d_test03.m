function linpack_d_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests DCHUD.
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
  nz = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  For double precision, general storage,\n' );
  fprintf ( 1, '  DCHUD updates a Cholesky decomposition.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we use DCHUD to solve a\n' );
  fprintf ( 1, '  least squares problem R * b = z.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of equations is P = %d\n', p );
%
%  Initialize.
%
  r(1:p,1:p) = 0.0;
  z(1:p,1:nz) = 0.0;
  for i = 1 : p
    x(i) = i;
  end
%
%  Use DCHUD to form R, Z and RHO by adding X and Y a row at a time.
%  X is a row of the least squares matrix and Y the right hand side.
%
  seed = 123456789;

  for i = 1 : p
    [ row, seed ] = r8mat_uniform_01 ( 1, p, seed );
    y(1) = row(1:p) * x(1:p)';
    rho(1) = 0.0;
    [ r, z, rho, c, s ] = dchud ( r, ldr, p, row, z, p, nz, y, rho );
  end
%
%  Generate the least squares solution, b = inverse ( R ) * Z.
%
  for j = 1 : nz

    b(1:p,1) = z(1:p,j);
    job = 01;

    [ b, info ] = dtrsl ( r, ldr, p, b, job );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Solution vector # %d\n', j );
    fprintf ( 1, '  (Should be (1,2,3...,n))\n' );
    fprintf ( 1, '\n' );

    for i = 1 : p
      if ( i <= 5 | p-5 < i )
        fprintf ( 1, '  %6d  %14f\n', i, b(i,1) );
      end
      if ( i == 5 )
        fprintf ( 1, '  ......  ..............\n' );
      end
    end

  end

  return
end
