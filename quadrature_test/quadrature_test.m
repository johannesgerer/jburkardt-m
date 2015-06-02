function quadrature_test ( quad_filename )

%*****************************************************************************80
%
%% QUADRATURE_TEST investigates quadrature rule accuracy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRATURE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Investigate the accuracy of a multidimensional quadrature\n' );
  fprintf ( 1, '  rule by integrating test functions.\n' );
%
%  Get the quadrature file root name:
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST:\n' );

    quad_filename = input ( '  Enter the "root" name of the quadrature files.' );

  end
%
%  Create the names of:
%    the quadrature X file;
%    the quadrature W file;
%    the quadrature R file.
%
  quad_x_filename = strcat ( quad_filename, '_x.txt' );
  quad_w_filename = strcat ( quad_filename, '_w.txt' );
  quad_r_filename = strcat ( quad_filename, '_r.txt' );
%
%  Summarize the input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRATURE_TEST: User input:\n' );
  fprintf ( 1, '  Quadrature rule X file = "%s".\n', quad_x_filename );
  fprintf ( 1, '  Quadrature rule W file = "%s".\n', quad_w_filename );
  fprintf ( 1, '  Quadrature rule R file = "%s".\n', quad_r_filename );
%
%  Read the X file.
%
  [ dim_num, point_num ] = r8mat_header_read ( quad_x_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
  fprintf ( 1, '  Number of points  = %d\n', point_num );

  x = r8mat_data_read ( quad_x_filename, dim_num, point_num );
%
%  Read the W file.
%
  [ dim_num2, point_num2 ] = r8mat_header_read ( quad_w_filename );

  if ( dim_num2 ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n');
    fprintf ( 1, '  one value on each line.\n' );
    error ( 'QUADRATURE_TEST - Fatal error!' );
  end

  if ( point_num2 ~= point_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n' );
    fprintf ( 1, '  the same number of lines as the abscissa file.\n' );
    error ( 'QUADRATURE_TEST - Fatal error!' );
  end

  w = r8mat_data_read ( quad_w_filename, 1, point_num );
%
%  Read the R file.
%
  [ dim_num2, point_num2 ] = r8mat_header_read ( quad_r_filename );

  if ( dim_num2 ~= dim_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have the same\n' );
    fprintf ( 1, '  number of values on each line as the abscissa file\n' );
    fprintf ( 1, '  does.\n' );
    error ( 'QUADRATURE_TEST - Fatal error!' );
  end

  if ( point_num2 ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have two lines.\n' );
    error ( 'QUADRATURE_TEST - Fatal error!' );
  end

  r = r8mat_data_read ( quad_r_filename, dim_num, 2 );
%
%  Ready to start the tests.
%
  volume1 = abs ( prod ( r(1:dim_num,2) - r(1:dim_num,1) ) );

  problem_num = get_problem_num (  );

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  Prob   Dim      Points          Approx          Exact           Error\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num
%
%  Set problem data to default values.
%
    p00_default ( problem, dim_num );
%
%  Get region type.
%
    region = p00_region ( problem );

    if ( strncmpi ( region, 'box', 3 ) )

      integral = p00_exact ( problem, dim_num );

      [ a, b ] = p00_lim ( problem, dim_num );

      volume2 = p00_volume ( problem, dim_num );
%
%  Map the abscissas to the [A,B] hypercube.
%
      for dim = 1 : dim_num
        x2(dim,1:point_num) = ...
        ( ( r(dim,2) - x(dim,1:point_num)            ) * a(dim)   ...
        + (            x(dim,1:point_num) - r(dim,1) ) * b(dim) ) ...
        / ( r(dim,2)                      - r(dim,1) );
      end
%
%  Evaluate the function at the abscissas.
%
      f = p00_f ( problem, dim_num, point_num, x2 );
%
%  Compute the weighted estimate.
%
      quad_est = w(1:point_num) * f(1:point_num)' * volume2 / volume1;

      if ( integral == r8_huge ( integral ) )

        fprintf ( 1, '  %4d  %4d  %10d  %14f  %s  %s\n', ...
          problem, dim_num, point_num, quad_est, ...
          '--------------', '--------------' );

      else

        quad_err = abs ( quad_est - integral );

        fprintf ( 1, '  %4d  %4d  %10d  %14f  %14f  %14f\n', ...
          problem, dim_num, point_num, quad_est, integral, quad_err );

      end

    end

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRATURE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
